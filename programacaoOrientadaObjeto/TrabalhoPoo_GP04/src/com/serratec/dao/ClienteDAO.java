package com.serratec.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.serratec.conexao.Conexao;
import com.serratec.classes.Cliente;


public class ClienteDAO {
	private Conexao conexao;
	private String schema;
	
	PreparedStatement pInclusao;
	PreparedStatement pAlteracao;
	PreparedStatement pExclusao;
	
	public ClienteDAO(Conexao conexao, String schema) { 
		this.conexao = conexao;
		this.schema = schema;
		prepararSqlInclusao();
		prepararSqlAlteracao();
		prepararSqlExclusao();
	}
	
	//-------------------------------------------------------
	private void prepararSqlInclusao() {
		String sql = "insert into "+ this.schema + ".cliente";	
		sql += " (nome, cpf, email, telefone, dt_nascimento, endereco)";
		sql += " values ";
		sql += " (?, ?, ?, ?, ?, ?)";
		
		try {
			this.pInclusao =  conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private void prepararSqlAlteracao() {
		String sql = "update "+ this.schema + ".cliente";	
		sql += " set nome = ?,";
		sql += " cpf = ?,";
		sql += " email = ?,";
		sql += " telefone = ?,";
		sql += " dt_nascimento = ?,";
		sql += " endereco = ?";
		sql += " where idcliente = ?";
		
		try {
			this.pAlteracao =  conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private void prepararSqlExclusao() {
		String sql = "delete from "+ this.schema + ".cliente";
		sql += " where idcliente = ? ";
		
		try {
			this.pExclusao = conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	//-------------------------------------------------------
	public int incluirCliente(Cliente cliente) {
		try {							
			pInclusao.setString(1, cliente.getNome());
			pInclusao.setString(2, cliente.getCpf());
			pInclusao.setString(3, cliente.getEmail());
			pInclusao.setString(4, cliente.getTelefone());
			pInclusao.setDate(5, Date.valueOf(cliente.getDt_nascimento()));
			pInclusao.setString(6,cliente.getEndereco());
			
			return pInclusao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nCliente nao incluído.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}
	
	public int alterarCliente(Cliente cliente) {
		try {
			pAlteracao.setString(1, cliente.getNome());
			pAlteracao.setString(2, cliente.getCpf());
			pAlteracao.setString(3, cliente.getEmail());
			pAlteracao.setString(4, cliente.getTelefone());
			pAlteracao.setDate  (5, Date.valueOf(cliente.getDt_nascimento()));
			pAlteracao.setString(6, cliente.getEndereco());
			pAlteracao.setInt   (7, cliente.getIdcliente());
			System.out.println("Cliente alterado com Sucesso.");
			return pAlteracao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nCliente nao alterado.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}

	public int excluirCliente(Cliente cliente) {
		try {
			pExclusao.setInt(1, cliente.getIdcliente());	
			
			return pExclusao.executeUpdate();
		} catch  (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nCliente nao incluído.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}
	
	//-------------------------------------------------------
	public ResultSet carregarClientes() {
		ResultSet tabela;				
		String sql = "select * from " + this.schema + ".cliente order by idcliente";
		
		tabela = conexao.query(sql);
			
		return tabela;
	}
	
	public ArrayList<Cliente> carregarClienteMenu() {
        ArrayList<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT idcliente, nome FROM " + this.schema + ".cliente ORDER BY idcliente";

        ResultSet tabela = conexao.query(sql);

        try {
            while (tabela.next()) {
                Cliente cliente = new Cliente(tabela.getInt("idcliente"), tabela.getString("nome"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clientes;
    }
	
    public Cliente buscarClientePorIdCliente(int id) {		
		String sql = "SELECT nome";
		sql += " FROM " + this.schema + ".cliente";
		sql += " WHERE idcliente = " + id;
		
        Cliente c = new Cliente();   
        ResultSet tabela = conexao.query(sql);
		try {
			tabela.next();
		    String nome = tabela.getString("nome");
		    c.setNome(nome);
		    
		} catch (SQLException e) {
		    e.printStackTrace();
		}
        return c;
    }

}
