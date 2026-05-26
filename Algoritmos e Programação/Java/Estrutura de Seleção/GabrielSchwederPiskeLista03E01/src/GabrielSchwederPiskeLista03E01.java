import java.util.Scanner;

public class GabrielSchwederPiskeLista03E01 {
    public static void main(String[] args) {
        //Escreva um programa em Java que solicite ao usuário a largura e o comprimento de uma sala em
        //metros (utilize double para os valores). O programa deve calcular e exibir a área total da sala em metros
        //quadrados, incluindo as unidades de medida nas mensagens de entrada e saída.

        Scanner ler = new Scanner(System.in);

        float comprimento = 0.0F;
        float largura = 0.0F;

        System.out.println("Entre com o comprimento em metros: ");
        comprimento = ler.nextFloat();

        System.out.println("Entre com a largura em metros: ");
        largura = ler.nextFloat();

        float area = largura * comprimento;

        System.out.println("A area total da sala é: " + area);
    }
}