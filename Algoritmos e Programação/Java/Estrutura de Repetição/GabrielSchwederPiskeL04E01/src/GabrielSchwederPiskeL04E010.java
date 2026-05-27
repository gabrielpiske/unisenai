import java.util.Scanner;

public class GabrielSchwederPiskeL04E010 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Faça um programa em Java que solicite ao usuário um número inteiro positivo (int). O programa
        //deve então verificar e informar se o número digitado é um número primo ou não.
        //• Definição: Um número primo é aquele que é divisível apenas por 1 e por ele mesmo.
        //• Dica: Para verificar se um número N é primo, você pode testar (usando o operador %)
        //se ele possui algum divisor no intervalo de 2 até N-1.
        //• Observação: O número 1 não é considerado número primo

        int divisores = 0;

        System.out.println("Entre com o número: ");
        int numero = ler.nextInt();

        if (numero <= 1) {
            System.out.println("O número "+ numero+ " não é primo.");
        } else {
            for (int i = 1; i <= numero; i++) {
                if (numero % i == 0) {
                    divisores++;
                }
            }
            if (divisores == 2) {
                System.out.println("O número "+ numero+ " é primo.");
            } else {
                System.out.println("O número "+ numero+ " não é primo.");
            }
        }
    }
}