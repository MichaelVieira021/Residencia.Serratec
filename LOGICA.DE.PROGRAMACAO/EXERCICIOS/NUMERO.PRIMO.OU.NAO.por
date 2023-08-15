programa
{
	
	funcao inicio()
	{	
		inteiro numero, contador = 1, divisor = 0
	
		escreva("Informe o número: ")
		leia(numero)
		
		enquanto(contador <= numero){
			se(numero % contador == 0){
				divisor++
			}
			contador++
		}

		se(divisor == 2){
			escreva("É primo")
		}senao{
			escreva("Não é primo")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 313; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */