import java.util.Scanner;

public class GabrielSchwederPiskeLista03E10 {
    public static void main(String[] args) {
        //Desenvolva um programa em Java que receba do usuário a coluna e a linha (valores inteiros int de 1
        //a 8) de uma casa em um tabuleiro de xadrez. O programa deve então determinar e exibir se a casa
        //correspondente é branca ou preta.

        Scanner ler = new Scanner(System.in);

        System.out.println("Insira o número da coluna (1 a 8): ");
        int coluna = ler.nextInt();
        System.out.println("Insira o número da linha (1 a 8): ");
        int linha = ler.nextInt();

        if ((linha & 1) == 0 && (coluna & 1) == 0 || (linha & 1) == 1 && (coluna & 1) == 1) {
            System.out.println("É uma casa preta");
        } else {
            System.out.println("É uma casa branca");
        }
    }
}