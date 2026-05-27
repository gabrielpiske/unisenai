import java.util.Scanner;

public class GabrielSchwederPiskeL04E08 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Desenvolva um programa em Java que solicite ao usuário que insira 10 números inteiros (int).
        //Após a inserção de todos os números, o programa deve calcular e exibir: o maior, o menor e a
        //média (use double para a média) dos números fornecidos.

        int numero, maior = 0, menor = 0;
        double soma = 0.0, media = 0.0;

        for (int i = 1; i <= 10; i++) {
            System.out.println("Digite o "+ i+ "º número: ");
            numero = ler.nextInt();
            if (i == 1) {
                maior = numero;
                menor = numero;
            } else {
                if (numero > maior) {
                    maior = numero;
                }
                if (numero < menor) {
                    menor = numero;
                }
            }

            soma = soma + numero;
        }

        media = soma / 10;

        System.out.println("\n--- Resultados ---");
        System.out.println("\nMaior número: " + maior);
        System.out.println("\nMenor número: " + menor);
        System.out.println("\nMédia: " + media);
    }
}