package com.serratec.classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import com.serratec.conexao.Conexao;
import com.serratec.dao.PedidoDAO;
import com.serratec.dao.ProdutoCarrinhoDAO;
import com.serratec.classes.Empresa.ProdutoCarrinho;

public class ListaPedidos {
	private Conexao con;
	private String schema;
	private ArrayList<Pedido> listapedidos = new ArrayList<>();
	private ArrayList<ProdutoCarrinho> listaCarrinho = new ArrayList<>();

	
	public ListaPedidos(Conexao con, String schema, int i) {
		this.con = con;
		this.schema = schema;
		
		if(i == 1) carregarListaPedidos();
		else carregarListaPedidosCarrinho();
	}
	
 	public ArrayList<Pedido> getListapedidos() {
		return listapedidos;
	}

	public ArrayList<ProdutoCarrinho> getListaCarrinho() {
		return listaCarrinho;
	}


	public void setListaCarrinho(ArrayList<ProdutoCarrinho> listaCarrinho) {
		this.listaCarrinho = listaCarrinho;
	}


	public void setListapedidos(ArrayList<Pedido> listapedidos) {
		this.listapedidos = listapedidos;
	}

	private void carregarListaPedidos() {
 		PedidoDAO peddao = new PedidoDAO(con, schema);
		
		ResultSet tabela = peddao.carregarPedido();
		this.listapedidos.clear();
		
		try {
			tabela.beforeFirst();
			
			while (tabela.next()) {							
				this.listapedidos.add(dadosPedido(tabela));				
			}
			
			tabela.close();
		
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	public void carregarListaPedidosCarrinho() {
 		ProdutoCarrinhoDAO peddao = new ProdutoCarrinhoDAO(con, schema);
		
		ResultSet tabela = peddao.carregarProdutoCarrinho();
		this.listaCarrinho.clear();
		
		try {
			tabela.beforeFirst();
			
			while (tabela.next()) {							
				this.listaCarrinho.add(dadosCarrinho(tabela));				
			}
			
			tabela.close();
		
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private ProdutoCarrinho dadosCarrinho(ResultSet tabela) { 
		try {
			ProdutoCarrinho p = new ProdutoCarrinho();
			p.setIdpedidoitem(tabela.getInt("idpedido"));
			p.setIdproduto(tabela.getInt("idproduto"));
			p.setQuantidade(tabela.getInt("quantidade"));
			
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
 	
	private Pedido dadosPedido(ResultSet tabela) { 
		Pedido p = new Pedido();
		String dtEmissao; 

		try {
			dtEmissao = tabela.getString("dt_emissao");
			if (dtEmissao != null)
				p.setDt_emissao(LocalDate.parse(dtEmissao));
			p.setIdcliente(tabela.getInt("idcliente"));
			p.setIdpedido(tabela.getInt("idpedido"));
			
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
