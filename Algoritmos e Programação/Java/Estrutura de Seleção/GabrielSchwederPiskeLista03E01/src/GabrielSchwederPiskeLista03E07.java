import java.util.Scanner;

public class GabrielSchwederPiskeLista03E07 {
    public static void main(String[] args) {
        //Crie um programa em Java que leia dois valores inteiros (int)+ a e b+ e verifique se são múltiplos um do
        //outro (utilize o operador %). Antes da verificação+ é necessário identificar qual dos números é o maior
        //e qual é o menor. O programa deve exibir os dois números com a mensagem "São múltiplos" ou "Não
        //são múltiplos".

        Scanner ler = new Scanner(System.in);

        System.out.println("Insira o primeiro valor: ");
        int num1 = ler.nextInt();
        System.out.println("Insira o segundo valor: ");
        int num2 = ler.nextInt();

        if(num1 > num2){
            System.out.println("O primeiro valor é maior!: "+ num1+ "\n");
        } else {
            System.out.println("O segundo valor é maior!: "+ num2+ "\n");
        }

        if(num1 % num2 == 0){
            System.out.println("Os números: "+ num1+ " e "+ num2+ " são múltiplos!");
        } else {
            System.out.println("Os números: "+ num1+ " e "+ num2+ " não são múltiplos!");
        }
    }
}