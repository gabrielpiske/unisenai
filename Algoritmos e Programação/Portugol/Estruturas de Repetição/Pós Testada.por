programa
{
	
	funcao inicio(){
		extra()
	}

	funcao extra(){
		inteiro total = 0, domingo = 0, segunda = 0, terca = 0, quarta = 0, quinta = 0 , sexta = 0, sabado = 0, i = 0
		cadeia dia

		escreva("Quantas vezes deseja ler os dias da semana?: ")
		leia(total)
		faca{
			escreva("Digite um dia da semana: ")
			leia(dia)

			se(dia == "Domingo" ou  dia == "DOMINGO" ou dia == "domingo"){domingo++}
			senao se(dia == "Segunda" ou  dia == "SEGUNDA" ou dia == "segunda"){segunda++}
			senao se(dia == "Terça" ou  dia == "TERÇA" ou dia == "terça"){terca++}
			senao se(dia == "Quarta" ou  dia == "QUARTA" ou dia == "Quarta"){quarta++}
			senao se(dia == "Quinta" ou  dia == "QUINTA" ou dia == "Quinta"){quinta++}
			senao se(dia == "Sexta" ou  dia == "SEXTA" ou dia == "Sexta"){sexta++}
			senao se(dia == "Sabado" ou  dia == "SABADO" ou dia == "Sabado"){sabado++}
			i++
		} enquanto(i < total)
		escreva("\n -- Resultado -- \n")
		escreva("DOMINGO: " , domingo , " (" , (domingo * 100.0 / total) , "%)")
		escreva("SEGUNDA: " , segunda , " (" , (segunda * 100.0 / total) , "%)")
		escreva("TERÇA: " , terca , " (" , (terca * 100.0 / total) , "%)")
		escreva("QUARTA: " , quarta , " (" , (quarta * 100.0 / total) , "%)")
		escreva("QUINTA: " , quinta , " (" , (sexta * 100.0 / total) , "%)")
		escreva("SEXTA: " , sexta , " (" , (sexta * 100.0 / total) , "%)")
		escreva("SABADO: " , sabado , " (" , (sabado * 100.0 / total) , "%)")
	}

	funcao ex5(){
		//Realizar a leitura de um número inteiro que irá representar quantas vezes um processo de
		//leitura de uma cadeia (dias de semana) irá acontecer. Ao final, apresentar uma mensagem
		//informando quantas vezes a palavra “SEXTA” foi informada.

		inteiro totalRepeticoes = 0, i = 0, contadorSexta = 0
		cadeia dia

		escreva("Quantas vezes deseja ler os dias?: ")
		leia(totalRepeticoes)

		se(totalRepeticoes > 0){
			faca{
				escreva("Informe o dia da semana: ")
				leia(dia)

				se(dia == "SEXTA" ou dia == "sexta" ou  dia == "Sexta"){
					contadorSexta++
				}
				i++
			} enquanto (i < totalRepeticoes)
		}
		escreva("A palavra Sexta foi informada: ",contadorSexta, " vezes.")
	}

	funcao ex4(){
		//Realizar a leitura de um número inteiro e apresentar a tabuada de 5 à 17 do número informado
		inteiro num, contador = 5
		escreva("Digite um numero: ")
		leia(num)
		faca{
			escreva(num, "x", contador, " = ", contador*num, "\n")
			contador++
		} enquanto(contador <= 17)
	}

	funcao ex3(){
		//Ler um número inteiro do teclado e, a partir da utilização da repetição faca-enquanto, garantir
		//que este valor lido seja positivo. Após isso, calcular o fatorial do número e mostrar o resultado
		//na tela.

		inteiro num = 0, resultado = 1
		faca{
			escreva("Digite um numero: ")
			leia(num)
			se(num >= 0){
				faca{
					resultado *= num
					num--
				} enquanto(num > 1)
			}
			escreva("Fatorial: ", resultado, "\n")
			resultado = 1
		} enquanto(num >= 0)
		
	}

	funcao ex2(){
		//Realizar a leitura de valor inteiro n. Escrever a soma de todos os números de 1 até n.

		inteiro num = 0, soma = 0, i = 1
		escreva("Digite um numero: ")
		leia(num)
		faca{
			soma = soma + i
			i++
		}enquanto(i <= num)
		escreva("A soma é: ", soma)
	}

	funcao ex1(){
		//Realizar a leitura de um valor inteiro até que o utilizador informe um número dentro do intervalo
		//[1, 5]. Caso o valor informado seja menor ou igual à zero ou maior ou igual a cinco deve-se
		//solicitar novamente um valor inteiro. Ao final, apresentar uma mensagem informando a opção
		//escolhida pelo usuário, exemplo: “Você escolheu a opção um!”

		inteiro num = 0

		faca {
			escreva("Digite um número (0 - 5): ")
			leia(num)
		} enquanto (num != 1 e num != 2 e num != 3 e num != 4 e num != 5)
		escreva("Voce escolheu a posição: ",num)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1431; 
 * @DOBRAMENTO-CODIGO = [93, 106];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */