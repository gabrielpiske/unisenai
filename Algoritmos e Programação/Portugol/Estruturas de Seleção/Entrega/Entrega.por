programa{
	
	funcao inicio(){
		ex10()
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

		inteiro num1, num2

		escreva("Insira o primeiro valor: ")
		leia(num1)
		escreva("Insira o segundo valor: ")
		leia(num2)

		se(num1 > num2){
			escreva("O primeiro valor é maior!: ", num1, "\n")
		} senao {
			escreva("O segundo valor é maior!: ", num2, "\n")
		}

		se(num1 % num2 == 0){
			escreva("Os números: ", num1, " e ", num2, " são múltiplos!")
		} senao {
			escreva("Os números: ", num1, " e ", num2, " não são múltiplos!")
		}
	}

	funcao ex8(){
		//Escreva um programa que calcule a média aritmética das três notas de um aluno. 
		//Além do valor da média, o programa deve exibir uma das seguintes mensagens: 
			//• "Aprovado", se a média for igual ou superior a 6.  
			//• "Em prova final", se a média for inferior a 6, mas igual ou superior a 3.  
			//• "Reprovado", para as demais situações.

		real nota1, nota2, nota3, media
		const inteiro QUANTIDADE_NOTAS = 3

		escreva("Entre com a primeira nota: ")
		leia(nota1)
		escreva("Entre com a segunda nota: ")
		leia(nota2)
		escreva("Entre com a terceira nota: ")
		leia(nota3)

		media = (nota1 + nota2 + nota3) / QUANTIDADE_NOTAS

		se(media >= 6){
			escreva("Aprovado com a média: ", media)
		} senao se(media < 6 e media >= 3){
			escreva("Em prova final com a média: ", media)
		} senao {
			escreva("Reprovado com a média: ", media)
		}
	}

	funcao ex9(){
		//Dados três valores X, Y e Z, elabore um programa em Portugol para verificar se eles 
		//podem formar os lados de um triângulo.  
			//• Condição de existência: O comprimento de cada lado de um triângulo deve 
			//ser menor que a soma dos comprimentos dos outros dois lados.  
			//• Se for possível formar um triângulo, o programa deverá classificá-lo como: 
				//o Equilátero: Os três lados possuem comprimentos iguais. 
				//o Isósceles: Dois dos lados possuem comprimentos iguais.  
				//o Escaleno: Os três lados possuem comprimentos diferentes. 
			//• Caso os valores não possam formar um triângulo, o programa deve exibir uma 
			//mensagem informando o motivo.

		inteiro x, y, z

		escreva("Entre com o primeiro lado do triângulo: ")
		leia(x)
		escreva("Entre com o segundo lado do triângulo: ")
		leia(y)
		escreva("Entre com o terceiro lado do triângulo: ")
		leia(z)

		se(x < y + z e y < z + x e z < x + y){
			se(x == y e y == z){
				escreva("Triângulo Equilátero")
			} senao se(x == y ou x == z ou y == z){
				escreva("Triângulo Isósceles")
			} senao {
				escreva("Triângulo Escaleno")
			}
		} senao{
			escreva("Não é possível formar um triângulo, pois um dos lados é maior ou igual à soma dos outros dois.")
		}
	}

	funcao ex10(){
		//Desenvolva um programa em Portugol que receba do usuário a coluna e a linha 
		//(valores de 1 a 8) de uma casa em um tabuleiro de xadrez. O programa deve então 
		//determinar e exibir se a casa correspondente é branca ou preta. Por exemplo, a coluna 
		//5 e linha 3 corresponde a uma casa preta.

		inteiro coluna, linha

		escreva("Insira o número da coluna (1 a 8): ")
		leia(coluna)
		escreva("Insira o número da linha (1 a 8): ")
		leia(linha)

		se((linha & 1) == 0 e (coluna & 1) == 0 ou (linha & 1) == 1 e (coluna & 1) == 1){
			escreva("É uma casa preta")
		} senao {
			escreva("É uma casa branca")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3860; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */