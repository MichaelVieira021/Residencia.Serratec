package com.serratec.classes;

import java.util.Scanner;

import com.serratec.uteis.Menus;
import com.serratec.uteis.Util;

public class Produto {
	private int idproduto;
	private String nome;
	private String descricao;
	private double vl_custo;
	private double vl_venda;
	private int qtd_estoque;
	private int idcategoria;
	private Categoria categoria;

	public Produto() {}

	public Produto(int idproduto, String nome, int qtdEstoque) {
		this.setIdproduto(idproduto);
		this.setNome(nome);
		this.setQtd_estoque(qtdEstoque);
	}
	
	
	public void dadosProdutos() {
		System.out.println("║Produto: " + this.getNome());
		System.out.println("║Descrição: " + this.getDescricao());
		System.out.println("║Valor: " + this.getVl_venda());
		System.out.println("║Quantidade: " + this.getQtd_estoque());
		System.out.println("║Categoria: " + this.getIdcategoria());
	}
	
	public void alterarProduto() {
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		
		System.out.println("║Alteracao de dados");
		System.out.println("║------------------------------------");	
		
		System.out.print("║Produto: ");
		String s = in.nextLine();
		this.setNome(s);
		
		System.out.print("║Descrição: ");
		s = in.nextLine();
		this.setDescricao(s);
		
		double vl;
		do {
		vl = Util.validarDouble("║Valor custo: ");
		this.setVl_custo(vl);
		this.setVl_venda(vl*1.15);
		if(vl < 1) {
			System.out.println("║Digite um valor válido!");
		}
		}while(vl < 1);
		
		int qtd;
		do {
		qtd = Util.validarInteiro("║Quantidade: ");
		this.setQtd_estoque(qtd);
		if(qtd < 1) {
			System.out.println("║Digite um valor válido!");
		}
		}while(qtd < 1);
		
		int cat = Menus.menuCategorias();
		this.setIdcategoria(cat);
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

	public int getIdproduto() {
		return idproduto;
	}

	public void setIdproduto(int idproduto) {
		this.idproduto = idproduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getVl_custo() {
		return vl_custo;
	}

	public void setVl_custo(double vl_custo) {
		this.vl_custo = vl_custo;
	}

	public double getVl_venda() {
		return vl_venda;
	}

	public void setVl_venda(double vl_venda) {
		this.vl_venda = vl_venda;
	}

	public int getQtd_estoque() {
		return qtd_estoque;
	}

	public void setQtd_estoque(int qtd_estoque) {
		this.qtd_estoque = qtd_estoque;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}	
	
	
}
