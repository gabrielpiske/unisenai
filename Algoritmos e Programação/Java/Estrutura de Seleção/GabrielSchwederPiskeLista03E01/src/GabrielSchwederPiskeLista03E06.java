import java.util.Scanner;

public class GabrielSchwederPiskeLista03E06 {
    public static void main(String[] args) {
        //Elabore um programa em Java que leia três números e os exiba em ordem decrescente.

        Scanner ler = new Scanner(System.in);

        System.out.println("Entre com o primeiro valor: ");
        int valor1 = ler.nextInt();
        System.out.println("Entre com o segundo valor: ");
        int valor2 = ler.nextInt();
        System.out.println("Entre com o terceiro valor: ");
        int valor3 = ler.nextInt();

        if(valor1 > valor2 && valor1 > valor3){
            if(valor2 > valor3){
                System.out.println("Ordem Decrescente: " + valor1 + " " + valor2 + " " + valor3);
            } else {
                System.out.println("Ordem Decrescente: " + valor1 + " " + valor3 + " " + valor2);
            }
        } else if (valor2 > valor1 && valor2 > valor3){
            if(valor1 > valor3){
                System.out.println("Ordem Decrescente: " + valor2 + " " + valor1 + " " + valor3);
            } else {
                System.out.println("Ordem Decrescente: " + valor2 + " " + valor3 + " " + valor1);
            }
        } else if (valor3 > valor1 && valor3 > valor2){
            if(valor1 > valor2){
                System.out.println("Ordem Decrescente: "+ valor3+ " "+ valor1+ " "+ valor2);
            } else {
                System.out.println("Ordem Decrescente: "+ valor3+ " "+ valor2+ " "+ valor1);
            }
        }
    }
}