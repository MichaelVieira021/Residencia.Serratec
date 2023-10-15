package com.serratec.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import com.serratec.conexao.Conexao;
import com.serratec.conexao.DadosConexao;

public class CreateDAO {
	private static Conexao conexao;	
	
	public static boolean createBD(String bd, String schema, DadosConexao dadosCon) {		
		boolean bdCriado = false;
		conexao = conectar("postgres", dadosCon);
		
		if (criarDatabase(conexao, bd)) {
			desconectar(conexao);
			
			conexao = conectar(bd, dadosCon);
			
			if (criarSchema(conexao, schema)) {
				criarEntidadeCliente(conexao, schema);
				criarEntidadeCategoria(conexao, schema);
				criarEntidadeProduto(conexao, schema);
				criarEntidadePedido(conexao, schema);
				criarEntidadePedidoItem(conexao, schema);
				
				bdCriado = true;
			}
		}
		desconectar(conexao);
		
		return bdCriado;
	}
	
	//CONEXÃO--------------------------------------------------------------------------------
	private static Conexao conectar(String bd, DadosConexao dadosCon) {		
		dadosCon.setBanco(bd);
		Conexao conexao = new Conexao(dadosCon);
		conexao.conect();
		return conexao;
	}
	
	private static void desconectar(Conexao con) {
		con.disconect();
	}
	
	//---------------------------------------------------------------------------------------
	private static boolean criarDatabase(Conexao con, String bd) {		
		boolean bdExiste;
		int tentativas = 1;
		String sql;
				
		class Database {		
			public static ResultSet Exists(Conexao con, String bd) {
				ResultSet entidade;
				String sql = "select datname from pg_database where datname = '" + bd + "'";		
				entidade = con.query(sql);
				return entidade;
			}
		}
				
		do {
			try {
				bdExiste = Database.Exists(con, bd).next(); 
				
				if (!bdExiste) {
					sql = "create database "+ bd;		
					con.query(sql);
					tentativas++;
				}
			} catch (Exception e) {
				System.err.printf("Não foi possível criar o database %s: %s", bd, e);
				e.printStackTrace();
				return false;
			}
		} while (!bdExiste && (tentativas<=3));
		
		return bdExiste;
	}
	
	private static boolean criarSchema(Conexao con, String schema) {		
		boolean schemaExiste;
		int tentativas = 1;
		String sql;
				
		class Schema {		
			public static ResultSet Exists(Conexao con, String schema) {
				ResultSet entidade;
				String sql = "select * from pg_namespace where nspname = '" + schema + "'";		
				entidade = con.query(sql);
				return entidade;
			}
		}
				
		do {
			try {
				schemaExiste = Schema.Exists(con, schema).next(); 
				
				if (!schemaExiste) {
					sql = "create schema "+ schema;		
					con.query(sql);
					tentativas++;
				}
			} catch (Exception e) {
				System.err.printf("Não foi possível criar o schema %s: %s", schema, e);
				e.printStackTrace();
				return false;
			}
		} while (!schemaExiste && (tentativas<=3));
		
		return schemaExiste;
	}
	
	private static void criarTabela(Conexao con, String entidade, String schema) {				
		String sql = "create table " + schema + "." + entidade + " ()";		
		con.query(sql);		
	}
	
	private static void criarCampo(Conexao con, String schema, String entidade, 
			String atributo, String tipoAtributo, boolean primario, 
			boolean estrangeiro, String entidadeEstrangeira, 
			String atributoEstrangeiro) {
		
		if (!atributoExists(con, schema, entidade, atributo)) {
			String sql = "alter table " + schema + "." + entidade + " add column " + 
				atributo + " " + tipoAtributo + " "; 
			
			if (primario) {
				sql += "primary key "; 
			}

			if (estrangeiro) {
				sql += "references " + schema + "." + entidadeEstrangeira + "(" + atributoEstrangeiro + ") on delete cascade";
			}

			con.query(sql);
		}
	}	

