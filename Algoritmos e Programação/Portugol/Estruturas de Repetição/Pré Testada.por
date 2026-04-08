programa{
	
	funcao inicio(){
		ex5()
	}

	funcao ex5(){
		//Faça um algoritmo que leia tantos números quanto o usuário desejar e imprima a soma deles.
		//Inicialmente solicite uma quantidade de números ‘n’ e, na sequências, ‘n’ números inteiros. Ao final,
		//apresente a soma

		inteiro qtd = 0, soma = 0, numero = 0

		escreva("Quantos numeros deseja somar: ")
		leia(qtd)

		enquanto(qtd > 0){
			escreva("Número para a soma: ")
			leia(numero)
			soma = soma + numero
			qtd--
		}
		escreva("Soma igual: ", soma)
	}

	funcao ex4(){
		//Ler a idade de várias pessoas e calcular a média das idades. Encerrar a execução quando valor
		//negativo for digitado (o valor negativo não deve ser considerado no cálculo da média).

		inteiro idade = 0, soma = 0, contador = 0

		enquanto(idade >= 0){
			escreva("Qual a sua idade: ")
			leia(idade)
			se(idade >= 0){
				soma = soma + idade
				contador++
			}
		}
		escreva("A média das idades é: ", soma/contador)
	}

	funcao ex3(){
		//Realizar a leitura de um valor inteiro e apresentar a tabuada de 0 (zero) à 10 (dez) do valor informado.
		//Deve-se utilizar uma estrutura de repetição para a resolução deste exercício.

		inteiro numero, contador = 0

		escreva("Escreva um número: ")
		leia(numero)

		enquanto(contador <= 10){
			escreva(contador, " x ", numero, " = ", contador*numero, "\n")
			contador++
		}
	}

	funcao ex2(){
		//Realizar a leitura de valor inteiro, armazenar em uma variável e apresentar uma mensagem
		//informando o dobro deste valor, isto é: caso o usuário informe 6, deve-se apresentar a mensagem “O
		//dobro de 6 é 12.”. Este processo deve se repetir até que o usuário informe o número 0 (zero).

		inteiro numero = 1, dobro

		enquanto(numero != 0){
			escreva("Qual o número: ")
			leia(numero)

			dobro = numero * 2

			escreva("O dobro do número ", numero, " é ", dobro, "\n")
		}
	}

	funcao ex1(){
		//Realizar a leitura de dois valores inteiros, somá-los e apresentar o resultado da soma na saída padrão.
		//Após a mensagem, deve-se questionar se o usuário gostaria de finalizar o programa e, caso não
		//queira, o programa deve repetir o processo de leitura/soma/exibição/questionamento.

		inteiro num1, num2
		logico continuar = verdadeiro
		cadeia opcao

		enquanto(continuar == verdadeiro){
			escreva("Insira o primeiro número: ")
			leia(num1)
			escreva("Insira o segundo número: ")
			leia(num2)
	
			escreva("A soma é: ", num1 + num2, "\n")
	
			escreva("Deseja continuar? (SIM/NÃO): ")
			leia(opcao)

			se(opcao == "NÃO"){
				continuar = falso
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 368; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */