import java.util.Scanner;

public class GabrielSchwederPiskeL04E02 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Elabore um programa em Java que exiba a sequência de números: 1, 5, 9, 13, 17, ... até o último
        //valor que não ultrapasse 50. A sequência é formada por um número inicial 1 e incrementos de
        //4.

        for(int numero = 1; numero <= 50; numero = numero + 4){
            System.out.println("Sequência de números: " + numero);
        }
    }
}