	//CRIAR ENTIDADES --------------------------------------------------------------
	private static void criarEntidadeCliente(Conexao con, String schema) {
		String entidade = "cliente";
		
		if (!entidadeExists(con, schema, entidade))		
			criarTabela(con, entidade, schema);
		
		if (entidadeExists(con, schema, entidade)) {
			criarCampo(con, schema, entidade, "idcliente", "serial"	 	 	, true,  false, null, null);
			criarCampo(con, schema, entidade, "nome"	 , "varchar(100)"	, false, false, null, null);
			criarCampo(con, schema, entidade, "cpf"		 , "varchar(11)" 	, false, false, null, null);
			criarCampo(con, schema, entidade, "email"	 , "varchar(150)"	, false, false, null, null);
			criarCampo(con, schema, entidade, "telefone" , "varchar(16)"	, false, false, null, null);
			criarCampo(con, schema, entidade, "dt_nascimento"	, "date"	, false, false, null, null);
			criarCampo(con, schema, entidade, "endereco"	 	, "text"	, false, false, null, null);
			cadastrarClientes(con, schema, entidade);
		}		
	}
	
	private static void criarEntidadeCategoria(Conexao con, String schema) {
		String entidade = "categoria";
		
		if (!entidadeExists(con, schema, entidade))		
			criarTabela(con, entidade, schema);
		
		if (entidadeExists(con, schema, entidade)) {
			criarCampo(con, schema, entidade, "idcategoria"			, "serial"	 	 		, true,  false, null, null);
			criarCampo(con, schema, entidade, "nm_categoria"	 	, "varchar(255)"		, false, false, null, null);
			criarCampo(con, schema, entidade, "descricao"			, "text" 				, false, false, null, null);
			cadastrarCategorias(con,schema,entidade);
		}		
	}
	
	private static void criarEntidadeProduto(Conexao con, String schema) {
		String entidade = "produto";
		
		if (!entidadeExists(con, schema, entidade))		
			criarTabela(con, entidade, schema);
		
		if (entidadeExists(con, schema, entidade)) {
			criarCampo(con, schema, entidade, "idproduto"			, "serial"	 	 		, true,  false, null, null);
			criarCampo(con, schema, entidade, "nome"	 			, "varchar(255)"		, false, false, null, null);
			criarCampo(con, schema, entidade, "descricao"			, "text" 				, false, false, null, null);
			criarCampo(con, schema, entidade, "vl_custo"			, "double precision"	, false, false, null, null);
			criarCampo(con, schema, entidade, "vl_venda" 			, "double precision"	, false, false, null, null);
			criarCampo(con, schema, entidade, "qtd_estoque"			, "int"					, false, false, null, null);
			criarCampo(con, schema, entidade, "idcategoria"	 		, "int"					, false, true, "categoria", "idcategoria");
		    cadastrarProdutos(con,schema,entidade);   
		}		
	}
	
	private static void criarEntidadePedido(Conexao con, String schema) {
		String entidade = "pedido";
		
		if (!entidadeExists(con, schema, entidade))		
			criarTabela(con, entidade, schema);
		
		if (entidadeExists(con, schema, entidade)) {			
			criarCampo(con, schema, entidade, "idpedido"			, "serial"	 	 		, true,  false, null, null);
			criarCampo(con, schema, entidade, "dt_emissao"	 		, "date"				, false, false, null, null);
			criarCampo(con, schema, entidade, "idcliente"			, "int" 				, false, true, "cliente", "idcliente");
		
		}		
	}

