package com.serratec.classes;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.serratec.uteis.Util;

public class Pedido {
	private int idpedido;
	private LocalDate dt_emissao;
	private int idcliente;
	private Cliente cliente;
	private ArrayList<Produto> pedidoitem = new ArrayList<>();

	public void dadosPedidos(Pedido pd) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║             *****************            ║");
		System.out.println("║             PEDIDO ENCONTRADO            ║");
		System.out.println("║             *****************            ║");
		System.out.print(Util.preencherEspacos(31, "║ PEDIDO Nº"+ pd.getIdpedido()));
		System.out.println(" "+pd.getDt_emissao().format(formatter)+" ║");
	}
	
	public int getIdpedido() {
		return idpedido;
	}

	public void setIdpedido(int idpedido) {
		this.idpedido = idpedido;
	}

	public LocalDate getDt_emissao() {
		return dt_emissao;
	}

	public void setDt_emissao(LocalDate dt_emissao) {
		this.dt_emissao = dt_emissao;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public ArrayList<Produto> getPedidoitem() {
		return pedidoitem;
	}

	public void setPedidoitem(ArrayList<Produto> pedidoitem) {
		this.pedidoitem = pedidoitem;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	

}