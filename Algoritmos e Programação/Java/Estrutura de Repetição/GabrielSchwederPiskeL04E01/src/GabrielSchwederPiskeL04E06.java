import java.util.Scanner;

public class GabrielSchwederPiskeL04E06 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Crie um programa em Java que solicite ao usuário um número inteiro não negativo (int) e
        //determine o seu fatorial.
        //• Lembre-se que o fatorial de um número N (N!) é definido como o produto 1 * 2 * 3 * ... *
        //N, e o fatorial de 0 é igual a 1.
        //• Exemplo: 5! = 1 * 2 * 3 * 4 * 5 = 120.
        //• Dica: Use o tipo long para armazenar o resultado do fatorial, pois ele cresce muiti rapidamente.

        long resultado = 1L;

        System.out.println("Digite um número inteiro não negativo: ");
        int numero = ler.nextInt();

        for(int i = 1; i <= numero; i++) {
            resultado = resultado * i;
        }
        System.out.println("O fatorial de " + numero+ "! é: "+ resultado);
    }
}