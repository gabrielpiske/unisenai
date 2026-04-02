programa{
	
	funcao inicio(){
		ex2()
	}

	funcao ex1(){
		//Escreva um programa em Portugol que solicite ao usuário a largura e o comprimento
		// uma sala em metros. O programa deve calcular e exibir a área total da sala em
		//metros quadrados, incluindo as unidades de medida nas mensagens de entrada e saída.
	
		real largura, comprimento, area
	
		escreva("Entre com a largura da sala em metros: ")
		leia(largura)
		escreva("Entre com o comprimento da sala em metros: ")
		leia(comprimento)
	
		area = largura * comprimento

		escreva("A área total da sala é ", area, " m²")
	}

	funcao ex2(){
		//Um estabelecimento oferece créditos pela reciclagem de recipientes. Vasilhames de
		//um litro ou menos valem R$ 0,10, enquanto vasilhames com mais de um litro valem
		//R$ 0,25. Crie um programa em Portugol que leia a quantidade de cada um desses
		//dois tipos de vasilhames e, em seguida, calcule e exiba o valor total dos créditos
		//obtidos.

		const real umLitro = 0.1
		const real maisLitros = 0.25
		real vasilhameUmLitro, vasilhameMaisLitros, total

		escreva("Qual a quantidade de vasilhames de um litro ou menos?: ")
		leia(vasilhameUmLitro)
		escreva("Qual a quantidade de vasilhames com mais de um litro?: ")
		leia(vasilhameMaisLitros)

		total = (vasilhameUmLitro * umLitro) + (vasilhameMaisLitros * maisLitros)

		escreva("O valor total de créditos foi: R$",total)
	}

	funcao ex3(){
		//Elabore um programa em Portugol que leia um número inteiro de três algarismos (ex:
		//CDU) e o reescreva com a ordem dos algarismos invertida (ex: UDC). Por exemplo,
		//se o número lido for 123, o programa deverá exibir 321.
		//Dica: Utilize operações de divisão inteira e resto para extrair os dígitos individuais
		//antes de recombiná-los na nova ordem.

		inteiro numero, primeiroDigito, segundoDigito, terceiroDigito
		escreva("Entre com o número: ")
		leia(numero)

		primeiroDigito = numero / 100
		segundoDigito = (numero % 100) / 10
		terceiroDigito = numero % 10
		
		escreva("Ordem inversa: ",terceiroDigito, segundoDigito, primeiroDigito)
	}

	funcao ex4(){
		//Desenvolva um programa em Portugol que leia dois números e imprima uma
		//mensagem indicando qual deles é o maior.

		inteiro num1, num2

		escreva("Escreva o primeiro numero: ")
		leia(num1)
		escreva("Escreva o segundo numero: ")
		leia(num2)

		se(num1 > num2){
			escreva("O maior número é o primeiro! (", num1,")")
		} senao {
			escreva("O maior número é o segundo! (", num2,")")
		}
	}

	funcao ex5(){
		//Faça um programa em Portugol que leia um número inteiro e determine se ele é par
		//ou ímpar. O programa deve exibir uma mensagem com o resultado, considerando o
		//número zero como par.

		inteiro valor

		 escreva("Entre com um valor: ")
		 leia(valor)

		 se(valor % 2 != 0){
		 	escreva("Valor é impar")
		 } senao {
		 	escreva("Valor é par")
		 }
	}

	funcao ex6(){
		//Elabore um programa em Portugol que leia três números e os exiba em ordem decrescente.

		inteiro valor1, valor2, valor3

		escreva("Entre com o primeiro valor: ")
		leia(valor1)
		escreva("Entre com o segundo valor: ")
		leia(valor2)
		escreva("Entre com o terceiro valor: ")
		leia(valor3)

		se(valor1 > valor2 e valor1 > valor3){
			se(valor2 > valor3){
				escreva("Ordem Decrescente: ", valor1, " ", valor2, " ", valor3)
			} senao {
				escreva("Ordem Decrescente: ", valor1, " ", valor3, " ", valor2)
			}
		} senao se (valor2 > valor1 e valor2 > valor3){
			se(valor1 > valor3){
				escreva("Ordem Decrescente: ", valor2, " ", valor1, " ", valor3)
			} senao {
				escreva("Ordem Decrescente: ", valor2, " ", valor3, " ", valor1)
			}
		} senao se (valor3 > valor1 e valor3 > valor2){
			se(valor1 > valor2){
				escreva("Ordem Decrescente: ", valor3, " ", valor1, " ", valor2)
			} senao {
				escreva("Ordem Decrescente: ", valor3, " ", valor2, " ", valor1)
			}
		}
	}

	funcao ex7(){
		//Crie um programa em Portugol que leia dois valores,
		//a e b, e verifique se são múltiplos um do outro. Antes da verificação, é necessário 
		//identificar qual dos números é o maior e qual é o menor. O programa deve exibir os dois 
		//números com a mensagem "São múltiplos" ou "Não são múltiplos".

		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4184; 
 * @DOBRAMENTO-CODIGO = [6, 23, 44, 62, 80, 97];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */