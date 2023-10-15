package com.serratec.classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.serratec.conexao.Conexao;
import com.serratec.dao.ProdutoDAO;

public class ListaProdutos {
	private Conexao con;
	private String schema;
	private ArrayList<Produto> listaProdutos = new ArrayList<>();
	
	public ListaProdutos (Conexao con, String schema) {
		this.con = con;
		this.schema = schema;
		
		carregarListaProdutos();
	}

	public void adicionarProdutoLista(Produto prod) {
		this.listaProdutos.add(prod);
	}
	
	public Produto localizarProduto(String NomeProduto) {
		Produto localizado = null;
		
		for (Produto prod : listaProdutos) {
			if (prod.getNome() == NomeProduto) {
				localizado = prod;
				break;
			}
		}		
		return localizado;
	}
	
 	private void carregarListaProdutos() {
		ProdutoDAO proddao = new ProdutoDAO(con, schema);
		
		ResultSet tabela = proddao.carregarProduto();
		this.listaProdutos.clear();
		
		try {
			tabela.beforeFirst();
			
			while (tabela.next()) {							
				this.listaProdutos.add(dadosProduto(tabela));				
			}
			
			tabela.close();
		
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private Produto dadosProduto(ResultSet tabela) { 
		try {
			Produto prod = new Produto();
			Categoria cat = new Categoria();
			cat.setNm_categoria(tabela.getString("nm_categoria"));
			prod.setNome(tabela.getString("nome"));
			prod.setDescricao(tabela.getString("descricao"));
			prod.setVl_custo(tabela.getDouble("vl_custo"));			
			prod.setVl_venda(tabela.getDouble("vl_venda"));
			prod.setQtd_estoque(tabela.getInt("qtd_estoque"));
			prod.setIdcategoria(tabela.getInt("idcategoria"));
			prod.setIdproduto(tabela.getInt("idproduto"));
			prod.setCategoria(cat);
			
			return prod;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Conexao getCon() {
		return con;
	}
	public void setCon(Conexao con) {
		this.con = con;
	}
	public String getSchema() {
		return schema;
	}
	public void setSchema(String schema) {
		this.schema = schema;
	}
	public ArrayList<Produto> getListaProdutos() {
		return listaProdutos;
	}
	public void setListaProdutos(ArrayList<Produto> listaProdutos) {
		this.listaProdutos = listaProdutos;
	}
}
