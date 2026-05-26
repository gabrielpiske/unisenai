import java.util.Scanner;

public class GabrielSchwederPiskeLista03E09 {
    public static void main(String[] args) {
        //Dados três valores (double) X, Y e Z, elabore um programa em Java para verificar se eles podem formar
        //os lados de um triângulo.
        //• Condição de existência: O comprimento de cada lado de um triângulo deve ser menor que a
        //soma dos comprimentos dos outros dois lados.
        //Se for possível formar um triângulo, o programa deverá classificá-lo como:
            //• Equilátero: Os três lados possuem comprimentos iguais.
            //• Isósceles: Dois dos lados possuem comprimentos iguais.
            //• Escaleno: Os três lados possuem comprimentos diferentes.
            //Caso os valores não possam formar um triângulo, o programa deve exibir uma mensagem informando o motivo.

        Scanner ler = new Scanner(System.in);

        System.out.println("Entre com o primeiro lado do triângulo: ");
        int x = ler.nextInt();
        System.out.println("Entre com o segundo lado do triângulo: ");
        int y = ler.nextInt();
        System.out.println("Entre com o terceiro lado do triângulo: ");
        int z = ler.nextInt();

        if(x < y + z && y < z + x && z < x + y){
            if(x == y && y == z){
                System.out.println("Triângulo Equilátero");
            } else if(x == y || x == z || y == z){
                System.out.println("Triângulo Isósceles");
            } else {
                System.out.println("Triângulo Escaleno");
            }
        } else{
            System.out.println("Não é possível formar um triângulo, pois um dos lados é maior ou igual à soma dos outros dois.");
        }
    }
}