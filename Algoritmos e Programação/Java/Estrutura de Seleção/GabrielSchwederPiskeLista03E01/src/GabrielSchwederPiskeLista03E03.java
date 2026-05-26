import java.util.Scanner;

public class GabrielSchwederPiskeLista03E03 {
    public static void main(String[] args) {
        //Elabore um programa em Java que leia um número inteiro (int) de três algarismos (ex: CDU) e o
        //reescreva com a ordem dos algarismos invertida (ex: UDC). Por exemplo, se o número lido for 123, o
        //programa deverá exibir 321.

        Scanner ler = new Scanner(System.in);

        System.out.println("Entre com o número: ");
        int numero = ler.nextInt();

        int primeiroDigito = numero / 100;
        int segundoDigito = (numero % 100) / 10;
        int terceiroDigito = numero % 10;

        System.out.println("Ordem inversa: " + terceiroDigito + segundoDigito + primeiroDigito);
    }
}