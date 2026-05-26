import java.util.Scanner;

public class GabrielSchwederPiskeLista03E02 {
    public static void main(String[] args) {
        //Um estabelecimento oferece créditos pela reciclagem de recipientes. Vasilhames de um litro ou menos
        //valem R$ 0,10, enquanto vasilhames com mais de um litro valem R$ 0,25. Crie um programa em Java
        //que leia a quantidade (como int) de cada um desses dois tipos de vasilhames e, em seguida, calcule e
        //exiba o valor total dos créditos obtidos (como double).

        Scanner ler = new Scanner(System.in);

        final double UM_LITRO = 0.1;
        final double MAIS_LITROS = 0.25;
        int quantidadeVasilhameUmLitro = 0;
        int quantidadeVasilhameMaisLitros = 0;

        System.out.println("Qual a quantidade de vasilhames de um litro ou menos?: ");
        quantidadeVasilhameUmLitro = ler.nextInt();

        System.out.println("Qual a quantidade de vasilhames de um litro ou mais?: ");
        quantidadeVasilhameMaisLitros = ler.nextInt();

        int total = (int) ((quantidadeVasilhameUmLitro * UM_LITRO) + (quantidadeVasilhameMaisLitros * MAIS_LITROS));

        System.out.println("O valor total de créditos é: " + total);
    }
}