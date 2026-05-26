import java.util.Scanner;

public class GabrielSchwederPiskeLista03E05 {
    public static void main(String[] args) {
        //Faça um programa em Java que leia um número inteiro (int) e determine se ele é par ou ímpar,
        //utilizando o operador de módulo (%). O programa deve exibir uma mensagem com o resultado,
        //considerando o número zero como par.

        Scanner ler = new Scanner(System.in);

        System.out.println("Entre com um valor: ");
        int valor = ler.nextInt();

        if (valor % 2 != 0) {
            System.out.println("Valor é impar");
        } else {
            System.out.println("Valor é par");
        }
    }
}