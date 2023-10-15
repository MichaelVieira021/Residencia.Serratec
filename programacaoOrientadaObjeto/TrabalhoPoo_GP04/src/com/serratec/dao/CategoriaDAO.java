
package com.serratec.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.serratec.classes.Categoria;
import com.serratec.conexao.Conexao;

public class CategoriaDAO {
	private Conexao conexao;
	private String schema;
	
	PreparedStatement pInclusao;
	PreparedStatement pAlteracao;
	
	public CategoriaDAO(Conexao conexao, String schema) { 
		this.conexao = conexao;
		this.schema = schema;
		prepararSqlInclusao();
		prepararSqlAlteracao();
	}
	
	//------------------------------------------------------------
	private void prepararSqlInclusao() {
		String sql = "insert into "+ this.schema + ".categoria";	
		sql += " (nm_categoria, descricao)";
		sql += " values ";
		sql += " (?, ?)";
		
		try {
			this.pInclusao =  conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	private void prepararSqlAlteracao() {
		String sql = "update "+ this.schema + ".categoria";	
		sql += " set nm_categoria = ?,";
		sql += " descricao = ?,";
		sql += " where idcategoria = ?";
		
		try {
			this.pAlteracao =  conexao.getC().prepareStatement(sql);
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
	}
	
	//------------------------------------------------------------
	public int incluirCategoria(Categoria categoria) {
		try {		
							
			pInclusao.setString(1, categoria.getNm_categoria());
			pInclusao.setString(2, categoria.getDescricao());
			return pInclusao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nCategoria não incluída.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}
	
	public int alterarCategoria(Categoria categoria) {
		try {
			pAlteracao.setString(1, categoria.getNm_categoria());
			pAlteracao.setString(2, categoria.getDescricao());
			pAlteracao.setInt(3, categoria.getIdcategoria());

			return pAlteracao.executeUpdate();
		} catch (Exception e) {
			if (e.getLocalizedMessage().contains("is null")) {
				System.err.println("\nCategoria não alterado.\nVerifique se foi chamado o conect:\n" + e);				
			} else {				
				System.err.println(e);
				e.printStackTrace();
			}
			return 0;
		}
	}

	//------------------------------------------------------------
	public ResultSet carregarCategoria() {
		ResultSet tabela;				
		String sql = "select * from " + this.schema + ".categoria order by idcategoria";
		
		tabela = conexao.query(sql);
		
		return tabela;
	}
	
	public ArrayList<Categoria> carregarCategoriaMenu() {
        ArrayList<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT idcategoria, nm_categoria FROM " + this.schema + ".categoria ORDER BY idcategoria";

        ResultSet tabela = conexao.query(sql);

        try {
            while (tabela.next()) {
                Categoria categoria = new Categoria(tabela.getInt("idcategoria"), tabela.getString("nm_categoria"));
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorias;
    }
}

