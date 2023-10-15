programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> ut
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> mt

	//Michael de Paula Vieira
	//Turma 10 - Teresópolis

	const inteiro QUANT_EXERCICIOS = 15
	const cadeia ALUNO[] = {"Michael de Paula Vieira","Turma10 - Teresópolis"}

	//---------EXERCICIO 09------------------------------------------------------//
	//O alterar não foi tratado para retornar ao menu caso nenhum nome tenho sido incluído.
	const inteiro QUANT_PESSOAS = 10
	cadeia v_nome[QUANT_PESSOAS], v_idadeProtegida[QUANT_PESSOAS], scanProtegido
	inteiro v_idade[QUANT_PESSOAS]
	caracter scan
	//---------EXERCICIO 09------------------------------------------------------//
	 
	funcao inicio()
	{
		espaco(5)linha(39)
		espaco(5)escreva("Olá professor Ricardo!! Seja Bem vindo.\n")
		espaco(5)linha(39)
		espaco(5)escreva("CARREGANDO MENU DOS EXERCICIOS\n")
		espaco(5)linhaSimples(39)
		espaco(5)loading(39)
		limpa()
		menu()
	}
	funcao menu()
	{
		cadeia opcaoProtegida
		inteiro opcao
		
		escreva("SELECIONE O EXERCÍCIO:\n")

		para(inteiro i = 0; i < QUANT_EXERCICIOS; i++){
			se(i < 9)escreva("\n[0"+(i+1)+"º]-Exercício")
			senao escreva("\n["+(i+1)+"º]-Exercicio")
		}
		escreva("\n\nDigite 'S' para sair.")
		escreva("\n>")
		leia(opcaoProtegida)
		
		
		se(txt.caixa_baixa(opcaoProtegida) == "s"){
			limpa()
			escreva("PROGRAMA ENCERRADO COM SUCESSO\nVOLTE SEMPRE!!\n\n")
		}senao se(tp.cadeia_e_inteiro(opcaoProtegida, 10)){
			opcao = tp.cadeia_para_inteiro(opcaoProtegida, 10)
			escolha(opcao){
				caso 1:
					limpa()
					Exercicio01()
					pare
				caso 2:
					limpa()
					Exercicio02()
					pare
				caso 3:
					limpa()
					Exercicio03()
					pare
				caso 4:
					limpa()
					Exercicio04()
					pare
				caso 5:
					limpa()
					Exercicio05()
					pare
				caso 6:
					limpa()
					Exercicio06()
					pare
				caso 7:
					limpa()
					Exercicio07()
					pare
				caso 8:
					limpa()
					Exercicio08()
					pare
				caso 9:
					limpa()
					Exercicio09()
					pare
				caso 10:
					limpa()
					Exercicio10()
					pare
				caso 11:
					limpa()
					Exercicio11()
					pare
				caso 12:
					limpa()
					Exercicio12()
					pare
				caso 13:
					limpa()
					Exercicio13()
					pare
				caso 14:
					limpa()
					Exercicio14()
					pare
				caso 15:
					limpa()
					Exercicio15()
					pare
				caso contrario:
					limpa()
					escreva("Exercicio não encontrado!!\n\n")
					menu()
					pare
			}
		}senao{
			limpa()
			escreva("Opção inválida!!\n\n")
			menu()
		}
	}

	//EXERCICIOS
	funcao Exercicio01()
	{
		/*
		1) Faça um programa que receba a idade de 15 pessoas e que calcule e mostre:
		a) A quantidade de pessoas em cada faixa etária;
		b) A percentagem de pessoas na primeira e na última faixa etária, com relação ao total de pessoas: 
		
		Até 15 anos
		De 16 a 30 anos
		De 31 a 45 anos
		De 46 a 60 anos
		Acima de 61 anos
		 */

		const inteiro QUANT_PESSOAS = 15
		inteiro ate15=0, de16a30=0, de31a45=0, de46a60=0, mais60=0
		inteiro vPessoa[QUANT_PESSOAS]
		cadeia vPessoaProtegido[QUANT_PESSOAS]

		para(inteiro i = 0; i < QUANT_PESSOAS; i++){
			escreva("Informe a idade da "+(i+1)+"º pessoa: ")
			leia(vPessoaProtegido[i])
			limpa()

			se(tp.cadeia_e_inteiro(vPessoaProtegido[i], 10)){
				vPessoa[i] = tp.cadeia_para_inteiro(vPessoaProtegido[i], 10)
				
				se(vPessoa[i] < 0){
					limpa()
					escreva("Informe uma idade válida!!\n")
					i--
				}senao se(vPessoa[i] <= 15){
					ate15++
				}senao se(vPessoa[i] <= 30){
					de16a30++
				}senao se(vPessoa[i] <= 45){
					de31a45++
				}senao se(vPessoa[i] <= 60){
					de46a60++
				}senao se(vPessoa[i] > 60){
					mais60++
				}
			}senao{
				escreva("Informe apenas números inteiros!\n\n")
				i--
			}
				
		}

		real resultAte15 = (tp.inteiro_para_real(ate15)/QUANT_PESSOAS)*100
		real resultMais60 = (tp.inteiro_para_real(mais60)/QUANT_PESSOAS)*100
		limpa()
					
		escreva("\nAté 15 anos: [" + ate15 + "]")
		escreva("\nDe 16 a 30 anos: [" + de16a30 + "]")
		escreva("\nDe 31 a 45 anos: [" + de31a45 + "]")
		escreva("\nDe 46 a 60 anos: [" + de46a60 + "]")
		escreva("\nAcima de 60 anos: [" + mais60 + "]\n\n")

		escreva("["+mt.arredondar(resultAte15, 2)+"%] são menores de 16 anos\n")
		escreva("["+mt.arredondar(resultMais60, 2)+"%] são maiores de 60 anos")
		retornar()
		
	}
	funcao Exercicio02()
	{
		/*
		 2) Faça um programa que verifique e mostre os números entre 1.000 e 2.000 (inclusive) que, 
		 quando divididos por 11 produzam resto igual a 2.
		 */
		 para(inteiro i = 1000; i <= 2000; i++){
		 	se(i%11 == 2) escreva("["+i+"] ")
		 }
		 retornar()
	}
	funcao Exercicio03()
	{
	/*
	3) Faça um programa que leia três valores (A, B, C) e mostre-os na ordem lida.  
	Em seguida, mostre-os em ordem crescente e decrescente.
	*/	
		const inteiro QUANT_NUM =3
		inteiro num[QUANT_NUM]

		para(inteiro i = 0; i < QUANT_NUM; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(num[i])
			limpa()
		}

		escreva("ORDEM LIDA\n")
		linha(25)
		br(1)
		para(inteiro i = 0; i < QUANT_NUM; i++){
			escreva("["+num[i]+"] ")
		}
		br(3)
		escreva("ORDEM CRESCENTE\n")
		linha(25)
		br(1)
		para(inteiro i = 0; i < QUANT_NUM-1; i++){
			para(inteiro j = 0; j < (QUANT_NUM-i)-1; j++){
				se(num[j] > num[j+1]){
					inteiro backup = num[j]
					num[j] = num[j+1]
					num[j+1] = backup
				}
			}
		}

		para(inteiro i = 0; i < QUANT_NUM; i++){
			escreva("["+num[i]+"] ")
		}
		
		br(3)
		escreva("ORDEM DECRESCENTE\n")
		linha(25)
		br(1)
		para(inteiro i = 0; i < QUANT_NUM; i++){
			para(inteiro j = 0; j < QUANT_NUM-1; j++){
				se(num[j] < num[j+1]){
					inteiro backup = num[j]
					num[j] = num[j+1]
					num[j+1] = backup
				}
			}
		}

		para(inteiro i = 0; i < QUANT_NUM; i++){
			escreva("["+num[i]+"] ")
		}

		br(3)
		retornar()
		
	
	}
	funcao Exercicio04()
	{
		/*
		4) Uma loja tem tem uma política de descontos de acordo com o valor da compra do cliente. 
		Os descontos começam acima dos R$500. A cada 100 reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%. 
	
	 	Por exemplo: R$500 = 1% || R$600,00 = 2% … etc…
	
	 	Faça um programa que exiba essa tabela de descontos no seguinte formato:  
	
	 	Valordacompra – porcentagem de desconto – valor final
	
		O total da compra deverá ser armazenado num vetor e a apresentação das compras realizadas e seus descontos, 
		deve ser a partir desse vetor.
		 */

		 //APENAS PARA ALINHAMENTO
		cadeia vlCompra, vlTotal, porcent
		//--------------------------------
		escreva("╔═════════════════════╗\n")
		escreva("║ TABELA DE DESCONTOS ║\n")
		escreva("║---------------------║\n")
		
		//linhaSimples(20)
		inteiro j =1
		para(inteiro i = 500; i < 3000; i = i+100){
			
			//---------------------------------------------------------------
			vlCompra = tp.inteiro_para_cadeia(i,10)
			txt.numero_caracteres(vlCompra)
			cadeia teste = txt.preencher_a_esquerda(' ', 8 , (vlCompra+" | "))

			porcent = tp.inteiro_para_cadeia(j , 10)
			cadeia teste3 = txt.preencher_a_esquerda(' ', 7 , (porcent+"% | "))

			vlTotal = tp.inteiro_para_cadeia((i-((i/100)*j)), 10)
			cadeia teste2 = txt.preencher_a_esquerda(' ', 7 , (vlTotal+" ║"))
			//------------------------------------------------------------------
			
			escreva("║"+teste+teste3+teste2+"\n")
			j++
		}
		escreva("╚═════════════════════╝")
		retornar()
		 
	}
	funcao Exercicio05()
	{
		/*
		5)Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado daquele tamanho com asteriscos. Seu programa deve usar laços de repetição e funcionar para quadrados com lados de todos os tamanhos entre 1 e 20.
	
		Por exemplo, para lado igual a 5:
		*****
		*****
		*****
		*****
		*****
			 */
		inteiro tamanho
		cadeia tamanhoProtegido

		faca{
			escreva("Quantos lados terá o quadrado?: ")
		 	leia(tamanhoProtegido)
		
		 	se(nao tp.cadeia_e_inteiro(tamanhoProtegido, 10)){
		 		limpa()
		 		escreva("Número inválido!!\nInforme apenas números inteiros.\n\n")
		 	}senao{
		 		tamanho = tp.cadeia_para_inteiro(tamanhoProtegido, 10)
		 		
		 		para(inteiro i = 0; i < tamanho; i++){
		 			para(inteiro j = 0; j < tamanho; j++){
		 				escreva("[*] ")
		 			}
		 			escreva("\n")
		 		}
		 	}	
		}enquanto((nao tp.cadeia_e_inteiro(tamanhoProtegido, 10)))
		retornar()
	}
	funcao Exercicio06()
	{
		/*
		6) Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado daquele tamanho com asteriscos e espaços em branco. 
		Seu programa deve funcionar para quadrados com lados de todos os tamanhos entre 1 e 20.
		Para lado igual a 5:
		*****
		*   *
		*   *
		*   *
		***** 
		*/

		inteiro tamanho = -1
		cadeia tamanhoProtegido

		faca{
			escreva("Quantos lados terá o quadrado?: (ENTRE 1 E 20)")
		 	leia(tamanhoProtegido)
		
		 	se(nao tp.cadeia_e_inteiro(tamanhoProtegido, 10)){
		 		limpa()
		 		escreva("Número inválido!!\nInforme apenas números inteiros.\n\n")
		 	}senao{
		 		tamanho = tp.cadeia_para_inteiro(tamanhoProtegido, 10)
		 		se(tamanho <= 1 ou tamanho >= 20){
		 			limpa()
		 			escreva("Quantidade inválido!!\nPermetido de [2] a [19].\n\n")
		 			Exercicio06()
		 		}senao{
			 		para(inteiro i = 0; i < tamanho; i++){
			 			para(inteiro j = 0; j < tamanho; j++){
			 				se(i == 0 ou i == tamanho-1 ou j == 0 ou j == tamanho-1) escreva("[*]")
			 				senao escreva("   ")
			 			}
			 			escreva("\n")
			 		}
		 		}
		 	}	
		}enquanto(nao tp.cadeia_e_inteiro(tamanhoProtegido, 10) ou tamanho <= 1 ou tamanho >= 20)
		retornar()
	}
	funcao Exercicio07()
	{
	/*
	7) Faça um programa que recebe a altura de um triangulo em um número inteiro e imprima-o utilizando asteriscos. Veja o Exemplo:

	Entrada: 5

	*
	**
	***
	****
	*****
	 */

	 	inteiro tamanho
		cadeia tamanhoProtegido

		faca{
			escreva("Qual será a altura do triângulo?: ")
		 	leia(tamanhoProtegido)
		
		 	se(nao tp.cadeia_e_inteiro(tamanhoProtegido, 10)){
		 		limpa()
		 		escreva("Número inválido!!\nInforme apenas números inteiros.\n\n")
		 	}senao{
		 		tamanho = tp.cadeia_para_inteiro(tamanhoProtegido, 10)
		 		
		 		para(inteiro i = 0; i < tamanho; i++){
		 			se(i > 0 e i < tamanho){
		 				para(inteiro j = 0; j < i; j++){
		 					escreva("[*]")
		 				}
		 			}
		 			escreva("[*]")
		 			escreva("\n")
		 		}
		 	}	
		}enquanto((nao tp.cadeia_e_inteiro(tamanhoProtegido, 10)))
		retornar()
	}
	funcao Exercicio08()
	{
	/*
	8) Faça um programa que peça um número inteiro e determine se ele é ou não um número primo. 
	Um número primo é aquele que é divisível somente por ele mesmo e por 1.
	*/
		cadeia numeroProtegido
		inteiro numero, divisor =0

		faca{
			escreva("Informe um número INTEIRO:")
			leia(numeroProtegido)
			limpa()
			
			se(tp.cadeia_e_inteiro(numeroProtegido,10)){
				numero = tp.cadeia_para_inteiro(numeroProtegido, 10)
				para(inteiro i = 1; i <= numero; i++){
					se(numero%i == 0) divisor++
				}
				
				se(divisor == 2) escreva("O número ["+numero+"] É primo!")
				senao escreva("O número ["+numero+"] NÃO é primo!")
				
			}senao escreva("Número inválido!!\n")
		}enquanto(nao tp.cadeia_e_inteiro(numeroProtegido,10))
		retornar()
	
	}
	funcao Exercicio09()
	{
	/*
	9) Faça um programa que peça o nome de 10 pessoas e a sua idade.
	Armazene os nomes num vetor e a idade em outro vetor.
	Crie um laço para fazer essas soliciações.
	
	Crie um menu que permita ao usuário deicidir se quer incluir, alterar ou excluir os dados dos vetores.
	
	Excluir significa limpar os dados (colocar vazio ou zero).
	A edição somente será permitida se o nome não estiver vazio. Nesse caso, deverá efetuar a inclusão.
	Crie um menu para organizar as funções.

	Exemplo:

	--------------------------------
      	Cadastro de pessoas
	--------------------------------
 	1 - Incluir
 	2 - Alterar
 	3 - Excluir
 	4 - Sair
	--------------------------------
	 */
	 exercicio09Menu()
	 
	}
	funcao Exercicio10()
	{
	/*
	 10) 1) Crie um algoritmo que peça ao usuário que informe oito números inteiros e os armazene-os em um
	vetor. Apresente o maior elemento e a posição em que ele se encontra no vetor. 

	Exemplo:
	0	1	2	3	4	5	6	7
	4	1 	3 	7 	13  	6 	-5 	9

	O maior valor do vetor informado é 13 e ele se encontra no índice 4 do vetor
	 */
		const inteiro QUANT_NUMEROS = 8
		inteiro v_numeros[QUANT_NUMEROS], scan, maior = v_numeros[0],indice = -1
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			limpa()
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}
		limpa()
		escreva("NÚMEROS LIDOS\n")
		linha(35)
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"] ")
		}
		br(1)
		linha(35)
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			se(v_numeros[i] > maior){
				maior = v_numeros[i]
				indice = i
			}
		}
		escreva("maior número: ["+v_numeros[indice]+"]\nEstá no indice: ["+indice+"]")
		retornar()
	}
	funcao Exercicio11()
	{
	/*
	11) Crie um algoritmo que peça ao usuário que informe 10 números inteiros, armazene-os em um vetor
	e apresente a soma de todos os valores. 

	Exemplo:
	0 	1 	2 	3 	4 	5 	6 	7 	8 	9
	1 	3 	5 	7 	8 	9 	10 	11 	12 	13

	A soma de todos os valores do vetor é: 79.
	*/

		const inteiro QUANT_NUMEROS = 10
		inteiro v_numeros[QUANT_NUMEROS], scan, resultado = 0
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			limpa()
			
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}
		
		limpa()
		escreva("NÚMEROS LIDOS\n")
		linha(45)
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"] ")
		}

		br(1)
		linha(45)
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			resultado += v_numeros[i]
		}

		escreva("A soma é: ["+resultado+"]")
		retornar()
	}
	funcao Exercicio12()
	{
		/*
		12) Faça um algoritmo que leia e mostre um vetor de 10 números inteiros. A seguir, peça ao usuário para
		informar um valor inteiro e positivo e mostre todos os números do vetor que são divisíveis por esse
		número. 
	
		Exemplo:
		0 	1 	2 	3 	4 	5	6 	7 	8 	9
		1 	3 	5 	7 	8 	9 	10 	11 	12 	13
	
		Valor informado: 3
		Os números que são divisíveis por 3 são: 3, 9 e 12.
		*/
		 
	 	const inteiro QUANT_NUMEROS = 10
		inteiro v_numeros[QUANT_NUMEROS], scan, resultado = 0, divisor = 0
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			limpa()
			
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}

		faca{
			escreva("Informe um divisor: (DEVE SER INTEIRO E POSITIVO)")
			leia(scanProtegido)
			limpa()
			
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				divisor = tp.cadeia_para_inteiro(scanProtegido, 10)
				se(divisor < 0) escreva("O divisor deve ser [POSITIVO]\n") 
			}senao escreva("Número inválido!!\n")
		}enquanto(nao tp.cadeia_e_inteiro(scanProtegido,10) ou divisor < 0 )

		limpa()
		escreva("NÚMEROS LIDOS\n")
		linha(45)
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"] ")
		}
		br(1)
		linha(45)

		escreva("Divisor informado: "+ divisor)
		escreva("\nOs números divisiveis por "+divisor+" são: ")
		para(inteiro i = 0; i < QUANT_NUMEROS;i++){
			se(v_numeros[i]%divisor == 0) escreva("["+v_numeros[i]+"] ")
		}
		retornar()
		
		
	}
	funcao Exercicio13()
	{
	/*
	13) Faça um algoritmo que leia e mostre um vetor de 5 números inteiros. A seguir, inverta os valores desse
	vetor, trocando o primeiro elemento pelo último, segundo pelo penúltimo, e assim sucessivamente
	exibindo novamente o vetor invertido. 

	Exemplo:
	0 	1 	2 	3 	4
	1 	2 	3 	4 	5

	Vetor invertido
	0 	1 	2 	3 	4 
	5 	4 	3 	2 	1
	*/
		const inteiro QUANT_NUMEROS = 5
		inteiro v_numeros[QUANT_NUMEROS], scan, resultado = 0, v_backup[QUANT_NUMEROS], j = (QUANT_NUMEROS -1)
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			limpa()
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}
		limpa()
		linha(30)
		escreva("ORDEM LIDA\n")
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			v_backup[j] = v_numeros[i]
			escreva("["+v_numeros[i]+"] ")
			j--
		}

		j = 0
		br(1)
		linha(30)
		escreva("\nORDEM INVERTIDA\n")
		para(inteiro i = (QUANT_NUMEROS-1); i >= 0; i--){
			v_numeros[i] = v_backup[i]
		}

		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"] ")
		}
		
		br(1)
		linha(30)
		retornar()
	}
	funcao Exercicio14()
	{
	/*
	14) Crie um algoritmo que peça ao usuário que informe 10 números inteiros e armazene-os em um vetor.
	A seguir, apresente a multiplicação de todos os elementos pares e a soma de todos os elementos
	ímpares. 

	Exemplo:
	0 	1 	2 	3 	4 	5 	6 	7 	8 	9
	1 	3 	5 	7 	8 	9 	10 	11 	12 	13

	Multiplicação dos elementos pares: 960.
	Soma dos elementos ímpares: 49
	 */
		const inteiro QUANT_NUMEROS = 10
		inteiro v_numeros[QUANT_NUMEROS], scan, impar[QUANT_NUMEROS],par[QUANT_NUMEROS],iPar=0,iImpar=0,multiplicacao=1,soma=0
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			limpa()
			
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}
		limpa()
		linha(45)
		escreva("NÚMEROS LIDOS\n")
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"] ")
		}
		br(1)
		linha(45)

		//identifica e separa números ipar/par
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			se(v_numeros[i]%2 == 0) {
				par[iPar] = v_numeros[i]
				iPar++
			}senao {
				impar[iImpar] = v_numeros[i]
				iImpar++
			}
		}
		escreva("Multiplicação dos elementos pares: ")
		
		para(inteiro i = 0; i < iPar; i++){
			multiplicacao *= par[i]
		}
		escreva("["+multiplicacao+"] ")
		escreva("\nSoma dos elementos ímpares: ")
		
		para(inteiro i = 0; i < iImpar; i++){
			soma += impar[i]
		}
		escreva("["+soma+"] ")
		retornar()
	}
	funcao Exercicio15()
	{
		/*
		15) Escreva um algoritmo que solicite ao usuário a entrada de 5 números, e que exiba o somatório desses números na tela.
		Após exibir a soma, o programa deve mostrar também os números que o usuário digitou, um por linha.
		 */
		const inteiro QUANT_NUMEROS = 5
		inteiro v_numeros[QUANT_NUMEROS], scan, resultado = 0
		cadeia scanProtegido
		
		para(inteiro i =0; i < QUANT_NUMEROS; i++){
			escreva("Informe o "+(i+1)+"º número: ")
			leia(scanProtegido)
			
			se(tp.cadeia_e_inteiro(scanProtegido,10)){
				scan = tp.cadeia_para_inteiro(scanProtegido, 10)
				v_numeros[i] = scan 
			}senao{
				limpa()
				escreva("Número inválido!!\n")
				i--
			}
		}
		
		limpa()
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			resultado += v_numeros[i]
		}

		escreva("somatório: ["+resultado+"]\n")
		linha(30)
		escreva("NÚMEROS INFORMADOS\n")
		para(inteiro i = 0; i < QUANT_NUMEROS; i++){
			escreva("["+v_numeros[i]+"]\n")
		}
		br(1)
		linha(30)
		retornar()
		
	}
 
	//EXERCICIO 09
	funcao exercicio09Menu()
	{
		logico continua = verdadeiro
          faca {
               escreva("╔═══════════════════════════════════╗\n")
               escreva("║        Cadastro de pessoas        ║\n")
               escreva("║-----------------------------------║\n")
               escreva("║                                   ║\n")
               escreva("║        [1] - Incluir              ║\n")
               escreva("║        [2] - Alterar              ║\n")
               escreva("║        [3] - Excluir              ║\n")
               escreva("║                                   ║\n")
               escreva("║-----------------------------------║\n")
               escreva("║      Digite '4' para [Sair]       ║\n")
               escreva("╚═══════════════════════════════════╝\n> ")
               leia(scanProtegido)
               se (nao tp.cadeia_e_caracter(scanProtegido)) {
                    escreva("Opção inválida!!\n")
               }
               senao {
                    scan = tp.cadeia_para_caracter(scanProtegido)
                    escolha (scan) {
                         caso '1':
                              limpa()
                              exercicio09Incluir()
                              continua = falso
                              pare
                         caso '2':
                              limpa()
                              exercicio09Alterar()
                              continua = falso
                              pare
                         caso '3':
                         	limpa()
                         	exercicio09Excluir()
                              continua = falso
                              pare
                         caso '4':
                              continua = falso
                              pare
                         caso contrario:
                              limpa()
                              escreva("Opção inválida!!\n")
                              pare
                    }
               }
          }
          enquanto (nao tp.cadeia_e_caracter(scanProtegido) ou continua == verdadeiro)
	}
	funcao exercicio09Alterar()
     {
          cadeia novoNome, backupNome, confirmar
          inteiro idade, backupIdade
          
          escreva("\nInforme o nome que deseja alterar: ")
          leia(novoNome)
          para (inteiro i = 0; i < QUANT_PESSOAS; i = i + 1) {
               se (novoNome == v_nome[i]) {
                    backupNome = novoNome
                    backupIdade = v_idade[i]
                    escreva("\nDigite o novo nome: ")
                    leia(v_nome[i])
                    faca {
                         escreva("Informe a idade: ")
                         leia(v_idadeProtegida[i])
                         se (nao tp.cadeia_e_inteiro(v_idadeProtegida[i], 10)) {
                              escreva("Idade inválida!!\n")
                         }
                         senao {
                              v_idade[i] = tp.cadeia_para_inteiro(v_idadeProtegida[i], 10)
                              se (v_idade[i] < 1) {
                                   escreva("Idade inválida!!\n")
                                   v_idadeProtegida[i] = ""
                              }
                         }
                    }
                    enquanto (nao tp.cadeia_e_inteiro(v_idadeProtegida[i], 10))
                    faca {
                         escreva("\nO nome: " + backupNome + " foi substituido por " + v_nome[i])
                         escreva("\nE a idade: " + backupIdade + " foi substituida por " + v_idade[i])
                         escreva("\n\nDeseja manter as alterações? (S/N)")
                         leia(confirmar)
                         se (txt.caixa_baixa(confirmar) == "s") {
                              limpa()
                              escreva("Nome e idade alterados com sucesso!!\n")
                              ut.aguarde(2000)
                              exercicio09Menu()
                         }
                         senao {
                              se (txt.caixa_baixa(confirmar) == "n") {
                                   escreva("Alteração não concluída!!\n")
                                   v_nome[i] = backupNome
                                   v_idade[i] = backupIdade
                                   ut.aguarde(2000)
                                   exercicio09Menu()
                              }
                              senao {
                                   limpa()
                                   escreva("Opção inválida!!\n")
                              }
                         }
                    }
                    enquanto (txt.caixa_baixa(confirmar) != "s" e txt.caixa_baixa(confirmar) != "n")
               }
               senao {
                    se (novoNome != v_nome[i] e i == QUANT_PESSOAS - 1) {
                         limpa()
                         escreva("Nome não encontrado!!\n")
                         exercicio09Alterar()
                    }
               }
          }
          exercicio09Menu()
     }
	funcao exercicio09Excluir()
	{
          cadeia nomeExcluir
          escreva("Qual nome deseja excluir?: ")
          leia(nomeExcluir)
          para (inteiro i = 0; i < QUANT_PESSOAS; i = i + 1) {
               se (nomeExcluir == v_nome[i]) {
                    v_nome[i] = ""
                    v_idadeProtegida[i] = ""
                    v_idade[i] = -1
                    limpa()
                    escreva("Cadastro excluido\n")
                    ut.aguarde(2000)
                    exercicio09Menu()
               }
               senao {
                    se (nomeExcluir != v_nome[i] e i == QUANT_PESSOAS - 1) {
                         limpa()
                         escreva("Nome não encontrado!!\n")
                         exercicio09Excluir()
                    }
               }
          }
	}
	funcao exercicio09Incluir()
	{
		para (inteiro i = 0; i < QUANT_PESSOAS; i = i + 1) {
              	escreva("Informe o nome da " + (i + 1) + "º pessoa: ")
               leia(v_nome[i])
               limpa()
               faca {
                    escreva("Informe a idade da " + (i + 1) + "º pessoa: ")
                    leia(v_idadeProtegida[i])
                    limpa()
                    se (nao tp.cadeia_e_inteiro(v_idadeProtegida[i], 10)) {
                         escreva("Idade inválida!!\n")
                    }
                    senao {
                         v_idade[i] = tp.cadeia_para_inteiro(v_idadeProtegida[i], 10)
                         se (v_idade[i] < 1) {
                              escreva("Idade inválida!!\n")
                              v_idadeProtegida[i] = ""
                         }
                    }
               }
               enquanto (nao tp.cadeia_e_inteiro(v_idadeProtegida[i], 10))
          }
          exercicio09Menu()
	}

	
	//ATALHOS
	funcao linha(inteiro tamanho)
	{	
		para(inteiro j = tamanho; j <= tamanho; j++){
			para(inteiro i =0; i < tamanho; i++){
				escreva("=")
			}
		escreva("\n")
		}
	}
	funcao br(inteiro tamanho)
	{
		para(inteiro i =0; i < tamanho; i++){
			escreva("\n")
		}
	}
	funcao retornar()
	{	
		cadeia scan
		br(3)
		faca{
			escreva("Deseja retorna ao [MENU] ou [SAIR]?\n[1]- MENU\n[2]- SAIR\n>")
			leia(scan)
			se(scan == "1"){
				limpa()
				menu()
				pare
			}senao se(scan == "2")pare
			senao{
				limpa()
				escreva("Opção inválida!!")
			}
		}enquanto(scan != "1" ou scan != "2")
	}
	funcao loading(inteiro tamanho)
	{
		para(inteiro i = 0; i< tamanho; i++){
			escreva("|")
			ut.aguarde(30)
		}
	}
	funcao espaco(inteiro tamanho)
	{
		para(inteiro i = 0; i< tamanho; i++){
			escreva("\t")
		}
	}
	funcao linhaSimples(inteiro tamanho)
	{	
		para(inteiro j = tamanho; j <= tamanho; j++){
			para(inteiro i =0; i < tamanho; i++){
				escreva("-")
			}
		escreva("\n")
		}
	}

	funcao linhaInteligente(cadeia sb, inteiro tamanho, inteiro nLinha){
		para(inteiro j = 0; j <= nLinha; j++){
			para(inteiro i = 0; i <= tamanho; i++){
				escreva(sb)
			}
			escreva("\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 27615; 
 * @DOBRAMENTO-CODIGO = [21, 32, 128, 192, 203, 265, 311, 348, 346, 388, 428, 456, 485, 483, 529, 577, 640, 697, 762, 804, 853, 918, 942, 970, 979, 985, 1003, 1010, 1016];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {v_nome, 17, 8, 6}-{v_idadeProtegida, 17, 31, 16}-{v_idade, 18, 9, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */