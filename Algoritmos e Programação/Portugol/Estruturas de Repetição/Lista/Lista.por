programa{
	
	funcao inicio(){
		ex10()
	}

	funcao ex10(){
		//Faça um algoritmo em Portugol que solicite ao 
		//usuário um número inteiro positivo. O programa deve então verificar e informar 
		//se o número digitado é um número primo ou não. 
		//Definição: Um número primo é aquele que é divisível apenas por 1 e por ele mesmo. 
		//Dica: Para verificar se um número N é primo, você pode testar se ele 
		//possui algum divisor no intervalo de 2 até N-1. 
		//o Observação: O número 1 não é considerado número primo.
		inteiro numero, divisores = 0
		
		escreva("Entre com o número: ")
		leia(numero)

		se (numero <= 1) {
			escreva("O número ", numero, " não é primo.")
		} senao {
			para (inteiro i = 1; i <= numero; i++) {
				se (numero % i == 0) {
					divisores++
				}
			}
			se (divisores == 2) {
				escreva("O número ", numero, " é primo.")
			} senao {
				escreva("O número ", numero, " não é primo.")
			}
		}
	}

	funcao ex9(){
		//A série de Fibonacci é formada pela sequência 0, 1, 1, 2, 3, 
		//5, 8, 13, 21, .... Crie um programa em Portugol que solicite ao usuário um número 
		//N e gere e mostre os N primeiros termos da série.
		inteiro qtd, ultimo = 0, penultimo = 0, atual = 1
		escreva("Quantos algarismos deseja na sequência: ")
		leia(qtd)
		para(inteiro i = 0; i < qtd; i++){
			escreva(atual, "\n")
			ultimo = penultimo
			penultimo = atual
			atual = ultimo + penultimo
			se(ultimo == 0){
				ultimo++
			}
		}
	}

	funcao ex8(){
		//Desenvolva um algoritmo que solicite ao usuário 
		//que insira 10 números inteiros. Após a inserção de todos os números, o 
		//programa deve calcular e exibir: o maior, o menor e a média dos números 
		//fornecidos.
		inteiro numero, maior = 0, menor = 0
		real soma = 0.0, media
		
		para (inteiro i = 1; i <= 10; i++) {
			escreva("Digite o ", i, "º número: ")
			leia(numero)
			se (i == 1) {
				maior = numero
				menor = numero
			} senao {
				se (numero > maior) {
					maior = numero
				}
				se (numero < menor) {
					menor = numero
				}
			}

			soma = soma + numero
		}

		media = soma / 10

		escreva("\n--- Resultados ---")
		escreva("\nMaior número: ", maior)
		escreva("\nMenor número: ", menor)
		escreva("\nMédia: ", media)
	}

	funcao ex7(){
		//Desenvolva um algoritmo que leia 20 valores inteiros 
		//fornecidos pelo usuário e, ao final, apresente: 
		//a) A soma de todos os números positivos inseridos. 
		//b) A quantidade total de números negativos inseridos. 
		inteiro valor = 0, soma = 0, negativos = 0
		para(inteiro i = 1; i <= 20; i++){
			escreva("Entre com um valor nº",i,": ")
			leia(valor)
			se(valor > 0){
				soma += valor
			} senao {
				negativos++
			}
		}
		escreva("Soma: ", soma, "\n")
		escreva("Númeos negativos: ", negativos)
	}
		
	funcao ex6(){
		//Crie um algoritmo que solicite ao usuário um número inteiro 
		//não negativo e determine o seu fatorial. Lembre-se que o fatorial de um número 
		//N (N!) é definido como o produto 1 * 2 * 3 * ... * N, e o fatorial de 0 é igual a 1. 
		//o Exemplo: 5! = 1 * 2 * 3 * 4 * 5 = 120.
		inteiro numero, resultado = 1

		escreva("Digite um número inteiro não negativo: ")
		leia(numero)
    
		para(inteiro i = 1; i <= numero; i++) {
			resultado = resultado * i
		}
		escreva("O fatorial de ", numero, "! é: ", resultado)
	}

	funcao ex5(){
		//Elabore um algoritmo que solicite ao usuário um 
		//número e exiba a sua tabela de multiplicação de 1 até 15. Por exemplo, se o 
		//usuário digitar 7, a saída deve ser: 7x1=7, 7x2=14, ..., 7x15=105.
		inteiro numero = 0
		escreva("Qual número utilizar: ")
		leia(numero)
		para(inteiro i = 0; i <= 15; i++){
			escreva(numero, "x", i, " = ", numero * i, "\n")
		}
	}

	funcao ex4(){
		//Crie um algoritmo que calcule e exiba os quadrados e 
		//cubos dos números de 0 a 10. A saída deve ser formatada como uma tabela, 
		//com colunas para o "Número", seu "Quadrado" e seu "Cubo".
		//Observação: para imprimir com espaços tabulados (tecla “tab”), coloque o caractere 
		//“\t” dentro da string a ser impressa.
		escreva("Número \t Quadrado \t Cubo \n")
		para(inteiro i = 0; i <= 10; i++){
			inteiro quadrado, cubo
			escreva(i, "\t   ", quadrado = i*i, "\t \t  ", cubo = i*i*i, "\n")
		}
	}

	funcao ex3(){
		//Crie um algoritmo que calcule a soma de todos os números 
		//inteiros de 1 a 100 e exiba o resultado final.
		inteiro soma = 0

	    para(inteiro i = 1; i <= 100; i++) {
	      soma = soma + i
	      escreva(soma, "\n")
	    }
  	}

	funcao ex2(){
		//Elabore um algoritmo em Portugol que exiba a 
		//sequência de números: 1, 5, 9, 13, 17, ... até o último valor que não ultrapasse 
		//50. A sequência é formada por um número inicial 1 e incrementos de 4.
		para(inteiro numero = 1; numero <= 50; numero = numero + 4){
			escreva("Sequência de números: ", numero, "\n")
		}
	}
	
	funcao ex1(){
		//Desenvolva um algoritmo que solicite ao 
		//usuário um número inteiro positivo. Em seguida, o programa deve exibir a 
		//mensagem "Bom dia" na tela a quantidade de vezes informada pelo usuário.

		inteiro numero = 0

		faca{
			escreva("Entre com um número: ")
			leia(numero)
			para(inteiro i = 0; i < numero; numero--){
				escreva("Bom dia nº ", numero, "\n")
			}
		}enquanto(numero >= 0)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 589; 
 * @DOBRAMENTO-CODIGO = [35, 53, 87, 106, 122, 134, 147, 158, 167];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */