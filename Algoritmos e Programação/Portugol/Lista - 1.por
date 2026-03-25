programa{
	
	funcao inicio(){
		ex12()
	}

	funcao ex13(){
		real valor, valor_desconto
		const real DESCONTO = 0.3

		escreva("Diga o preço do produto: ")
		leia(valor)

		valor_desconto = (valor*DESCONTO)

		escreva("O valor original é R$", valor, " o valor do desconto é R$", valor_desconto, " e o valor final é R$", valor-valor_desconto)
	}

	funcao ex12(){
		real cel, fah

		escreva("Entre com uma temperatura em ºF: ")
		leia(fah)

		cel = (fah-32)*(5.0/9)

		escreva("A temperatura em Celsius é: ", cel)
	}

	funcao ex11(){
		real cel, fah

		escreva("Entre com uma temperatura em ºC: ")
		leia(cel)

		fah = (9*cel+160)/5

		escreva("A temperatura em Fahrenheit é: ", fah)
	}

	funcao ex10(){
		inteiro valor

		escreva("Entre com um valor: ")
		leia(valor)

		escreva("O valor ao quadrado é: ", valor*valor)
	}

	funcao ex9(){
		real salario, reajuste

		escreva("Escreva seu salário: ")
		leia(salario)
		escreva("Escreva o percentual de reajuste: ")
		leia(reajuste)

		escreva("Seu salario com reajuste é: R$", (salario*reajuste)/100 + salario)
	}

	funcao ex8(){
		inteiro ano, mes, dia, result

		escreva("Quantos anos voce tem: ")
		leia(ano)
		escreva("Quantos meses de vida voce tem esse ano: ")
		leia(mes)
		escreva("Quantos dias passaram esse mes: ")
		leia(dia)

		result = (ano*365) + (mes*30) + dia

		escreva("Voce tem ", result, " dias de vida")
	}

	funcao ex7(){
		real base, altura

		escreva("Entre com a base do triangulo: ")
		leia(base)
		escreva("Entre com a altura do triangulo: ")
		leia(altura)

		escreva("Area do triangulo: ", (base*altura)/2)
	}

	funcao ex6(){
		inteiro valor

		escreva("Entre com um numero: ")
		leia(valor)

		escreva("O antecessor do número é ", valor-1, " e o sucessor é ", valor + 1)
	}

	funcao ex5(){
		cadeia nome
		real cot_dolar, valor_final, valor_reais

		escreva("Qual o seu nome: ")
		leia(nome)
		escreva("Qual a cotação atual do dolar: ")
		leia(cot_dolar)
		escreva("Qual quantia deseja converter: ")
		leia(valor_reais)

		valor_final = valor_reais*cot_dolar

		escreva("Prezado(a)", nome,", seu valor convertido é: $", valor_final)
	}

	funcao ex4(){
		cadeia nome
		inteiro nasc

		escreva("Entre com seu nome: ")
		leia(nome)

		escreva("Entre com seu ano de nascimento: ")
		leia(nasc)

		escreva("Prezado(a)", nome,", neste ano de 2026 você fez (ou fará) ", (2026-nasc), " anos.")
	}

	funcao ex3(){
		real raio, result
		const real PI = 3.14

		escreva("Entre com o raio do circulo: ")
		leia(raio)

		result = PI*(raio*raio)

		escreva("A area do circulo é: ", result)
	}

	funcao ex2(){
		real num1, num2, num3

		escreva("Entre com o primeiro valor: ")
		leia(num1)
		escreva("\nEntre com o segundo valor: ")
		leia(num2)
		escreva("\nEntre com o terceiro valor: ")
		leia(num3)

		escreva("\nA média é: ", (num1 + num2 + num3)/3)
	}

	funcao ex1(){
		inteiro num1, num2
	
		escreva("Entre com o primeiro valor: ")
		leia(num1)
		escreva("\nEntre com o segundo valor: ")
		leia(num2)
	
		escreva("\nA soma dos valores é: ", num1 + num2)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 47; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */