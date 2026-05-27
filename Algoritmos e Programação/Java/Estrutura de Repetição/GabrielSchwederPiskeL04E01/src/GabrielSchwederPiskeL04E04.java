import java.util.Scanner;

public class GabrielSchwederPiskeL04E04 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Crie um programa em Java que calcule e exiba os quadrados e cubos dos números de 0 a 10.
        //A saída deve ser formatada como uma tabela, com colunas para o "Número", seu "Quadrado" e
        //seu "Cubo".

        System.out.println("Número \t Quadrado \t Cubo");
        for (int i = 0; i <= 10; i++) {
            int quadrado = i * i;
            int cubo = i * i * i;

            System.out.printf("%d \t%d \t\t%d\n", i, quadrado, cubo);
        }
    }
}