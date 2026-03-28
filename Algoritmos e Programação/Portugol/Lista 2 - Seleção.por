programa{
	
	funcao inicio(){
		ex6()
	}

	funcao ex6(){
		
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
 * @POSICAO-CURSOR = 65; 
 * @DOBRAMENTO-CODIGO = [10, 40, 58, 88, 110];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */