import java.util.Scanner;

public class Analisador {
    public static void main(String[] args) {
        Scanner read = new Scanner(System.in);

        int MAXIMO_ELEMENTOS = 100;
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
            for (int i = 0; i <= num; i++) {
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
        for(int i = 1; i <= num; i++) {
            fat *= i;
        }
        return fat;
    }
}