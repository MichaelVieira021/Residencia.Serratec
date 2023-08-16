/*
 * 3) Fatorial: Escreva um algoritmo que leia um valor inicial A e imprima a seqüência de valores do cálculo de A! 
 * e o seu resultado. Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120
 */
 
programa
{	
	inclua biblioteca Tipos --> tp
	
	funcao inicio()
	{	
		real num
		
		escreva("Informe um número:\n> ")
		leia(num)
		limpa()
		
		se(num == 0 ou num == 1){
			escreva(tp.real_para_inteiro(num)+"! = 1")
		}senao{
			escreva(" = " + fatorial(num))
		}
	}

	funcao real fatorial(real num)
	{
		escreva(tp.real_para_inteiro(num)+"! = " +tp.real_para_inteiro(num))

		para(inteiro i = tp.real_para_inteiro(num -1); i > 0; i--){
			num *=i	
			escreva(" X "+i)
		}
		retorne num
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 179; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {num, 12, 7, 3}-{i, 29, 15, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */