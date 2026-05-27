import java.util.Scanner;

public class GabrielSchwederPiskeL04E03 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Crie um programa em Java que calcule (usando um laço de repetição) a soma de todos os
        //números inteiros de 1 a 100 e exiba o resultado final.

        int soma = 0;

        for(int i = 1; i <= 100; i++) {
            soma = soma + i;
            System.out.println(soma);
        }
    }
}