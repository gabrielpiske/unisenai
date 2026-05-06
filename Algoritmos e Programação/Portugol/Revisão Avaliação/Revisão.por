programa{

	funcao inicio(){
		ex10()
	}

	funcao ex10(){
		//Crie um programa que leia dois números e 
		//apresente um menu: 1-Somar, 2-Subtrair, 3-Multiplicar, 4-Sair. O programa deve 
		//executar a operação escolhida e só encerrar quando o usuário digitar a opção 4. 

		inteiro numero1, numero2, resultado
		caracter opcao

		escreva("Entre com o primeiro valor: ")
		leia(numero1)
		escreva("Entre com o segundo valor: ")
		leia(numero2)
		escreva("----------------------------\n")
		escreva("Escolha uma opção\n")
		escreva("1 - Somar\n")
		escreva("2 - Subtrair\n")
		escreva("3 - Multiplicar\n")
		escreva("4 - Sair\n")
		escreva("Entrada: ")
		leia(opcao)
		se(opcao == '1'){
			resultado = numero1 + numero2
			escreva("Resultado: ", resultado)
		} senao se (opcao == '2'){
			resultado = numero1 - numero2
			escreva("Resultado: ", resultado)
		} senao se (opcao == '3'){
			resultado = numero1 * numero2
			escreva("Resultado: ", resultado)
		} senao {
			escreva("Você saiu")
		}
	}

	funcao ex9(){
		//Escreva um algoritmo que calcule a soma de todos os números ímpares entre 1 e 50 e apresente o total.
		inteiro total = 0

		para(inteiro i = 1; i <= 50; i++){
			se((i & 1) == 1){
				total += i
			}
		}
		escreva("Total: ", total)
	}

	funcao ex8(){
		//Desenvolva um programa que leia um número e informe se 
		//ele está dentro do intervalo entre 10 e 50 (inclusive) ou fora dele.

		inteiro numero

		escreva("Entre com o número: ")
		leia(numero)
		se(numero > 10 e numero < 50){
			escreva("Está dentro do intervalo de 10 e 50.")
		} senao {
			escreva("Está fora do intervalo.")
		}
	}

	funcao ex7(){
		//Elabore um algoritmo que leia um valor de 
		//saque (inteiro) e informe quantas notas de R$ 50,00 seriam necessárias para compor 
		//esse valor. (Considere apenas valores múltiplos de 50 para simplificar).

		inteiro valor, totalNotas

		escreva("Entre com um valor: ")
		leia(valor)
		se(valor % 50 == 0){
			totalNotas = valor / 50
			escreva("Quantidade de notas: ", totalNotas)
		} senao {
			escreva("Escreva um número múltiplo de 50.")
		}
	}

	funcao ex6(){
		//Crie um programa que exiba todos os números múltiplos de 3 situados no intervalo entre 1 e 100.
		para(inteiro i = 3; i <= 100; i = i + 3){
			escreva("Número: ", i, "\n")
		}
	}

	funcao ex5(){
		//Um mercado oferece descontos baseados no valor 
		//da compra: 5% para compras acima de R$ 100,00 e 10% para compras acima de R$ 
		//500,00. Escreva um algoritmo que leia o valor total da compra e exiba o valor final com 
		//o desconto aplicado.

		real valorTotal, resultado

		escreva("Qual o valor Total da compra: ")
		leia(valorTotal)

		se(valorTotal > 500){
			resultado = valorTotal - valorTotal*0.1
			escreva("Valor com desconto: R$",resultado)
		} senao {
			resultado = valorTotal - valorTotal*0.05
			escreva("Valor com desconto: R$",resultado)
		}
	}

	funcao ex4(){
		//Faça um programa que leia a idade de 15 pessoas e, ao final, 
		//exiba quantas pessoas são maiores de idade (18 anos ou mais) e qual a média de idade 
		//do grupo.
		
		inteiro idade, somaIdades = 0, totalMaiorIdade = 0
		real mediaIdade

		para(inteiro i = 1; i <= 15; i++){
			escreva("Entre com a ", i, "º idade: ")
			leia(idade)
			somaIdades += idade
			se(idade >= 18){
				totalMaiorIdade++
			}
		}
		mediaIdade = somaIdades / 15.0
		escreva("\nQuantidade de pessoas maiores de idade: ", totalMaiorIdade)
		escreva("\nMédia de idade do grupo: ", mediaIdade)
	}

	funcao ex3(){
		//Desenvolva um algoritmo que peça um número 
		//inteiro positivo ao usuário e realize uma contagem regressiva de N até 0, exibindo cada 
		//número na tela.
		inteiro numero = 0
		escreva("Entre com um número: ")
		leia(numero)
		se (numero < 0) {
			escreva("Digite um número positivo.")
    		} senao {
			para(inteiro i = numero; i >= 0; i--){
			  escreva("Contagem Regressiva: ", i, "\n")
			}
		}
	}

	funcao ex2(){
		//Elabore um programa que solicite ao usuário a criação de uma 
		//senha numérica de 4 dígitos. Em seguida, peça para ele digitar a senha novamente para 
		//"entrar" no sistema. O programa deve repetir a leitura até que a senha digitada seja 
		//correta, exibindo a mensagem "Acesso Permitido".

		 cadeia senha, verificacao
		 faca{
			 escreva("Crie sua senha (4 digitos): ")
			 leia(senha)
			 escreva("Digite sua senha novamente: ")
			 leia(verificacao)
		 } enquanto(senha != verificacao)
	}

	funcao ex1(){
		//Conversor de Temperatura com Escolha: Crie um algoritmo que pergunte ao usuário 
		//se ele deseja converter de Celsius para Fahrenheit ou de Fahrenheit para Celsius. Após 
		//a escolha, leia o valor da temperatura e exiba o resultado convertido.

		 real celsius = 0.0, fahrenheit = 0.0
		 caracter opcao

		 escreva("Menu de Conversão \n")
		 escreva("1 - Celsius para Fahrenheit \n")
		 escreva("2 - Fahrenheit para Celsius \n")
		 escreva("Entrada: ")
		 leia(opcao)
		 se(opcao == '1'){
		 	escreva("Qual o valor em Celsius?: ")
		 	leia(celsius)
		 	fahrenheit = (9*celsius+160)/5
		 	escreva("Temperatura convertida: ", fahrenheit)
		 } senao se (opcao == '2'){
		 	escreva("Qual o valor em fahrenheit?: ")
		 	leia(fahrenheit)
		 	celsius = (fahrenheit-32)*(5.0/9)
		 	escreva("Temperatura convertida: ", celsius)
		 } senao {
		 	escreva("Entre com um valor válido!")
		 }
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 723; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */