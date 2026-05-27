import java.util.Scanner;

public class GabrielSchwederPiskeL04E05 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Elabore um programa em Java que solicite ao usuário um número (int) e exiba a sua tabela de
        //multiplicação de 1 até 15.
        //• Exemplo: Se o usuário digitar 7, a saída deve ser: 7x1=7, 7x2=14, ..., 7x15=105.

        System.out.println("Qual número utilizar: ");
        int numero = ler.nextInt();
        for(int i = 0; i <= 15; i++){
            System.out.println(numero + "x" + i + " = " + numero * i);
        }
    }
}