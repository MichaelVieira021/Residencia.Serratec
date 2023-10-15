package com.serratec.classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import com.serratec.conexao.Conexao;
import com.serratec.dao.ClienteDAO;

public class ListaClientes {
	private Conexao con;
	private String schema;
	private ArrayList<Cliente> listacliente = new ArrayList<>();
	
	public ListaClientes (Conexao con, String schema) {
		this.con = con;
		this.schema = schema;
		
		carregarListaClientes();
	}
	
	public void adicionarClienteLista(Cliente c) {
		this.listacliente.add(c);
	}
	
	public Cliente localizarCliente(int idCliente) {
		Cliente localizado = null;
		
		for (Cliente c : listacliente) {
			if (c.getIdcliente() == idCliente) {
				localizado = c;
				break;
			}
		}		
	
		return localizado;
	}
	
 	private void carregarListaClientes() {
		ClienteDAO cdao = new ClienteDAO(con, schema);
		
		ResultSet tabela = cdao.carregarClientes();
		this.listacliente.clear();
		
		try {
			tabela.beforeFirst();
			
			while (tabela.next()) {							
				this.listacliente.add(dadosCliente(tabela));				
			}
			tabela.close();
		
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private Cliente dadosCliente(ResultSet tabela) { 
		Cliente c = new Cliente();
		String dtNasc; 
		
		try {
			dtNasc = tabela.getString("dt_nascimento");
			if (dtNasc != null)
				c.setDt_nascimento(LocalDate.parse(dtNasc));
				c.setNome(tabela.getString("nome"));
				c.setEndereco(tabela.getString("endereco"));
				c.setCpf(tabela.getString("cpf"));			
				c.setEmail(tabela.getString("email"));
				c.setTelefone(tabela.getString("telefone"));
				c.setIdcliente(tabela.getInt("idcliente"));

			return c;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<Cliente> getListacliente() {
		return listacliente;
	}

	public void setListacliente(ArrayList<Cliente> listacliente) {
		this.listacliente = listacliente;
	}
	
}
