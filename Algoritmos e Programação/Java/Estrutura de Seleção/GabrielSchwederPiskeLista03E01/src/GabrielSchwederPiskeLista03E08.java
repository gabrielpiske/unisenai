import java.util.Scanner;

public class GabrielSchwederPiskeLista03E08 {
    public static void main(String[] args) {
        //System.out.println um programa em Java que calcule a média aritmética das três notas (use double) de um aluno.
        //Além do valor da média, o programa deve exibir uma das seguintes mensagens:
        //• "Aprovado", se a média for igual ou superior a 6.
        //• "Em prova final", se a média for inferior a 6, mas igual ou superior a 3.
        //• "Reprovado", para as demais situações.

        Scanner ler = new Scanner(System.in);

        final int QUANTIDADE_NOTAS = 3;

        System.out.println("Entre com a primeira nota: ");
        int nota1 = ler.nextInt();
        System.out.println("Entre com a segunda nota: ");
        int nota2 = ler.nextInt();
        System.out.println("Entre com a terceira nota: ");
        int nota3 = ler.nextInt();

        double media = (double) (nota1 + nota2 + nota3) / QUANTIDADE_NOTAS;

        if (media >= 6) {
            System.out.println("Aprovado com a média: " + media);
        } else if (media < 6 && media >= 3) {
            System.out.println("Em prova final com a média: " + media);
        } else {
            System.out.println("Reprovado com a média: " + media);
        }
    }
}