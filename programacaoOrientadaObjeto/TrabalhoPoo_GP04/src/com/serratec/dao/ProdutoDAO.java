package com.serratec.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.serratec.classes.Produto;
import com.serratec.conexao.Conexao;

public class ProdutoDAO {
	private Conexao conexao;
	private String schema;
	
	PreparedStatement pInclusao;
	PreparedStatement pAlteracao;
	PreparedStatement pExclusao;
	
	//constructor
	public ProdutoDAO(Conexao conexao, String schema) { 
		this.conexao = conexao;
		this.schema = schema;
		prepararSqlInclusao();
		prepararSqlAlteracao();
		prepararSqlExclusao();
	}
	
	//------------------------------------------------------------
	private void prepararSqlInclusao() {
		String sql = "insert into "+ this.schema + ".produto";	
		sql += " (nome, descricao, vl_custo, vl_venda, qtd_estoque, idcategoria)";
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
		String sql = "update "+ this.schema + ".produto";	
		sql += " set nome = ?,";
		sql += " descricao = ?,";
		sql += " vl_custo = ?,";
		sql += " vl_venda = ?,";
		sql += " qtd_estoque = ?,";
		sql += " idcategoria = ?";
		sql += " where idproduto = ?";
		
		try {
			this.pAlteracao =  conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();	
		}
	}

	private void prepararSqlExclusao() {
		String sql = "delete from "+ this.schema + ".produto";
		sql += " where idproduto = ?" ;
		
		try {
			this.pExclusao = conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	//------------------------------------------------------------
	public int incluirProduto(Produto produto) {
		try {		
							
			pInclusao.setString(1, produto.getNome());
			pInclusao.setString(2, produto.getDescricao());
			pInclusao.setDouble(3, produto.getVl_custo());
			pInclusao.setDouble(4, produto.getVl_venda());
			pInclusao.setInt(5, produto.getQtd_estoque());
			pInclusao.setInt(6, produto.getIdcategoria());
			
			return pInclusao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nProduto não incluído.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}

	public int alterarProduto(Produto produto) {
		try {
			pAlteracao.setString(1, produto.getNome());
			pAlteracao.setString(2, produto.getDescricao());
			pAlteracao.setDouble(3, produto.getVl_custo());
			pAlteracao.setDouble(4, produto.getVl_venda());
			pAlteracao.setInt   (5, produto.getQtd_estoque());
			pAlteracao.setInt   (6, produto.getIdcategoria());
			pAlteracao.setInt   (7, produto.getIdproduto());
			
			return pAlteracao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nProduto não alterado.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}
	
	public int excluirProduto(Produto produto) {		
		try {
			pExclusao.setInt(1, produto.getIdproduto());	
			
			return pExclusao.executeUpdate();
		}catch  (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nProduto nao incluído.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}

	//------------------------------------------------------------
	public ResultSet carregarProduto() {
		ResultSet tabela;				
		String sql = "select * from " + this.schema + ".produto as prod";
		sql += " JOIN " + this.schema + ".categoria as cat";
		sql += " ON cat.idcategoria = prod.idcategoria"; 
		tabela = conexao.query(sql);
		
		return tabela;
	}
	
	public ArrayList<Produto> carregarProdutoMenu() {
        ArrayList<Produto> produtos = new ArrayList<>();
        String sql = "SELECT idproduto, nome, qtd_estoque FROM " + this.schema + ".produto ORDER BY qtd_estoque DESC";

        ResultSet tabela = conexao.query(sql);

        try {
            while (tabela.next()) {
                Produto produto = new Produto(tabela.getInt("idproduto"), tabela.getString("nome"), tabela.getInt("qtd_estoque"));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }
	
	public Produto carregarProdutoMenu2(int id) {
		Produto produto = new Produto();
        String sql = "SELECT idproduto, nome, qtd_estoque FROM " + this.schema + ".produto where idproduto = "+id;

        ResultSet tabela = conexao.query(sql);

        try {
            while (tabela.next()) {
                produto.setIdproduto(tabela.getInt("idproduto"));
                produto.setNome(tabela.getString("nome"));
                produto.setQtd_estoque(tabela.getInt("qtd_estoque"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produto;
    }
}
