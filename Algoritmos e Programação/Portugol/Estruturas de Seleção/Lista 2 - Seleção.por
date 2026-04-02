programa{
	
	funcao inicio(){
		ex12()
	}

	funcao ex13(){
		//Realizar a leitura de três notas parciais obtidas por um aluno numa disciplina ao longo de um semestre, e
		//calcule a sua média aritmética. A atribuição de conceitos obedece à tabela abaixo. Ao final, deve-se mostrar na
		//tela as notas, a média, o conceito correspondente e a mensagem “APROVADO” se o conceito for A, B ou C ou
		//“REPROVADO” se o conceito for D ou E.

		real nota1, nota2, nota3, media

		escreva("Entre com a nota 1: ")
		leia(nota1)
		escreva("Entre com a nota 2: ")
		leia(nota2)
		escreva("Entre com a nota 3: ")
		leia(nota3)

		media = (nota1 + nota2 + nota3) / 3

		escreva("Média de Aproveitamento \t Conceito")
		se(media >= 9.0){
			escreva("\n- Entre 9.0 e 10.0 \t\t    A")
			escreva("\n Status: APROVADO")
		} senao se (media >= 7.5 e media < 9.0){
			escreva("\n- Entre 7.5 e 9.0 \t\t    B")
			escreva("\n Status: APROVADO")
		} senao se (media >= 6.0 e media <= 7.5){
			escreva("\n- Entre 6.0 e 7.5 \t\t    C")
			escreva("\n Status: APROVADO")
		} senao se (media >= 4.0 e media < 6.0){
			escreva("\n- Entre 4.0 e 6.0 \t\t    D")
			escreva("\n Status: REPPROVADO")
		} senao {
			escreva("\n- Entre 4.0 e 0.0 \t\t    E")
			escreva("\n Status: REPPROVADO")
		}
	}

	funcao ex12(){
		// Realizar a leitura de um número e, de acordo com o valor informado, exibir o dia correspondente da semana. (1-
		//Domingo, 2- Segunda, etc.), se digitar outro valor deve aparecer valor inválido.

		inteiro valor

		escreva("Entre com um valor: ")
		leia(valor)

		se(valor == 1){
			escreva("1 - Domingo")
		} senao se(valor == 2){
			escreva("2 - Segunda")
		} senao se(valor == 3){
			escreva("3 - Terça")
		} senao se(valor == 4){
			escreva("4 - Quarta")
		} senao se(valor == 5){
			escreva("5 - Quinta")
		} senao se(valor == 6){
			escreva("6 - Sexta")
		} senao se(valor == 7){
			escreva("7 - Sábado")
		} senao {
			escreva("Entre com um valor valido positivo")
		}
	}

	funcao ex11(){
		//Ler um valor inteiro e apresentar uma mensagem se ele é múltiplo de cinco ou não

		inteiro valor

		escreva("Entre com um valor: ")
		leia(valor)

		se(valor % 5 != 0){
		 	escreva("Valor não é múltiplo de 5")
		 } senao {
		 	escreva("Valor é múltiplo de 5")
		 }
	}

	funcao ex10(){
		//Ler um valor inteiro e apresentar uma mensagem se ele é PAR ou ÍMPAR.
		 
		 inteiro valor

		 escreva("Entre com um valor: ")
		 leia(valor)

		 se(valor % 2 != 0){
		 	escreva("Valor é impar")
		 } senao {
		 	escreva("Valor é par")
		 }
	}

	funcao ex9(){
		//Realizar a leitura de três números e mostrar o maior valor dentre eles.

		inteiro num1, num2, num3

		escreva("Entre com o numero 1: ")
		leia(num1)
		escreva("Entre com o numero 2: ")
		leia(num2)
		escreva("Entre com o numero 3: ")
		leia(num3)

		se(num1 > num2 e num1 > num3){
			escreva("O maior valor é: ", num1)
		} senao se(num2 > num1 e num2 > num3){
			escreva("O maior valor é: ", num2)
		} senao{
			escreva("O maior valor é: ", num3)
		}
	}

	funcao ex8(){
		//Realizar a leitura de um caractere e indicar se a letra digitada é vogal ou consoante.
		 caracter letra

		 escreva("Coloque uma letra: ")
		 leia(letra)

		 se(letra == 'A' ou letra == 'E' ou letra == 'I' ou letra == 'O' ou letra == 'U' ou letra == 'a' ou letra == 'e' ou letra == 'i' ou letra == 'o' ou letra == 'u'){
		 	escreva("É vogal")
		 } senao {
		 	escreva("É consoante")
		 }
	}

	funcao ex7(){
		//Ler dois valores inteiro (considere que não serão lidos valores iguais) e um valor lógico, onde verdadeiro
		//indicará a ordem crescente e falso a ordem decrescente. Após as entradas escreva os valores inteiros na tela do
		//computado conforme a ordem desejada

		inteiro valor1, valor2
		logico valorLogico

		escreva("Entre com o primeiro valor: ")
		leia(valor1)
		escreva("Entre com o segundo valor: ")
		leia(valor2)
		se(valor2 == valor1){
			escreva("Entre com o segundo valor diferente do primeiro: ")
			leia(valor2)
		}

		escreva("Entre com um valor lógico: ")
		leia(valorLogico)

		se(valorLogico == verdadeiro){
			se(valor1 > valor2){
				escreva("Ordem crescente: ", valor2, " ", valor1)
			} senao {
				escreva("Ordem crescente: ", valor1, " ", valor2)
			}
		} senao {
			se(valor1 < valor2){
				escreva("Ordem decrescente: ", valor2, " ", valor1)
			} senao {
				escreva("Ordem decrescente: ", valor1, " ", valor2)
			}
		}
	}

	funcao ex6(){
		//Ler dois valores reais (considere que não serão lidos valores iguais) e, por fim, apresentar uma mensagem
		//indicando qual foi o maior valor informado pelo usuário.

		real valor1, valor2

		escreva("Entre com o primeiro valor: ")
		leia(valor1)
		escreva("Entre com o segundo valor: ")
		leia(valor2)
		se(valor2 == valor1){
			escreva("Entre com o segundo valor diferente do primeiro: ")
			leia(valor2)
		}
		se(valor1 > valor2){
			escreva("O maior valor é: ", valor1)
		} senao {
			escreva("O maior valor é: ", valor2)
		}
	}

	funcao ex5(){
		//Solicitar três notas (valores reais) e um valor inteiro para a frequência ao utilizador e calcular a média aritmética
		//entre elas. De acordo com a média e frequência informada, deve-se apresentar as mensagens “APROVADO”
		//(caso a média seja superior ou igual a seis e a frequência superior ou igual a 75), “EM EXAME” (caso a média seja
		//superior ou igual a três e inferior a seis, e a frequência superior ou igual a 75), ou então “REPROVADO” (caso a
		//média seja inferior a três ou ainda a frequência seja inferior a 75).

		real nota1, nota2, nota3, media
		inteiro frequencia

		escreva("Entre com a nota 1: ")
		leia(nota1)
		escreva("Entre com a nota 2: ")
		leia(nota2)
		escreva("Entre com a nota 3: ")
		leia(nota3)
		escreva("Entre com a frequência: ")
		leia(frequencia)

		media = (nota1 + nota2 + nota3)/3

		se(media >= 6 e frequencia >= 75){
			escreva("Aprovado")
		} senao se (media >= 6 e media < 6 e frequencia >= 75){
			escreva("Em exame")
		} senao {
			escreva("Reprovado")
		}
	}

	funcao ex4(){
		//Efetuar a leitura de um valor numérico real positivo ou negativo representado/armazenado na variável ‘numero’
		//e apresentar o valor lido como sendo positivo. Dica: se o valor lido for menor do que zero, ele deve ser
		//multiplicado por -1.

		real numero

		escreva("Entre com o valor: ")
		leia(numero)

		se(numero > 0){
			escreva(numero, " é Positivo!")
		}senao{
			escreva(numero, " é Negativo!")
		}

	}

	funcao ex3(){
		//Solicitar o ano e mês atual, e também o nome do utilizador, seu ano e mês de nascimento pela entrada padrão
		//(teclado). Feito isto, deve-se calcular quantos anos a pessoa possui e apresentar uma mensagem similar a que
		//segue: “Hermano, você possui 33 anos!” [pois eu ainda não aniversário]

		cadeia nome
		inteiro anoAtual, mesAtual, anoNascimento, mesNascimento, idade

		escreva("Qual o ano atual?: ")
		leia(anoAtual)
		escreva("Qual o mês atual?: ")
		leia(mesAtual)
		escreva("Qual o seu nome?: ")
		leia(nome)
		escreva("Qual o ano do seu nascimento?: ")
		leia(anoNascimento)
		escreva("Qual o mês do seu nascimento?: ")
		leia(mesNascimento)

		idade = anoAtual - anoNascimento

		se(mesNascimento > mesAtual){
			idade = idade - 1
			escreva(nome, " você possui ", idade, " anos!")
		} senao {
			escreva(nome, " você possui ", idade, " anos!")
		}

	}

	funcao ex2(){
		//Efetuar a leitura de três valores inteiros desconhecidos e armazená-los em variáveis respectivas. Somar os
		//valores fornecidos e apresentar o resultado da soma somente se for maior ou igual a 100.

		inteiro num1, num2, num3, soma

		escreva("Entre com o primeiro valor: ")
		leia(num1)
		escreva("Entre com o segundo valor: ")
		leia(num2)
		escreva("Entre com o terceiro valor: ")
		leia(num3)

		soma = num1 + num2 + num3

		se(soma >= 100){
			escreva("Valor foi maior que 100: ", soma)
		} senao{
			escreva("Valor não foi maior que 100")
		}
	}

	funcao ex1(){
		//Solicitar a idade do usuário e verificar se ele tem 18 anos ou mais. Se tiver, deve-se apresentar uma mensagem
		//“maior de idade”, senão “menor de idade”.

		inteiro idade
		const inteiro MAIOR = 18

		escreva("Qual a sua idade?: ")
		leia(idade)

		se(idade > MAIOR){
			escreva("maior de idade")
		} senao{
			escreva("menor de idade")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 58; 
 * @DOBRAMENTO-CODIGO = [6, 42, 70, 85, 100, 121, 135, 170, 191, 221, 239, 269, 291];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */