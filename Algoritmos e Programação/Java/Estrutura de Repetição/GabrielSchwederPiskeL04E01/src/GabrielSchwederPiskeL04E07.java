import java.util.Scanner;

public class GabrielSchwederPiskeL04E07 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //Desenvolva um programa em Java que leia 20 valores inteiros (int) fornecidos pelo usuário e, ao
        //final, apresente: a) A soma de todos os números positivos inseridos. b) A quantidade total de
        //números negativos inseridos

        int valor = 0, soma = 0, negativos = 0;
        for(int i = 1; i <= 20; i++){
            System.out.println("Entre com um valor nº"+i+": ");
            valor = ler.nextInt();
            if(valor > 0){
                soma += valor;
            } else {
                negativos++;
            }
        }
        System.out.println("Soma: " + soma);
        System.out.println("Númeos negativos: " + negativos);
    }
}