package com.serratec.classes;

import java.util.Scanner;

import com.serratec.classes.Empresa.ProdutoCarrinho;
import com.serratec.conexao.Conexao;
import com.serratec.dao.ClienteDAO;
import com.serratec.dao.PedidoDAO;
import com.serratec.dao.ProdutoDAO;
import com.serratec.dao.ProdutoCarrinhoDAO;
import com.serratec.main.Main;
import com.serratec.uteis.Util;
import com.serratec.uteis.Menus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Empresa {
	//private static final String nome = "g4Tech";
	//private String cnpj = "34554354";
	public static ListaClientes clientes; 
	public static ListaProdutos produtos; 
	public static ListaPedidos pedidos;
	public static ListaPedidos pedidos2;
	
	private ArrayList<com.serratec.classes.Cliente> cliente = new ArrayList<>();
	private ArrayList<com.serratec.classes.Produto> produto = new ArrayList<>();
	private ArrayList<com.serratec.classes.Pedido> pedido = new ArrayList<>();
	private ArrayList<com.serratec.classes.Categoria> categoria = new ArrayList<>();
	private static ArrayList<ProdutoCarrinho> pedidocarrinho = new ArrayList<>();
	private static ProdutoCarrinho pedidoAlterado = new ProdutoCarrinho();
	
	private static Conexao con; 
	private static String schema;
	
	public static class ProdutoCarrinho extends Produto{
		private int idpedidoitem;
		private int idpedido;
		private int quantidade;
		private Produto pr;


		public Produto getPr() {
			return pr;
		}

		public void setPr(Produto pr) {
			this.pr = pr;
		}

		public int getIdpedido() {
			return idpedido;
		}

		public void setIdpedido(int idpedido) {
			this.idpedido = idpedido;
		}


		public int getIdpedidoitem() {
			return idpedidoitem;
		}

		public void setIdpedidoitem(int idpedidoitem) {
			this.idpedidoitem = idpedidoitem;
		}

		public int getQuantidade() {
			return quantidade;
		}

		public void setQuantidade(int quantidade) {
			this.quantidade = quantidade;
		}
	}
	
	public Empresa(Conexao con, String schema) {
		super();
		this.con = con;
		this.schema = schema;
	}

	// CLIENTE ----------------------------------------------------------------------
 	public com.serratec.classes.Cliente cadastrarCliente() {
 		com.serratec.classes.Cliente c = new com.serratec.classes.Cliente();
		
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║           CADASTRO DE CLIENTE            ║");
		System.out.println("║------------------------------------------║");	
	
		System.out.print("║Nome: ");
		String info = in.next();
		c.setNome(info);

		c.setCpf(Util.validarCPF()); 

		System.out.print("║Email: ");
		in.nextLine();
		info = in.nextLine();
		c.setEmail(info);
		
		
		c.setTelefone(Util.validarTelefone());
		
		c.setDt_nascimento(Util.validarData("║Data nasc.(dd/MM/yyyy): "));
		System.out.println("║------------------------------------------");	
		System.out.println("║ 		ENDEREÇO            	           ");
		System.out.println("║                                          ");	
		c.setEndereco(Util.buscarCep());
		
		return c;
	}
 	
 	public com.serratec.classes.Cliente adicionarCliente(com.serratec.classes.Cliente cliente) {
 		com.serratec.classes.Cliente c = new com.serratec.classes.Cliente();
		
		c.setNome(cliente.getNome());
		c.setCpf(cliente.getCpf());
		c.setDt_nascimento(cliente.getDt_nascimento());
		c.setEmail(cliente.getEmail());
		c.setTelefone(cliente.getTelefone());
		c.setEndereco(cliente.getEndereco());
		//c = cliente;
		
		this.cliente.add(c);
		
		return cliente;
	}	

	public com.serratec.classes.Cliente localizarCliente() {
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		com.serratec.classes.Cliente cl = new com.serratec.classes.Cliente();
		
		int i = -1;
		listarDadosClientes();
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║           LOCALIZAR DE CLIENTE           ║");
		System.out.println("║------------------------------------------║");
		
		do {
			System.out.print("║Informe o CPF do cliente: ");
			String s = in.next();
			clientes = new ListaClientes(con, schema);
			for (Cliente c : clientes.getListacliente()) {
				if (c.getCpf().equals(s)) {
					i = clientes.getListacliente().lastIndexOf(c);
					break;
				}
			}		
			if (i == -1) {
				System.out.println("║CPF Inválido");
			}
		} while (i == -1);

		
		if (i >= 0) {
			cl.setNome(clientes.getListacliente().get(i).getNome());
			cl.setCpf(clientes.getListacliente().get(i).getCpf());
			cl.setEndereco(clientes.getListacliente().get(i).getEndereco());
			cl.setDt_nascimento(clientes.getListacliente().get(i).getDt_nascimento());
			cl.setIdcliente(clientes.getListacliente().get(i).getIdcliente());
			cl.setEmail(clientes.getListacliente().get(i).getEmail());
			cl.setTelefone(clientes.getListacliente().get(i).getTelefone());
			
			return cl;	
		} else
			return null;
	}

	public void atualizarDadosCliente(com.serratec.classes.Cliente cl) {
		int i = 0;
		
		for (Cliente c : clientes.getListacliente()) {
			if (c.getIdcliente() == cl.getIdcliente()) {
				i = clientes.getListacliente().lastIndexOf(c);
				break;
			}
		}
		//tester
		clientes.getListacliente().get(i).setNome(cl.getNome());
		clientes.getListacliente().get(i).setCpf(cl.getCpf());
		clientes.getListacliente().get(i).setEndereco(cl.getEndereco());
		clientes.getListacliente().get(i).setDt_nascimento(cl.getDt_nascimento());
		clientes.getListacliente().get(i).setEmail(cl.getEmail());
		clientes.getListacliente().get(i).setTelefone(cl.getTelefone());
	}
	
	public void listarDadosClientes() {
 		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		clientes = new ListaClientes(con, schema);

		System.out.println("\n==================================================================================");
		System.out.println("                               LISTAGEM DE CLIENTES                               ");
		System.out.println("==================================================================================");
		System.out.println("Nome\t\t\t\tCPF\t\tEmail \t\t  Dt.Nasc.");
		System.out.println("----------------------------------------------------------------------------------");
		for (Cliente c : clientes.getListacliente()) {
			System.out.printf("%-25s\t", c.getNome());
			System.out.printf("%-15s\t", c.getCpf());
			System.out.printf("%-23s\t", c.getEmail());
			if (c.getDt_nascimento() != null)
				System.out.printf("%s", c.getDt_nascimento().format(dtf));
				//System.out.println("Não sei usar Data :(");
			System.out.println();
		}
		System.out.println("==================================================================================");
		System.out.println();
	}

	public void excluirCliente(com.serratec.classes.Cliente cl) {
		int i = -1;
		clientes = new ListaClientes(con, schema);
		for (Cliente c : clientes.getListacliente()) {
			if (c.getIdcliente() == cl.getIdcliente())
				i = clientes.getListacliente().lastIndexOf(c);
		}
		
		if (i >= 0)
			this.cliente.remove(i);
	}
	
	// PRODUTO -----------------------------------------------------------------------
 	public com.serratec.classes.Produto cadastrarProduto() {
 		com.serratec.classes.Produto c = new com.serratec.classes.Produto();
		
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║           CADASTRO DE PRODUTOS           ║");
		System.out.println("║------------------------------------------║");
		
		
		System.out.print("║Produto: ");
		String s = in.nextLine();
		c.setNome(s);
		
		System.out.print("║Descrição: ");
		s = in.nextLine();
		c.setDescricao(s);
		
		double vl;
		do {
		vl = Util.validarDouble("║Valor custo: ");
		c.setVl_custo(vl);
		c.setVl_venda(vl*1.15);
		if(vl < 1) {
			System.out.println("║Digite um valor válido!");
		}
		}while(vl < 1);
		
		int qtd;
		do {
		qtd = Util.validarInteiro("║Quantidade: ");
		c.setQtd_estoque(qtd);
		if(qtd < 1) {
			System.out.println("║Digite um valor válido!");
		}
		}while(qtd < 1);
		
		int cat = Menus.menuCategorias();
		c.setIdcategoria(cat);
		
		return c;
	}

	public void adicionarProduto(Produto produto) {
		this.produto.add(produto);
	}

	public com.serratec.classes.Produto localizarProduto() {
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		com.serratec.classes.Produto prod = new com.serratec.classes.Produto();
		
		int i = -1;
		listarDadosProdutos();
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║           LOCALIZAR DE PRODUTO           ║");
		System.out.println("║------------------------------------------║");
			//listarDadosProdutos();
		do {
			System.out.print("║Digite o Nome: "); 
			String s = in.nextLine();
			produtos = new ListaProdutos(con, schema);
			
			for (Produto c : produtos.getListaProdutos()) {
				if (c.getNome().equals(s)) {
					i = produtos.getListaProdutos().lastIndexOf(c);
					break;
				}
			}
			if(i==-1) {
				System.out.println("║Produto não encontrado.");
			}
		} while (i == -1);

		
		if (i >= 0) {
			prod.setIdproduto(produtos.getListaProdutos().get(i).getIdproduto());
			prod.setNome(produtos.getListaProdutos().get(i).getNome());
			prod.setDescricao(produtos.getListaProdutos().get(i).getDescricao());
			prod.setVl_custo(produtos.getListaProdutos().get(i).getVl_custo());
			prod.setVl_venda(produtos.getListaProdutos().get(i).getVl_venda());
			prod.setQtd_estoque(produtos.getListaProdutos().get(i).getQtd_estoque());
			prod.setIdcategoria(produtos.getListaProdutos().get(i).getIdcategoria());
			return prod;	
		} else
			return null;
	}
	
	public void atualizarDadosProduto(com.serratec.classes.Produto proddao) {
		int i = 0;
		
	  for (int index = 0; index < produtos.getListaProdutos().size(); index++) {	  
	        Produto prod = produtos.getListaProdutos().get(index);
	        if (prod.getNome().equals(proddao.getNome())) {
	            i = index-1; // Encontrou o produto
	            break;
	        }
	    }
		
		produtos.getListaProdutos().get(i).setNome(proddao.getNome());
		produtos.getListaProdutos().get(i).setDescricao(proddao.getDescricao());
		produtos.getListaProdutos().get(i).setVl_custo(proddao.getVl_custo());
		produtos.getListaProdutos().get(i).setVl_venda(proddao.getVl_venda());
		produtos.getListaProdutos().get(i).setQtd_estoque(proddao.getQtd_estoque());
		produtos.getListaProdutos().get(i).setIdcategoria(proddao.getIdcategoria());
	}
	
	public void listarDadosProdutos() {
		produtos = new ListaProdutos(con, schema);

		System.out.println("\n===========================================================================================================");
		System.out.println("                               LISTAGEM DE PRODUTOS                               ");
		System.out.println("===========================================================================================================");
		System.out.println("\tNOME\t\t\tDESCRIÇÃO\t     VL_CUSTO   VL_VENDA   ESTOQUE\tIDCATEGORIA");
		System.out.println("-----------------------------------------------------------------------------------------------------------");
		for (Produto prod : produtos.getListaProdutos()) {
			System.out.printf("%.20s",(Util.preencherEspacos(50,prod.getNome())));
			System.out.printf("%.30s",(Util.preencherEspacos(50,"     "+prod.getDescricao())));
			System.out.printf("%.12s",(Util.preencherEspacos(12,"    R$"+String.valueOf((prod.getVl_custo())))));
			System.out.printf("%.12s",(Util.preencherEspacos(12,"   R$"+String.valueOf(prod.getVl_venda()))));
			System.out.printf("%.7s" ,(Util.preencherEspacos(10,"   "+String.valueOf(prod.getQtd_estoque()))));
			System.out.printf("%.25s",(Util.preencherEspacos(15,"   "+String.valueOf(prod.getCategoria().getNm_categoria()))));
			//System.out.println("\n-----------------------------------------------------------------------------------------------------------");
			System.out.println();
		}
		System.out.println("===========================================================================================================");
		System.out.println();
	}

	@SuppressWarnings("unlikely-arg-type")
	public void excluirProduto(com.serratec.classes.Produto prod) {
		int i = -1;
		produtos = new ListaProdutos(con, schema);
		for (Produto prod1 : produtos.getListaProdutos()) {
			if (prod1.getIdproduto() == prod.getIdproduto())
				i = clientes.getListacliente().lastIndexOf(prod1);
		}
		
		if (i >= 0)
			this.produto.remove(i);
	}	
	// PEDIDO ------------------------------------------------------------------------	

 	public Pedido cadastrarPedido() {
 		com.serratec.classes.Pedido pd = new com.serratec.classes.Pedido();
 	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
 	    LocalDateTime nowt = LocalDateTime.now();  
 	    LocalDate now = LocalDate.now();  

		System.out.println("Cadastro de pedido: ");
		System.out.println("Data de Emissão: " + dtf.format(nowt));
		
		pd.setDt_emissao(now);
		
		pd.setIdcliente(Menus.menuClientes());

		inserirNoBd(inserirProdutoCarrinho(pd), pedidocarrinho);

		return pd;
	}
 	
	public void adicionarPedido(Pedido pedido) {
		this.pedido.add(pedido);
	}

	public Pedido inserirProdutoCarrinho(Pedido pd) {
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);

		int quant;
		int opcao = 1;
		boolean verEstoque = false, prIgual = true;
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║        ************************          ║");
		System.out.println("║            INSERIR PRODUTOS              ║");
		System.out.println("║        ************************          ║");
		System.out.println("╚══════════════════════════════════════════╝");
		int idprod;
		//ADICIONADO CONTADOR PARA EVITAR A CRIACAO DE PEDIDOS VAZIOS
		boolean contador = false;
		
		do {
		    idprod = Menus.menuProdutos(contador);
		    if(idprod==0) {
		        opcao = 1;
		        break;
		    } else {
		        prIgual = false;
		        for (ProdutoCarrinho pr : pedidocarrinho) {
		            if (pr.getPr().getIdproduto() == idprod) {
		                pedidocarrinho.remove(pedidocarrinho.indexOf(pr));
		                prIgual = true;
		                break;
		            }
		        }
		        if (!prIgual) {
		            quant = Util.validarInteiro("Digite a quantidade a ser adicionada: ");
		            verEstoque = verificarEstoque(idprod, quant);
		            
		            //System.out.println("Produto adicionado com Sucesso!");
		        }
		        if(verEstoque) {
		        	contador = true;
		        	System.out.println("Digite [1] para adicionar outro produto ou [0] para concluir o pedido.");
			        opcao = Util.validarInteiro("> ");
		        }else {
		        	opcao = 1;
		        }
		        
		    }
		} while (opcao == 1);

		System.out.println("Pedido realizado com Sucesso!");
			
		return pd;
	}
	
	public void alterarQtdOuProduto(ProdutoCarrinho pc,Pedido pd) {
		Menus.menuAlterarPedidoItens();
		boolean opcQtdOuPr = false;
		
		do {
			int opcao = Util.validarInteiro("> ");
			ProdutoCarrinho continuar;
			switch(opcao) {
			
				case 1:
					continuar = alterarQtdPedidoItem(pc, pd);
					if(continuar == null) {
						opcQtdOuPr = true;
						break;
					}else {
						Menus.menuAlterarPedidoItens();
						opcQtdOuPr = false;
						break;
					}
				case 2:
					continuar = alterarPedidoItem(pc, pd);
					if(continuar == null) {
						opcQtdOuPr = true;
						break;
					}else {
						Menus.menuAlterarPedidoItens();
						opcQtdOuPr = false;
						break;
					}
				case 3:
					alterarRemoverPedidoItem(pc, pd);
					opcQtdOuPr = true;
					break;
				case 0:
					System.err.println("Alteração cancelada!");
					opcQtdOuPr = true;
					break;
				default:
					System.err.println("Erro: Opção não encontrada!");
					opcQtdOuPr = false;
					break;
			}
		}while(!opcQtdOuPr);

	}
	
	//ALTERAR OS PRODUTOS DENTRO DO PEDIDO
	public Pedido alterarProdutoCarrinho(Pedido pd) {
		int quant;
		boolean verEstoque = false, prIgual = true;
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║        ************************          ║");
		System.out.println("║        SELECIONE O NOVO PRODUTO          ║");
		System.out.println("║        ************************          ║");
		System.out.println("╚══════════════════════════════════════════╝");

		int idprod;

		do {
			boolean contador = true;
			idprod = Menus.menuProdutos(contador);
			if(idprod == 0) {
				pd = null;
				return pd;
			}
			for (ProdutoCarrinho pr : pedidocarrinho) {
				if (pr.getPr().getIdproduto() == idprod) {
					pedidocarrinho.remove(pedidocarrinho.indexOf(pr));
					prIgual = true;
					break;
				} else
					prIgual = false;
				}
			prIgual = false;
		} while (prIgual);
		do {
			quant = Util.validarInteiro("Digite a quantidade a ser adicionada: ");
			verEstoque = verificarEstoque(idprod, quant);
		}while(!verEstoque);


		if (!verEstoque) {
			Util.escrever("Produto fora de estoque!");
		} else {
			System.out.println("Produto alterado com Sucesso!");
		}
		return pd;
	}
	
	public void inserirNoBd(Pedido pd, ArrayList<ProdutoCarrinho> pc) {
		PedidoDAO pddao = new PedidoDAO(con, com.serratec.main.Main.SCHEMA);
		
		ProdutoCarrinhoDAO pcdao = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA);
		ProdutoCarrinhoDAO pcdaoe = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA, 2);
		
		pddao.incluirPedido(pd);
		int idPedido = pddao.ultimoIdPedido();		
		
		for (ProdutoCarrinho pdc : pedidocarrinho) {
				pdc.setIdpedido(idPedido);
				pcdao.incluirProdutoCarrinho(pdc);
				pcdaoe.alterarEstoque(pdc.getPr());
		}
		pedidocarrinho.clear();
	}
	
	public void inserirAlteracaoNoBd(Pedido pd, ProdutoCarrinho pc) {
		ProdutoCarrinhoDAO pcdao2 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA);
		ProdutoCarrinhoDAO pcdao3 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA, 2);

		//BUSCAS PEDIDO ANTERIOR
		ProdutoDAO prdao = new ProdutoDAO(con, com.serratec.main.Main.SCHEMA);
		ProdutoCarrinho qtdPrAnterior = pcdao2.carregarProdutoCarrinho(pc.getIdpedidoitem());
		Produto ori = prdao.carregarProdutoMenu2(qtdPrAnterior.getIdproduto());
			
		//ALTERAR PEDIDO ATUALIZADO
		if(ori.getIdproduto() == pc.getIdproduto()) {
			pc.setQuantidade(pc.getQuantidade()+qtdPrAnterior.getQuantidade());
			pcdao2.alterarPedidoItem(pc);
			pcdao3.alterarEstoque(pc.getPr());
		}else {
			ori.setQtd_estoque(ori.getQtd_estoque()+ qtdPrAnterior.getQuantidade());
			pcdao2.alterarPedidoItem(pc); 
			pcdao3.alterarEstoque(pc.getPr()); 
			pcdao3.alterarEstoque(ori);
		}
	}
	
	public void inserirAlteracaoQtdNoBd(Pedido pd, ProdutoCarrinho pc) {
		ProdutoCarrinhoDAO pcdao2 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA);
		ProdutoCarrinhoDAO pcdao3 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA, 2);

		pcdao2.alterarPedidoItem(pc); 
		pcdao3.alterarEstoque(pc.getPr()); 
	}

	public static boolean verificarEstoque(int idprod, int quant) {
		boolean retorno = false;
		com.serratec.classes.Produto prod = new com.serratec.classes.Produto();
		ProdutoDAO e  = new ProdutoDAO(Main.con, Main.SCHEMA);
		prod = e.carregarProdutoMenu2(idprod);

		if (prod.getQtd_estoque() > 0 && prod.getQtd_estoque() >= quant) {
			prod.setQtd_estoque(prod.getQtd_estoque()-quant);
			adicionarProdutoCarrinho(prod, quant);
			retorno = true;
		} else {
			if (prod.getQtd_estoque() == 0) {
				System.out.println("Produto fora de estoque.");
			} else {
				System.out.println("A quantidade solicitada e superior a quantidade disponivel.");
				System.out.println("Restam apenas ["+ prod.getQtd_estoque()+"] unidades.");
			}
		}
		return retorno;	
	}
	
	public void listarDadosPedidos() {
		
		pedidos = new ListaPedidos(con, schema, 1);
		System.out.println("\n====================================================================================");
		System.out.println("                               LISTAGEM DE PEDIDOS                               ");
		System.out.println("====================================================================================");
		System.out.println("\tIDPEDIDO\tDATA DE EMISSAO\t\tCLIENTE\t");
		System.out.println("------------------------------------------------------------------------------------");
		for (Pedido pedi : pedidos.getListapedidos()) {
			System.out.printf("\t"+pedi.getIdpedido()+"\t\t");
			System.out.print(pedi.getDt_emissao()+"\t\t");
			ClienteDAO clienteDAO = new ClienteDAO(con,schema);
			Cliente c = clienteDAO.buscarClientePorIdCliente(pedi.getIdcliente());
			System.out.print(c.getNome()+"\t");
			System.out.println();
		}
		System.out.println();
		boolean teste = false;
		do {
			int i = com.serratec.uteis.Util.validarInteiro("Digite o codigo do pedido ou [0] para sair: ");
			if(i == 0) {
				teste = true;
				break;
			}
			for (Pedido pedi : pedidos.getListapedidos()) {
				if(i == pedi.getIdpedido()) {
					listarPedidosComProdutos(i);
					teste = true;
					break;
				}
			}
			System.out.println("Pedido não encontrado!");
		}while(!teste);
		
	}
	
	public void listarPedidosComProdutos(int idprod) {
		pedidos = new ListaPedidos(con, schema, 1);
		ProdutoCarrinhoDAO e  = new ProdutoCarrinhoDAO(Main.con, Main.SCHEMA);
		com.serratec.dao.PedidoDAO pedidoDAO = new com.serratec.dao.PedidoDAO(con,schema);
		Pedido ped = pedidoDAO.retornarPedidoComCliente(idprod);
		DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String emissao = format.format(ped.getDt_emissao());
		System.out.println("\n===================================================================================================");
		System.out.println("                    		  NOTA FISCAL											");
		System.out.println("===================================================================================================");
		System.out.println("EMPRESA: g4Tech                                                           CNPJ: 36.439.598/0001-67 ");
		System.out.println("---------------------------------------------------------------------------------------------------");
		System.out.println("CLIENTE: "+ped.getCliente().getNome()+"\t\t\t\t\t\t\tDATA DE EMISSÃO: " + emissao);
		System.out.println("---------------------------------------------------------------------------------------------------");
		System.out.println("ENDEREÇO DE ENTREGA: "+ped.getCliente().getEndereco());
		System.out.println("---------------------------------------------------------------------------------------------------");
		System.out.println("  IDPEDIDO   IDPRODUTO    PRODUTO               QUANTIDADE      VALOR UNITÁRIO      VALOR FINAL");
		System.out.println("---------------------------------------------------------------------------------------------------");
		double total = 0;
		for(ProdutoCarrinho c : e.listarProdutosNoPedidoSelecionado(idprod)) {
        	System.out.printf("    %.5S",(Util.preencherEspacos(15," "+c.getIdpedido())));
        	System.out.printf("\t%.5S",(Util.preencherEspacos(15," "+c.getIdproduto())));
        	System.out.printf("%.25S",(Util.preencherEspacos(30,"     "+c.getNome())));
        	System.out.printf("%.10S",(Util.preencherEspacos(10,"      "+c.getQuantidade())));
        	System.out.printf("%.20S",(Util.preencherEspacos(30,"           "+"R$"+c.getVl_venda())));
        	System.out.printf("%.20S",(Util.preencherEspacos(30,"          "+"R$"+c.getVl_venda()*c.getQuantidade())));
    		System.out.println();
    		total += (c.getVl_venda()*c.getQuantidade());
		}
		
		/*for (Pedido pedi : pedidos.getListapedidos()) {
			System.out.printf(pedi.getIdpedido()+"\t");
			System.out.print(pedi.getDt_emissao()+"\t");
			System.out.print(pedi.getIdcliente()+"\t");
			System.out.println();
		}*/
		System.out.println("---------------------------------------------------------------------------------------------------");
		System.out.println("  VALOR TOTAL: R$" + total);
		System.out.println("---------------------------------------------------------------------------------------------------");
		System.out.println();
	}
	
	public void excluirPedido(com.serratec.classes.Pedido pedi) {
		int i = -1;
		pedidos = new ListaPedidos(con, schema, 1);
		for (Pedido pedi1 : pedidos.getListapedidos()) {
			if (pedi1.getIdpedido() == pedi.getIdpedido())
				i = pedidos.getListapedidos().lastIndexOf(pedi);
		}
		if (i >= 0)
			this.pedido.remove(i);
	}

	// CARRINHO ---------------------------------------------------------------------
	private static void adicionarProdutoCarrinho(Produto l, int quant) {
		ProdutoCarrinho le = new ProdutoCarrinho();
		
		//PARA CADASTRAR PEDIDO-----------
		le.setIdproduto(l.getIdproduto());
		le.setQtd_estoque(l.getQtd_estoque());
		le.setQuantidade(quant);
		le.setPr(l);
		
		//PARA ALTERAR PEDIDO---------
		pedidoAlterado = le;
		System.out.println("--------------------------------------------");
		System.out.println("Produto: " + le.getPr().getNome());
		System.out.println("Quantidade adicionada: " + le.getQuantidade());
		System.out.println("Restam em estoque: " + le.getQtd_estoque());
		System.out.println("--------------------------------------------");
		pedidocarrinho.add(le);

	}

	public com.serratec.classes.Pedido localizarPedido() {
		com.serratec.classes.Pedido pd = new com.serratec.classes.Pedido();
		pedidos = new ListaPedidos(con, schema, 1);
		int s;
		
		
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║             LOCALIZAR PEDIDO             ║");
		System.out.println("║------------------------------------------║");
		System.out.println("║       Informe [CODIGO] do pedido         ║");
		System.out.println("║         Digite '0' para [Sair]           ║");
		System.out.println("╚══════════════════════════════════════════╝");
		boolean pdEncontrado = false;
	do {
			s = Util.validarInteiro("[CÓDIGO]> ");
			if(s==0) {
				pdEncontrado = true;
				pd = null;
				break;
			}
			
			for(Pedido c : pedidos.getListapedidos()) { 
				if(s == c.getIdpedido()) {
					pdEncontrado = true;
					pd.setDt_emissao(c.getDt_emissao());
					pd.setIdcliente(c.getIdcliente());
					pd.setIdpedido(c.getIdpedido());
					pd.dadosPedidos(pd);
					break;
					
				}
			}
			if (!pdEncontrado) {
			    System.err.println("Erro: Pedido não encontrado!");
			}else {
				
			}

	}while(!pdEncontrado);
	
	return pd;
	}
	
	public ProdutoCarrinho atualizarPedidoItem(ProdutoCarrinho pc) {
		pc.setIdproduto(pedidoAlterado.getIdproduto());
		pc.setQuantidade(pedidoAlterado.getQuantidade());
		pc.setPr(pedidoAlterado.getPr());
		
		return pc;
	}
	
	public ProdutoCarrinho alterarQtdPedidoItens(ProdutoCarrinho pc) {
		
		System.out.println("╔══════════════════════════════════════════╗");
		System.out.println("║    Contem ["+ pc.getQuantidade()+"] qtd! ║");
		System.out.println("║------------------------------------------║");
		System.out.println("║     Deseja remover ou adicionar qtd?     ║");
		System.out.println("║                                          ║");
		System.out.println("║            [1] - Adicionar               ║");
		System.out.println("║            [2] - Remover                 ║");
		System.out.println("║                                          ║");
		System.out.println("║------------------------------------------║");
		System.out.println("║          Digite '0' para [Sair]          ║");
		System.out.println("╚══════════════════════════════════════════╝");
		int qtd;
		boolean verEstoque, verificaOpcao = true;
	
		Scanner scan = new Scanner(System.in);
		int opcao;
		do {
		opcao = Util.validarInteiro("> ");
		if(opcao == 1) {
			do {
				qtd = Util.validarInteiro("Digite a quantidade a ser adicionada: ");
				if(qtd == 0) {
					break;
				}
				if (pc.getPr().getQtd_estoque() > 0 && pc.getPr().getQtd_estoque() >= qtd) {
					pc.getPr().setQtd_estoque(pc.getPr().getQtd_estoque()-qtd);
					pc.setQuantidade(pc.getQuantidade() + qtd);
					verEstoque = true;
				} else {
					verEstoque = false;
					if (pc.getPr().getQtd_estoque() == 0) {
						System.out.println("Produto fora de estoque.");
					} else {
						System.out.println("A quantidade solicitada é superior a quantidade disponivel em estoque.");
						System.out.println("Restam apenas ["+ pc.getPr().getQtd_estoque()+"] unidades.");
					}
				}
			}while(!verEstoque);
				
		}else if(opcao == 2) {
			do {
				qtd = Util.validarInteiro("Digite a quantidade a ser removida: ");
				if(qtd <= pc.getQuantidade()) {
					pc.getPr().setQtd_estoque(pc.getPr().getQtd_estoque()+qtd);
					pc.setQuantidade(pc.getQuantidade() - qtd);
					verEstoque = true;
				}else {
					System.out.println("Não é possivel remover está qtd!");
					System.out.println("Você tem apenas "+ pc.getQuantidade()+ " qtd!\n");
					verEstoque = false;
				}
			}while(!verEstoque);
		}else if(opcao == 0){
			break;
		}else {
			verificaOpcao = false;
			System.out.println("Opção inválida!");
		}
				
		}while(!verificaOpcao);
		return pc;
	}
	
	public ProdutoCarrinho alterarQtdPedidoItem(ProdutoCarrinho pc, Pedido pd) {		
		inserirAlteracaoQtdNoBd(pd, alterarQtdPedidoItens(pc));
		pd.dadosPedidos(pd);
		ProdutoCarrinho pdItemEscolhido = Menus.menuProdutosCarrinho(pd.getIdpedido());
		return pdItemEscolhido;
		
	}
	
	public ProdutoCarrinho alterarRemoverPedidoItem(ProdutoCarrinho pc, Pedido pd) {
		ProdutoCarrinhoDAO pcdao = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA);
		PedidoDAO pddao = new PedidoDAO(con, com.serratec.main.Main.SCHEMA);
		ArrayList<ProdutoCarrinho> teste = pcdao.carregarProdutoMenuItems(pd.getIdpedido());
		
		boolean pdExcluir = false;
		for(ProdutoCarrinho prc : teste) {
			if(prc.getIdpedidoitem() != pc.getIdpedidoitem()) {
				pdExcluir = true;
			}
		}
		ProdutoCarrinho pdItemEscolhido = null;
		if(pdExcluir) {
			inserirAlteracaoRemoverNoBd(pd, pc);
			pd.dadosPedidos(pd);
			pdItemEscolhido = Menus.menuProdutosCarrinho(pd.getIdpedido());
		}else {
			pdItemEscolhido = pdItemEscolhido;
			System.out.println("Seu pedido tem apenas um produto.");
			System.out.println("Ao excluir esse produto, o pedido tambem sera excluido");
			System.out.println("Deseja continuar?");
			System.out.print("[S/N]> ");
			Scanner scan = new Scanner(System.in);
			char opcao = scan.next().toLowerCase().charAt(0);
			switch(opcao) {
				case 's':
					pddao.excluirPedido(pd);
				default:
					break;
			}
		}

		return pdItemEscolhido;
		
	}
	
	public void inserirAlteracaoRemoverNoBd(Pedido pd, ProdutoCarrinho pc) {
		ProdutoCarrinhoDAO pcdao2 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA);
		ProdutoCarrinhoDAO pcdao3 = new ProdutoCarrinhoDAO(con, com.serratec.main.Main.SCHEMA, 2);		

		//ALTERAR PEDIDO ATUALIZADO		
		pc.getPr().setQtd_estoque(pc.getPr().getQtd_estoque()+pc.getQuantidade());
		pcdao3.alterarEstoque(pc.getPr());
		pcdao2.excluirPedidoCarrinho(pc);
	}
	
	public ProdutoCarrinho alterarPedidoItem(ProdutoCarrinho pc, Pedido pd) {
		Pedido teste = new Pedido();
		
		teste.setDt_emissao(pd.getDt_emissao());
		teste.setIdcliente(pd.getIdcliente());
		teste.setIdpedido(pd.getIdpedido());
		
		pd = alterarProdutoCarrinho(pd);
		if(pd != null) {
			inserirAlteracaoNoBd(pd, atualizarPedidoItem(pc));
		}
		pd = teste;
		//pd.setDt_emissao(teste.getDt_emissao());
		//pd.setIdcliente(teste.getIdcliente());
		//pd.setIdpedido(teste.getIdpedido());
		
		pd.dadosPedidos(pd);
		ProdutoCarrinho pdItemEscolhido = Menus.menuProdutosCarrinho(pd.getIdpedido());
		//alterarQtdOuProduto(pdItemEscolhido, pd);
		return pdItemEscolhido;

	}
	
	
	
	//inserirNoBd(inserirProdutoCarrinho(pd), pedidocarrinho);
	// CATEGORIA ----------------------------------------------------------------------
	
 	public com.serratec.classes.Categoria cadastrarCategoria() {
 		
 		com.serratec.classes.Categoria cat = new com.serratec.classes.Categoria();
		
		@SuppressWarnings("resource")
		Scanner in = new Scanner(System.in);
		
		System.out.println(Util.LINHA);
		System.out.println("Cadastro de categoria: ");
		System.out.println(Util.LINHA);
		
		Util.br();
		
		System.out.println("Informe o nome : ");
		String s = in.nextLine();
		cat.setNm_categoria(s);
		
		System.out.println("Informe a Descrição : ");
		s = in.nextLine();
		cat.setDescricao(s);
		
		return cat;
	}
 	public com.serratec.classes.Categoria adicionarCategoria(com.serratec.classes.Categoria categoria) {
 		com.serratec.classes.Categoria cat = new com.serratec.classes.Categoria();
		
		cat.setNm_categoria(categoria.getNm_categoria());
		cat.setDescricao(categoria.getDescricao());
		
		this.categoria.add(cat);
		
		return categoria;
	}	
}

