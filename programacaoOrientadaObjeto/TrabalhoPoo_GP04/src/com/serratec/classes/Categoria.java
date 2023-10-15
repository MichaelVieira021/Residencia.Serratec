package com.serratec.classes;

public class Categoria {
	private int idcategoria;
	private String nm_categoria;
	private String descricao;
	
	public Categoria() {}
	
	public Categoria(int idcategoria, String nm_categoria) {
		this.idcategoria = idcategoria;
		this.nm_categoria = nm_categoria;
	}
	
	public int getIdcategoria() {
		return idcategoria;
	}
	public void setIdcategoria(int idcategoria) {
		this.idcategoria = idcategoria;
	}
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getNm_categoria() {
		return nm_categoria;
	}
	public void setNm_categoria(String nm_categoria) {
		this.nm_categoria = nm_categoria;
	}

}
