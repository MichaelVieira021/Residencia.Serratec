package com.serratec.classes;

public class PedidoItem {
	private int idpedido_item;
	private int idpedido;
	private int idproduto;
	private int quantidade;
	private Pedido pedido;
	private Produto produto;
	
	public boolean criarPedidoItem(int qtd) {
		Produto teste = new Produto();
		if(qtd <= teste.getQtd_estoque()) {
			teste.setQtd_estoque(teste.getQtd_estoque()-qtd);
			return true;
		}else {
			System.err.println("Erro: Quantidade inválida!");
			return false;
		}
	}
	
	public int getIdpedido_item() {
		return idpedido_item;
	}
	public void setIdpedido_item(int idpedido_item) {
		this.idpedido_item = idpedido_item;
	}
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public int getIdpedido() {
		return idpedido;
	}

	public void setIdpedido(int idpedido) {
		this.idpedido = idpedido;
	}

	public int getIdproduto() {
		return idproduto;
	}

	public void setIdproduto(int idproduto) {
		this.idproduto = idproduto;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}	
}