	private static void criarEntidadePedidoItem(Conexao con, String schema) {
		String entidade = "pedido_produto";
		
		if (!entidadeExists(con, schema, entidade))		
			criarTabela(con, entidade, schema);
		
		if (entidadeExists(con, schema, entidade)) {
			criarCampo(con, schema, entidade, "idpedido_produto"	, "serial" 			, true, false, null, null);
			criarCampo(con, schema, entidade, "idpedido"			, "int"	 	 		, false,  true, "pedido", "idpedido");
			criarCampo(con, schema, entidade, "idproduto"	 		, "int"				, false,  true, "produto", "idproduto");
			criarCampo(con, schema, entidade, "quantidade"			, "int" 			, false, false, null, null);
		
		}		
	}
	
	//---------------------------------------------------------------------------------------
	public static boolean databaseExists(Conexao con, String bd) {
		ResultSet entidade;
		boolean dbExists = false;
		
		String sql = "select datname from pg_database where datname = '" + bd + "'";		
		entidade = con.query(sql);
		
		try {
			dbExists = entidade.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dbExists;
	}

	public static boolean entidadeExists(Conexao con, String schema, String entidade) {
		boolean entidadeExist = false;
		String sql = 
				"SELECT n.nspname AS schemaname, c.relname AS tablename " +
				   "FROM pg_class c " +
				   "LEFT JOIN pg_namespace n ON n.oid = c.relnamespace " +
				   "LEFT JOIN pg_tablespace t ON t.oid = c.reltablespace " +
				"WHERE c.relkind = 'r' " +
				"AND n.nspname = '" + schema + "' " +
				"AND c.relname = '" + entidade + "'";
		
		ResultSet tabela = con.query(sql);
		
		try {
			entidadeExist = (tabela.next()?true:false); 
			
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		return entidadeExist;
	}
	
	public static boolean atributoExists(Conexao con, String schema, 
			String entidade, String atributo) {
		
		boolean atributoExist = false;
		
		String sql = "select table_schema, table_name, column_name from information_schema.columns "
				+ "where table_schema = '" + schema + "' "
				+ "and table_name = '" + entidade + "' "
				+ "and column_name = '" + atributo + "'";
		
		ResultSet result = con.query(sql);
		
		try {
			atributoExist = (result.next()?true:false);
			
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}
		
		return atributoExist;
	}
	
	
	//---------------------------------------------------------------------------------------
	private static void cadastrarClientes(Conexao con, String schema, String entidade) {
		ResultSet tabela = con.query("select nome from " + schema + "." + entidade + " limit 1");
		
		try {
			if (!tabela.next()) {
				String sqlClientes = "insert into " + schema + "." + entidade;
				sqlClientes += " (nome, cpf, email, telefone, dt_nascimento, endereco)";
				sqlClientes += " values";
				sqlClientes += "('Bernardo' , '31418332062' ,'bernardo@mail.com' , '21986544785', '11/10/1990', 'Rua Delfim Moreira'),";
				sqlClientes += "('Lucas'    , '14098593041' ,'lucas@mail.com'    , '21996544785', '22/04/1995', 'Rua Abelardo Bueno'),";
				sqlClientes += "('Adilson'  , '82577808046' ,'adilson@mail.com'  , '21986566785', '19/08/2003', 'Rua André Rocha'),";
				sqlClientes += "('Michael'  , '27591159097' ,'michael@mail.com'  , '21986599785', '23/09/2000', 'Rua Nelson Cardoso'),";
				sqlClientes += "('Taynara'  , '32985261503' ,'taynara@mail.com'  , '21986585785', '06/11/2004', 'Rua Florianópolis'),";
				sqlClientes += "('André'    , '35959647303' ,'andre@mail.com'    , '21986544581', '13/07/1999', 'Rua Francisco Caldas'),";
				sqlClientes += "('Natally'  , '42108064044' ,'natally@mail.com'  , '21975644785', '10/12/2006', 'Rua Marechal Taumaturgo')";
				con.query(sqlClientes);
				tabela.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	private static void cadastrarCategorias(Conexao con, String schema, String entidade) {
		ResultSet tabela = con.query("select nm_categoria from " + schema + "." + entidade + " limit 1");
		
		try {
			if (!tabela.next()) {
				String sqlCategoria = "insert into " + schema + "." + entidade;
				sqlCategoria += " (nm_categoria, descricao)";
				sqlCategoria += " values";
				sqlCategoria += "('Hardware', 'Componentes físicos de um sistema de computador.'),";
				sqlCategoria += "('Perifericos', 'Dispositivos auxiliares.'),";
				sqlCategoria += "('Celular & Smartphone', 'Telefones móveis que possuem funcionalidades avançadas.'),";
				sqlCategoria += "('Games', 'Jogos eletrônicos para várias plataformas.')";
				con.query(sqlCategoria);
				tabela.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	private static void cadastrarProdutos(Conexao con, String schema, String entidade) {
        ResultSet tabela = con.query("select nome from " + schema + "." + entidade + " limit 1");
        
        try {
            if (!tabela.next()) {
                String sqlProduto = "insert into " + schema + "." + entidade;
                sqlProduto += " (nome, descricao, vl_custo, vl_venda, qtd_estoque, idcategoria)";
                sqlProduto += " values";
                sqlProduto += "('Kit Gamer', 'Um conjunto completo de equipamentos de jogos, incluindo teclado, mouse e fone de ouvido.', '150', '180', '50', '1'),";
                sqlProduto += "('Monitor Gamer', 'Monitor de alta resolução com taxa de atualização rápida para uma experiência de jogo suave.', '500', '660', '50', '2'),";
                sqlProduto += "('Mouse Gamer', 'Mouse com alta DPI para controle preciso e botões programáveis para jogos.', '50', '90', '4', '3'),";
                sqlProduto += "('Webcam Gamer', 'Webcam de alta qualidade para streaming de jogos com boa iluminação.', '200', '300', '7', '3'),";
                sqlProduto += "('Teclado Gamer', 'Teclado mecânico com teclas programáveis e retroiluminação RGB.', '180', '200', '33', '2'),";
                sqlProduto += "('Mousepad Gamer', 'Mousepad com superfície otimizada para melhor desempenho do mouse.', '20', '30', '80', '2'),";
                sqlProduto += "('Geladeira Gamer', 'Geladeira com recursos especiais para gamers, como um cooler para latas de bebida.', '4000', '5000', '50', '1'),";
                sqlProduto += "('Monitor Comum', 'Monitor com boa resolução e taxa de atualização para uso diário.', '600', '700', '5', '2'),";
                sqlProduto += "('Smartphone Solar', 'Smartphone com painel solar integrado para carregamento ao ar livre.', '1200', '1400', '30', '4'),";
                sqlProduto += "('Teclado Projetável', 'Teclado virtual projetável que pode ser usado em qualquer superfície plana.', '200', '250', '40', '1'),";
                sqlProduto += "('Monitor Transparente', 'Monitor com tecnologia de exibição transparente para uma experiência de visualização futurista.', '800', '1000', '20', '2'),";
                sqlProduto += "('Webcam de Privacidade', 'Webcam com cobertura física integrada para privacidade.', '100', '150', '35', '3'),";
                sqlProduto += "('Teclado de Papel', 'Teclado dobrável e leve feito de material durável semelhante ao papel.', '25', '40', '60', '2'),";
                sqlProduto += "('Geladeira Inteligente', 'Geladeira com tela sensível ao toque e conectividade à Internet para rastreamento e pedidos de alimentos.', '5000', '6000', '15', '1'),";
                sqlProduto += "('Smartphone com Tradução em Tempo Real', 'Smartphone com capacidade de tradução em tempo real para chamadas telefônicas.', 1500, 1700, 20, 4),";
                sqlProduto += "('Console Retrô', 'Console de jogos retrô pré-carregado com jogos clássicos.', 300, 350, 30, 4)";
                con.query(sqlProduto);
                tabela.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }        
    }
 
}
