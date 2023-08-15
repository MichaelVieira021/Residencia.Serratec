programa
{
	inclua biblioteca Util --> ut
	
	funcao inicio()
	{
		para(inteiro horas = 0; horas == horas; horas++){
			para(inteiro minutos = 0; minutos < 60; minutos++){
				para(inteiro segundos = 0; segundos < 60; segundos++){
					ut.aguarde(1000)
					limpa()
					escreva("CRONOMETRO\n  "+horas+":"+minutos+":"+segundos)
				}
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 295; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */