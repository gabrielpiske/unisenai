import java.util.Scanner;

public class GabrielSchwederPiskeL04E09 {
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);

        //A série de Fibonacci é formada pela sequência 0, 1, 1, 2, 3, 5, 8, 13, 21, .... Crie um programa
        //em Java que solicite ao usuário um número N (int) e gere e mostre os N primeiros termos da série

        int qtd, ultimo = 0, penultimo = 0, atual = 1;
        System.out.println("Quantos algarismos deseja na sequência: ");
        qtd = ler.nextInt();
        for(int i = 0; i < qtd; i++){
            System.out.println(atual);
            ultimo = penultimo;
            penultimo = atual;
            atual = ultimo + penultimo;
            if(ultimo == 0){
                ultimo++;
            }
        }
    }
}