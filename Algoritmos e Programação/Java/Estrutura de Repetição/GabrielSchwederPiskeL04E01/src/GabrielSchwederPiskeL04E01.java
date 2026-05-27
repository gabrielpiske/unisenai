import java.util.Scanner;

public class GabrielSchwederPiskeL04E01 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Desenvolva um programa em Java que solicite ao usuário um número inteiro positivo (int). Em
        //seguida, o programa deve exibir a mensagem "Bom dia" na tela a quantidade de vezes informada
        //pelo usuário (utilize um laço for ou while).

        int numero;
        do {
            System.out.println("Entre com um número: ");
            numero = ler.nextInt();
            for (int i = 0; i < numero; numero--) {
                System.out.println("Bom dia nº " + numero);
            }
        } while (numero >= 0);
    }
}