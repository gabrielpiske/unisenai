import java.util.Scanner;

public class GabrielSchwederPiskeLista03E04 {
    public static void main(String[] args) {
        //Desenvolva um programa em Java que leia dois números (ex: int ou double) e imprima uma mensagem
        //indicando qual deles é o maior.

        Scanner ler = new Scanner(System.in);

        System.out.println("Escreva o primeiro numero: ");
        int num1 = ler.nextInt();
        System.out.println("Escreva o segundo numero: ");
        int num2 = ler.nextInt();

        if(num1 > num2){
            System.out.println("O maior número é o primeiro! (" + num1 +")");
        } else {
            System.out.println("O maior número é o segundo! (" + num2 +")");
        }
    }
}