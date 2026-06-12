import java.util.Scanner;

public class Analisador {
    public static void main(String[] args) {
        Scanner read = new Scanner(System.in);

        int MAXIMO_ELEMENTOS = 3;
        int[] numeros = new int[MAXIMO_ELEMENTOS];
        int totalNumeros = 0;

        System.out.println("--- Analisador de Dados Numéricos Avançado ---");
        System.out.println("Insira números positivos inteiros (ou numero negativo para encerrar):");

        while (totalNumeros < MAXIMO_ELEMENTOS) {
            System.out.println("Informe o " + (totalNumeros + 1) + "º número: ");
            int num = read.nextInt();

            if (num < 0) {
                System.out.println("Encerrando o Sistema...");
                break;
            }

            if (num == 0) {
                System.out.println("Apenas números maiores que zero são válidos.");
                continue;
            }

            numeros[totalNumeros] = num;
            totalNumeros++;

            analisarNumeroIndividual(num);
        }

        if (totalNumeros == 0) {
            System.out.println("\nNenhum dado foi processado. Programa encerrado de forma limpa");
            read.close();
            return;
        }

        System.out.println("\n==============================================");
        System.out.println("             RELATÓRIO FINAL                  ");
        System.out.println("==============================================");

        System.out.println("Lista Completa: [");
        double soma = 0;
        int maior = numeros[0];
        int menor = numeros[0];

        for (int i = 0; i < totalNumeros; i++) {
            System.out.println(numeros[i] + (i == totalNumeros - 1 ? "" : ", "));
            soma += numeros[i];

            if (numeros[i] > maior) maior = numeros[i];
            if (numeros[i] < menor) menor = numeros[i];
        }
        System.out.println("]");
        System.out.println("Quantidade total de números informados: " + totalNumeros);

        double media = soma / totalNumeros;
        System.out.printf("Média Aritmética dos números: %.2f\n", media);
        System.out.println("Maior número da lista: " + maior);
        System.out.println("Menor número da lista: " + menor);

        int totalPrimos = 0;
        int menorPrimo = -1;
        int maiorPrimo = -1;

        for (int i = 0; i < totalNumeros; i++) {
            if (ePrimo(numeros[i])) {
                totalPrimos++;
                if (maiorPrimo == -1 || numeros[i] > maiorPrimo) {
                    maiorPrimo = numeros[i];
                }
                if (menorPrimo == -1 || numeros[i] < menorPrimo) {
                    menorPrimo = numeros[i];
                }
            }
        }

        System.out.println("\n--- Análise de Primos ---");
        if (totalPrimos > 0) {
            System.out.println("Quantidade de números primos encontrados: " + totalPrimos);
            System.out.println("Maior número primo da lista: " + maiorPrimo);
            System.out.println("Menor número primo da lista: " + menorPrimo);
        } else {
            System.out.println("Nenhum número primo encontrado");
        }

        int maxFrequencia = 0;
        for (int i = 0; i < totalNumeros; i++) {
            int contagem = 0;
            for (int j = 0; j < totalNumeros; j++) {
                if (numeros[i] == numeros[j]) {
                    contagem++;
                }
            }
            if (contagem > maxFrequencia) {
                maxFrequencia = contagem;
            }
        }

        System.out.println("\n--- Análise de Frequência (Moda) ---");
        System.out.print("Número(s) mais repetido(s): ");

        int[] modasImpressas = new int[totalNumeros];
        int qtdModasImpressas = 0;

        for (int i = 0; i < totalNumeros; i++){
            int contagem = 0;
            for (int j = 0; j < totalNumeros; j++){
                if (numeros[i] == numeros[j]) contagem++;
            }

            if (contagem == maxFrequencia){
                boolean jaImpresso = false;
                for (int k = 0; k < qtdModasImpressas; k++){
                    if (modasImpressas[k] == numeros[i]){
                        jaImpresso = true;
                        break;
                    }
                }
                if (!jaImpresso){
                    System.out.print(numeros[i] + " ");
                    modasImpressas[qtdModasImpressas] = numeros[i];
                    qtdModasImpressas++;
                }
            }
        }
        System.out.println("\nQuantidade de aparições: " + maxFrequencia);
        
    }

    private static void analisarNumeroIndividual(int num) {
        String parImpar = (num % 2 == 0) ? "Par" : "Ímpar";
        String multiplo3 = (num % 3 == 0) ? "Múltiplo de 3" : "Não é múltiplo de 3";
        String intervalo = (num >= 100 && num <= 200) ? "Dentro do Intervalo" : "Fora do Intervalo";

        String analisePrimo = "";
        if (ePrimo(num)) {
            analisePrimo = "É primo";
        } else {
            analisePrimo = "Não é primo (Divisores: ";
            for (int i = 1; i <= num; i++) {
                if (num % i == 0) {
                    analisePrimo += i + (i == num ? "" : ", ");
                }
            }
            analisePrimo += ")";
        }
        System.out.println("-> " + num + " [" + parImpar + ", " + multiplo3 + ", " + intervalo + ", " + analisePrimo + "]\n");
    }

    private static boolean ePrimo(int num) {
        if (num <= 1) return false;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) return false;
        }
        return true;
    }

    private static long calcularFatorial(int num) {
        long fat = 1;
        for (int i = 1; i <= num; i++) {
            fat *= i;
        }
        return fat;
    }
}