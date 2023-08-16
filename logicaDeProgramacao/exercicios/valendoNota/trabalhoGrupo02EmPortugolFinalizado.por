programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> txt
	inclua biblioteca Matematica --> matematica
	inclua biblioteca Calendario --> data
	inclua biblioteca Util --> util

	const inteiro QUANT_PRODUTOS = 6
	inteiro estoque[QUANT_PRODUTOS]= {5894,3543,2871,23,8,6686}
	inteiro orcamento[QUANT_PRODUTOS] = {0,0,0,0,0,0}, qtdProd[QUANT_PRODUTOS]
	cadeia nomeCliente, data = "Data: " + (data.dia_mes_atual()+"/"+data.mes_atual()+"/"+data.ano_atual())

	cadeia vl_Total_Esp[QUANT_PRODUTOS], vl_Liquid_Esp[QUANT_PRODUTOS], qtd_Esp[QUANT_PRODUTOS], Tl_Desc_Acresc_Esp = "", Tl_Liquid_Esp = "", Nome_Esp = "", porcent = ""
	real precoProdutos[QUANT_PRODUTOS] = {0.54,2.36,0.17,4.99,5.35,0.07}
	
	funcao inicio()
	{
		escreva(data+"\n")
		escreva("╔════════════════════════════════════╗\n")
		escreva("║                                    ║\n")
		escreva("║        LOJA DE FERRAMENTAS         ║\n")
    		escreva("║  GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    		escreva("║                                    ║\n")
		escreva("║════════════════════════════════════║\n")
		escreva("║ INFORME O PRIMEIRO NOME DO CLIENTE ║\n")
		escreva("╚════════════════════════════════════╝\nCliente: ")
		leia(nomeCliente)
		limpa()
		menu()
	}
	funcao menu()
	{
		inteiro opcaoMenu = 0
		cadeia opcaoProtegida
		
		escreva("Cliente: "+nomeCliente+"\t"+data+"\n")
		escreva("╔═══════════════════════════════════╗\n")
		escreva("║                                   ║\n")
		escreva("║       LOJA DE FERRAMENTAS         ║\n")
    		escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    		escreva("║                                   ║\n")
		escreva("║═══════════════════════════════════║\n")
		escreva("║               MENU                ║\n")
		escreva("║-----------------------------------║\n")
		escreva("║                                   ║\n")
		escreva("║    [1] - Criar/Alterar orçamento  ║\n")
		escreva("║    [2] - Excluir orçamento        ║\n")
		escreva("║    [3] - Imprimir orçamento       ║\n")
		escreva("║                                   ║\n")
		escreva("║-----------------------------------║\n")
		escreva("║     Aperte '4' para finalizar     ║\n")
		escreva("╚═══════════════════════════════════╝\n> ")
		leia(opcaoProtegida)

		se(nao tp.cadeia_e_inteiro(opcaoProtegida, 10)){
			opcaoInvalida()
			menu()
		}senao{
			opcaoMenu = tp.cadeia_para_inteiro(opcaoProtegida, 10)
			escolha (opcaoMenu){
				caso 1: limpa()criarAlterarOrcamento() pare
				caso 2: limpa()excluirOrcamento(opcaoMenu) pare
				caso 3: limpa()imprimirOrcamento() pare
				caso 4: limpa()
				escreva("╔═══════════════════════════════════╗\n")
				escreva("║          Volte Sempre!!!          ║\n")
				escreva("╚═══════════════════════════════════╝\n>")
				pare
				caso contrario : 
					opcaoInvalida()
					menu()
			}
		}
	}
	 
	//MENU
	funcao criarAlterarOrcamento()
	{ 
		inteiro produtoEscolhido = 0
		cadeia opcaoProtegida

		faca{
			escreva("Cliente: "+nomeCliente+"\t"+data+"\n")
			escreva("╔═══════════════════════════════════╗\n")
			escreva("║                                   ║\n")
			escreva("║       LOJA DE FERRAMENTAS         ║\n")
    			escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    			escreva("║                                   ║\n")
			escreva("║═══════════════════════════════════║\n")
			escreva("║        ADICIONAR PRODUTOS         ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║                                   ║\n")
			escreva("║        [1] - Parafuso             ║\n")
			escreva("║        [2] - Arruela              ║\n")
			escreva("║        [3] - Porca                ║\n")
			escreva("║        [4] - Chave de Fenda       ║\n")
			escreva("║        [5] - Brocas               ║\n")
			escreva("║        [6] - Buchas               ║\n")
			escreva("║                                   ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║ Aperte '7' para voltar ao [MENU]  ║\n")
			escreva("╚═══════════════════════════════════╝\n> ")
			leia(opcaoProtegida)
	
			se(nao tp.cadeia_e_inteiro(opcaoProtegida, 10)){
				opcaoInvalida()
			}senao{
				produtoEscolhido = tp.cadeia_para_inteiro(opcaoProtegida, 10)
				se(produtoEscolhido < 1 ou produtoEscolhido > 7){
					opcaoInvalida()
				}senao{
					escolha(produtoEscolhido){
						caso 7:
							limpa()
							menu()
							pare
						caso contrario:
							verificarEstoque(produtoEscolhido)
							pare
					}
				}
			}
		}enquanto(nao tp.cadeia_e_inteiro(opcaoProtegida, 10) ou produtoEscolhido < 1 ou produtoEscolhido > 7)
	}	
	funcao excluirOrcamento(inteiro &opcaoMenu)
	{
		cadeia opcaoProtegida
		caracter opcaoExcluir

		faca{
			escreva("Cliente: "+nomeCliente+"\tData: "+data+"\n")
			escreva("╔═══════════════════════════════════╗\n")
			escreva("║                                   ║\n")
			escreva("║       LOJA DE FERRAMENTAS         ║\n")
    			escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    			escreva("║                                   ║\n")
			escreva("║═══════════════════════════════════║\n")
			escreva("║        EXCLUIR ORÇAMENTO          ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║                                   ║\n")
			escreva("║  Ao confirmar, todo o orçamento   ║\n")
			escreva("║         será excluído!            ║\n")
			escreva("║                                   ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║     Deseja continuar? (S/N)       ║\n")
			escreva("╚═══════════════════════════════════╝\n> ")
			leia(opcaoProtegida)
			limpa()
	
			se(nao tp.cadeia_e_caracter(opcaoProtegida)){
				opcaoInvalida()
			}senao{
				opcaoProtegida = txt.caixa_baixa(opcaoProtegida)
				opcaoExcluir = tp.cadeia_para_caracter(opcaoProtegida)
				escolha(opcaoExcluir){
					caso 's':
						para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
							orcamento[i]= 0
						}
						escreva("Cliente: "+nomeCliente+"\tData: "+data+"\n")
						escreva("╔═══════════════════════════════════╗\n")
						escreva("║                                   ║\n")
						escreva("║       LOJA DE FERRAMENTAS         ║\n")
    						escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    						escreva("║                                   ║\n")
						escreva("║═══════════════════════════════════║\n")
						escreva("║        EXCLUIR ORÇAMENTO          ║\n")
						escreva("║-----------------------------------║\n")
						escreva("║                                   ║\n")
						escreva("║   Orçamento excluído com sucesso! ║\n")
						escreva("║                                   ║\n")
						escreva("╚═══════════════════════════════════╝\n")
						util.aguarde(3000)
						limpa()
						menu()
						pare
					caso 'n':
						escreva("Cliente: "+nomeCliente+"\tData: "+data+"\n")
						escreva("╔═══════════════════════════════════╗\n")
						escreva("║                                   ║\n")
						escreva("║       LOJA DE FERRAMENTAS         ║\n")
    						escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    						escreva("║                                   ║\n")
						escreva("║═══════════════════════════════════║\n")
						escreva("║        EXCLUIR ORÇAMENTO          ║\n")
						escreva("║-----------------------------------║\n")
						escreva("║                                   ║\n")
						escreva("║     Orçamento não excluído!       ║\n")
						escreva("║                                   ║\n")
						escreva("╚═══════════════════════════════════╝\n")
						util.aguarde(3000)
						limpa()
						menu()
						pare
					caso contrario:
						opcaoInvalida()
						pare
				}
			}
			se(opcaoMenu == 4)pare
		}enquanto(txt.caixa_baixa(opcaoProtegida) != "s" ou txt.caixa_baixa(opcaoProtegida) != "n")
	}
	funcao imprimirOrcamento()
	{
		cadeia produtos[QUANT_PRODUTOS] = {"Parafuso      ", "Arruela       ", "Porca         ","Chave de Fenda", "Broca         ","Bucha         "}
		cadeia codigoProduto[QUANT_PRODUTOS] = {"645","435","655","787","435","545"}
		real descAcresc =0.0
		inteiro formaDePagamento = 0

		formaPagamento(descAcresc, formaDePagamento)

		alinhamento(verdadeiro, descAcresc, formaDePagamento)
		
		escreva("╔════════════════════════════════════════════════════════════════════════════════════════════╗\n")
		escreva("║                                                                                            ║\n")
		escreva("║                                         ORÇAMENTO                                          ║\n")
		escreva("║                                                                                            ║\n")
		
		escreva(Nome_Esp)
		escreva("\n║════════════════════════════════════════════════════════════════════════════════════════════║")
		escreva("\n║Cod.Prod. | Nome Produto   | Qtd    | Val.Un. |  Val.Tot.   | Desc./Acresc. |  Val.Liqd.    ║\n")
		escreva("║════════════════════════════════════════════════════════════════════════════════════════════║\n")
		
		para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
			se(orcamento[i] != 0){
				
				escreva("║"+codigoProduto[i] +"       | " + produtos[i] + " |" + qtd_Esp[i] + precoProdutos[i] + "    |" + vl_Total_Esp[i] 
				+ "       "+porcent + "      |" + vl_Liquid_Esp[i] +"\n")
					
				escreva("║--------------------------------------------------------------------------------------------║\n")
			}
		}
		
		alinhamento(falso, descAcresc, formaDePagamento)
			
		escreva("║                                                                                            ║\n")
		escreva("║                                                                                            ║")
		escreva(Tl_Desc_Acresc_Esp)
		escreva(Tl_Liquid_Esp)
		escreva("\n╚════════════════════════════════════════════════════════════════════════════════════════════╝\n\n")
	}
	funcao verificarEstoque(inteiro produtoEscolhido)
	{
		inteiro quantidadeProduto
		
		const cadeia NOMES_PRODUTOS[QUANT_PRODUTOS] = {"Parafusos", "Arruelas", "Porcas","Chaves Fenda", "Brocas","Buchas"}

		se(orcamento[produtoEscolhido-1] != 0){
			escreva("Há "+orcamento[produtoEscolhido-1]+" " +NOMES_PRODUTOS[produtoEscolhido-1]+", qual a quantidade que deseja colocar no lugar: ")
			leia(quantidadeProduto)
			
			se(quantidadeProduto > 999999){
				escreva("\nVocê excedeu o limite de unidades por produto (MÁX.999999).")
				util.aguarde(3000)
				limpa()
				criarAlterarOrcamento()
			}
			orcamento[produtoEscolhido-1]=quantidadeProduto
			escreva("\nPerfeito, a nova quantidade de " +NOMES_PRODUTOS[produtoEscolhido-1]+" é " + orcamento[produtoEscolhido-1] + ". ")
			
			se(quantidadeProduto <= estoque[produtoEscolhido-1] ){
				escreva("\nQuantidade alterada!\n")
				escreva("Há ainda "+ (estoque[produtoEscolhido-1]-quantidadeProduto) + " no estoque.")
			}senao{
				escreva("\nNão há essa quantidade no estoque, porém quantidade adicionada no orçamento.")
			}
			
			orcamento[produtoEscolhido-1]=quantidadeProduto
			qtdProd[produtoEscolhido-1] = quantidadeProduto
			util.aguarde(4000)
			limpa()
			criarAlterarOrcamento()
		}senao{
			escreva("Quantos "+NOMES_PRODUTOS[produtoEscolhido-1]+" você deseja acrescentar:" )
			leia(quantidadeProduto)
				
			se(quantidadeProduto > 999999){
				escreva("\nVocê excedeu o limite de unidades por produto (MÁX.999999).")
				util.aguarde(3000)
				limpa()
				criarAlterarOrcamento()
			}

			se(quantidadeProduto <= estoque[produtoEscolhido-1] ){
				escreva("\nProduto Adicionado!\n")
				escreva("Há ainda "+ (estoque[produtoEscolhido-1]-quantidadeProduto) + " no estoque.")
			}senao{
				escreva("\nNão há essa quantidade no estoque, porém quantidade adicionada no orçamento.")
			}
			
			orcamento[produtoEscolhido-1]=quantidadeProduto
			qtdProd[produtoEscolhido-1] = quantidadeProduto
			util.aguarde(4000)
			limpa()
			criarAlterarOrcamento()
		}	
	}
	funcao formaPagamento(real &descAcresc, inteiro &formaDePagamento)
	{
		cadeia opcaoProtegida
		
		faca{
			escreva("Cliente: "+nomeCliente+"\t"+data+"\n")
			escreva("╔═══════════════════════════════════╗\n")
			escreva("║                                   ║\n")
			escreva("║       LOJA DE FERRAMENTAS         ║\n")
    			escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    			escreva("║                                   ║\n")
			escreva("║═══════════════════════════════════║\n")
			escreva("║   ESCOLHA A FORMA DE PAGAMENTO    ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║                                   ║\n")
			escreva("║      [1] - À VISTA (5% DESC.)     ║\n")
			escreva("║      [2] - À PRAZO (5% ACRESC.)   ║\n")
			escreva("║      [3] - CARTÃO                 ║\n")
			escreva("║                                   ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║ Aperte '4' para voltar ao [MENU]  ║\n")
			escreva("╚═══════════════════════════════════╝\n> ")
			leia(opcaoProtegida)
			limpa()
	
			se(nao tp.cadeia_e_inteiro(opcaoProtegida, 10)){
				opcaoInvalida()
			}senao{
				formaDePagamento = tp.cadeia_para_inteiro(opcaoProtegida, 10)
	
				escolha(formaDePagamento){
					caso 1:
						descAcresc = 0.95
						porcent = "5%"
						pare
					caso 2:
						descAcresc = 1.05
						porcent = "5%"
						pare
					caso 3:
						descAcresc = 1.00
						porcent = "--"
						pare
					caso 4:
						limpa()
						menu()
						pare
					caso contrario:
						opcaoInvalida()
						opcaoProtegida = ""
						pare
				}
			}
		}enquanto(nao tp.cadeia_e_inteiro(opcaoProtegida, 10))
	}
	//ATALHOS
	funcao opcaoInvalida()
	{
			limpa()
			escreva("Cliente: "+nomeCliente+"\t"+data+"\n")
			escreva("╔═══════════════════════════════════╗\n")
			escreva("║                                   ║\n")
			escreva("║       LOJA DE FERRAMENTAS         ║\n")
    			escreva("║ GRUPO 02 COMÉRCIO VAREJISTA LTDA  ║\n")
    			escreva("║                                   ║\n")
			escreva("║═══════════════════════════════════║\n")
			escreva("║              ERRO!!               ║\n")
			escreva("║-----------------------------------║\n")
			escreva("║                                   ║\n")
			escreva("║         Opção inválida!           ║\n")
			escreva("║                                   ║\n")
			escreva("╚═══════════════════════════════════╝\n> ")
			util.aguarde(2000)
			limpa()
	}
	funcao alinhamento(logico controle, real &descAcresc, inteiro formaDePagamento)
	{
		se(controle == verdadeiro){
			inteiro cntNome, resultEspNome
			
			cntNome = Texto.numero_caracteres(nomeCliente)
			resultEspNome = 72 - (cntNome + 17)
			
			Nome_Esp = "║Nome do Cliente: " + nomeCliente + Texto.preencher_a_esquerda(' ', resultEspNome , data)+" - Válido por 7 dias║"
	
		
			para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
	
				inteiro resultEsp
				cadeia esp_vlTotal[QUANT_PRODUTOS]
				real calc_vlTotal[QUANT_PRODUTOS] 
				
				calc_vlTotal[i] = matematica.arredondar(precoProdutos[i]*qtdProd[i],2)
				esp_vlTotal[i] = tp.real_para_cadeia(calc_vlTotal[i])
				
				resultEsp = txt.numero_caracteres(esp_vlTotal[i])
	
				vl_Total_Esp[i] = " " + esp_vlTotal[i] + Texto.preencher_a_esquerda(' ', 13 - resultEsp  , "|")
			}
	
			para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
	
				inteiro resultEsp
				cadeia esp_qtd[QUANT_PRODUTOS]
				
				esp_qtd[i] = tp.inteiro_para_cadeia(orcamento[i], 10)
				
				resultEsp = txt.numero_caracteres(esp_qtd[i])
	
				qtd_Esp[i] = " " + orcamento[i] + Texto.preencher_a_esquerda(' ', 9 - resultEsp  , " | ")
			}
	
			para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
	
				inteiro resultEsp
				cadeia esp_Vl_Liquid[QUANT_PRODUTOS]
				
				esp_Vl_Liquid[i] = tp.real_para_cadeia((matematica.arredondar((precoProdutos[i]*qtdProd[i])*descAcresc,2)))
				
				resultEsp = txt.numero_caracteres(esp_Vl_Liquid[i])
	
				vl_Liquid_Esp[i] = " " + (matematica.arredondar((precoProdutos[i]*qtdProd[i])*descAcresc,2)) + Texto.preencher_a_esquerda(' ', 15 - resultEsp  , " ║")
	
			}
		}senao{

			inteiro resultEsp
			cadeia esp_Tl_Desc_Acresc
			real prdDescTl = 0.0, somaTotal = 0.0

			para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
				prdDescTl += (precoProdutos[i]*0.05)*qtdProd[i]
			}
				
			esp_Tl_Desc_Acresc = tp.real_para_cadeia(matematica.arredondar(prdDescTl,2))
				
			resultEsp = txt.numero_caracteres(esp_Tl_Desc_Acresc)
			resultEsp = 93 - (resultEsp + 21)
				
			se(formaDePagamento == 1) Tl_Desc_Acresc_Esp = "\n║Total Desc/Acresc.: -" + matematica.arredondar(prdDescTl,2) + Texto.preencher_a_esquerda(' ', resultEsp  , " ║")
			senao Tl_Desc_Acresc_Esp = "\n║Total Desc/Acresc.:  " + matematica.arredondar(prdDescTl,2) + Texto.preencher_a_esquerda(' ', resultEsp  , " ║")		
	
			inteiro resultEsp2
			cadeia esp_Tl_Liquid
			
			para(inteiro i = 0; i < QUANT_PRODUTOS; i++){
				somaTotal += (precoProdutos[i]*qtdProd[i])*descAcresc
			}

			esp_Tl_Liquid = tp.real_para_cadeia(matematica.arredondar(somaTotal,2))
				
			resultEsp2 = txt.numero_caracteres(esp_Tl_Liquid)
			resultEsp2 = 93 - (resultEsp2 + 25)
	
			Tl_Liquid_Esp = "\n║Valor Liquido a pagar: R$" + matematica.arredondar(somaTotal,2) + Texto.preencher_a_esquerda(' ', resultEsp2  , " ║")
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4613; 
 * @DOBRAMENTO-CODIGO = [16, 55, 60, 58, 31, 82, 77, 125, 203, 242, 298, 354, 373];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {opcaoMenu, 126, 34, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */