package com.serratec.uteis;

import java.io.InputStream;
import java.net.URLConnection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.concurrent.*;

public class Util {
	public static Scanner in = new Scanner(System.in);
	public static final String CABECALHO = "SISTEMA BIBLIOTECA NACIONAL";
	public static final String LINHA = "----------------------------------";
	public static final String LINHAD = "==================================";
	
	public enum CRUD {
		CADASTRAR,
		ALTERAR,
		EXCLUIR,
		IMPRIMIR
	}
	
	public static void br() {
		System.out.println("");
	}
	
	public static void escrever(String mensagem) {
		System.out.println(mensagem);
	}
	
	public void preencherEspaco(String teste) {
		for(int i = 0; i < teste.length(); i++) {
			
		}
	}
	
	   public static String preencherEspacos(int tamanho, String texto) {
	        StringBuilder resultado = new StringBuilder(texto);
	        
	        int preencher = tamanho - texto.length();
	        
	        for (int i = 0; i < preencher; i++) {
	            resultado.append(" ");
	        }
	        
	        //resultado.append("║");
	        
	        return resultado.toString();
	    }
	
	public static LocalDate validarData(String mensagem) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate dataConvertida = null;
		String sData; 
		boolean dataValidada = false;
		
		do {
			System.out.print(mensagem);
			sData = in.next();
			try {
				dataConvertida = LocalDate.parse(sData, dtf);   
				dataValidada = true;
				return dataConvertida;
			} catch (Exception e) {
				System.out.print("║");
				System.err.println("Data invalida");
			}
			
		} while (!dataValidada);
		return null;
	}
	
 	public static int validarInteiro(String mensagem) {
		int numero = 0;
		boolean validado = false;		
		
		do {
			try {
				System.out.print(mensagem);
				String s = in.next();
				numero = Integer.parseInt(s);
				validado = true;
			} catch (Exception e) {
				System.out.print("║");
				System.err.println("Informe um numero valido - " + e.getMessage());
			}
		} while (!validado);
		
		return numero;
	}
	
	public static double validarDouble(String mensagem) {
		double numero = 0.0;
		boolean validado = false;
		
		do {
			try {
				System.out.print(mensagem);
				String s = in.next();			
				numero = Double.parseDouble(s);
				validado = true;
			} catch (Exception e) {
				System.out.print("║");
				System.err.println("Informe um numero valido - " + e.getMessage());
			}
		} while (!validado);
		
		return numero;
	}
	
    public static String validarCPF(){
        String cpf;
        //in.nextLine();

        do {
        	
            
            try {
            	Thread.sleep(500);
            	System.out.print("║CPF: ");
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
            cpf = in.next();
            
            if (!verificarNumerico(cpf) || cpf.length() != 11) {
            	System.out.print("║");
                System.err.println("Erro: CPF inválido. Por favor, digite os 11 dígitos.");

            }
        } while (!verificarNumerico(cpf) || cpf.length() != 11);
        return cpf;
    }
    
    public static String validarTelefone(){
        String telefone;
        //in.nextLine();

        do {
        	
            
            try {
            	Thread.sleep(500);
            	System.out.print("║Telefone: ");
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
            telefone = in.next();
            
            if (!verificarNumerico(telefone) || telefone.length() != 11) {
            	System.out.print("║");
                System.err.println("Erro: Telefone inválido. Por favor, digite o telefone com DDD.");

            }
        } while (!verificarNumerico(telefone) || telefone.length() != 11);
        return telefone;
    }
    
    public static boolean verificarNumerico(String str) {
        return str.matches("\\d+");
    }
    
    public static String buscarCep(){
    	String cep;
    	String logradouro;
    	String bairro;
    	String cidade;
    	String uf;
    	String endereco;
    	String numero_residencia = "";
    	String complemento = "";
        String json;   
        boolean verificaErroCep = false;

	    do {
	        System.out.print("║Informe o CEP: ");
			cep = in.next();
	        if (!Util.verificarNumerico(cep) || cep.length() != 8) {
	        	System.out.print("║");
	            System.err.println("ERRO: CEP inválido. Digite um CEP com 8 dígitos numéricos!");
	        }
	        if (Util.verificarNumerico(cep) && cep.length() == 8) {
	        	verificaErroCep = verificarSeCepExiste(cep);
	        	if (verificaErroCep == true) {
	        		System.out.println("║CEP não existente");
	        	}
	        }        
	        
	    } while (!Util.verificarNumerico(cep) || cep.length() != 8 || verificaErroCep == true);
		
        try {
        	
            URL url = new URL("http://viacep.com.br/ws/"+ cep +"/json");
            URLConnection urlConnection = url.openConnection();
            InputStream is = urlConnection.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            

            StringBuilder jsonSb = new StringBuilder();

            br.lines().forEach(l -> jsonSb.append(l.trim()));
            json = jsonSb.toString();
            json = json.replaceAll("[{},:]", "");
            json = json.replaceAll("\"", "\n");                       
            String array[] = new String[30];
            array = json.split("\n");
            in.nextLine();
         	System.out.print("║Número da residência:");
         	numero_residencia = in.nextLine();
         	
         	System.out.print("║Complemento: ");
         	complemento = in.nextLine();
         	
    		System.out.println("║                                          ║");
    		System.out.println("╚══════════════════════════════════════════╝");
            
            logradouro = array[7];            
            bairro = array[15];
            cidade = array[19]; 
            uf = array[23];
            
            if(complemento == "") {
                endereco = logradouro + ", " + numero_residencia + " - " + bairro + " - " + 
             		   cidade + " - " + uf;
                System.out.println("╔══════════════════════════════════════════╗");
        		System.out.println("║           ENDEREÇO ENCONTRADO            ║");
        		System.out.println("║------------------------------------------║");	
                System.out.print(Util.preencherEspacos(43, "║"+logradouro + ", " + numero_residencia));System.out.println("║");
                System.out.print(Util.preencherEspacos(43, "║"+bairro + " - " + cidade + " - " + uf));System.out.println("║");
        		System.out.println("║------------------------------------------║");	
        		System.out.println("║ Deseja proseguir com esse endereço?(S/N) ║");
        		System.out.println("╚══════════════════════════════════════════╝");
            }else {
            	endereco = logradouro + ", " + numero_residencia + " - " + bairro + " - " + 
            			cidade + " - " + uf + " - Complemento: " + complemento;
                System.out.println("╔══════════════════════════════════════════╗");
        		System.out.println("║           ENDEREÇO ENCONTRADO            ║");
        		System.out.println("║------------------------------------------║");	
                System.out.print(Util.preencherEspacos(43, "║"+logradouro + ", " + numero_residencia));System.out.println("║");
                System.out.print(Util.preencherEspacos(43, "║"+bairro + " - " + cidade + " - " + uf));System.out.println("║");
                System.out.print(Util.preencherEspacos(43, "║Complemento: " + complemento));System.out.println("║");
        		System.out.println("║------------------------------------------║");	
        		System.out.println("║ Deseja prosseguir com esse endereço?(S/N)║");
        		System.out.println("╚══════════════════════════════════════════╝");
            }
            char opcao;///= in.next().toLowerCase().charAt(0);
            do {
            	System.out.print("[S/N]>");
            	opcao = in.next().toLowerCase().charAt(0);
	            switch(opcao) {
	            	case 's':
	            		break;
	            	case 'n':
	            		System.out.println("╔══════════════════════════════════════════╗");
	            		buscarCep();
	            		break;
	            	default:
	            		System.err.println("Opção inválida!");
	            		continue;
	            }
            }while(opcao != 's' && opcao != 'n');
            
            return endereco;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } 
    }

    public static boolean verificarSeCepExiste(String cep){
        try {
            String json;   
            URL url = new URL("http://viacep.com.br/ws/"+ cep +"/json");
            URLConnection urlConnection = url.openConnection();
            InputStream is = urlConnection.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder jsonSb = new StringBuilder();
            String teste;
            br.lines().forEach(l -> jsonSb.append(l.trim()));
            json = jsonSb.toString();
            json = json.replaceAll("[{},:]", "");
            json = json.replaceAll("\"", "\n");                       
            String array[] = new String[30];
            array = json.split("\n");
            teste = array[2];
            boolean testeAsBoolean = Boolean.parseBoolean(teste.trim());
            
            if (testeAsBoolean == true) {
            	return true;
            } else return false;                
            
        } catch (Exception e) {
            throw new RuntimeException(e);
        } 
    }
    
	
}
