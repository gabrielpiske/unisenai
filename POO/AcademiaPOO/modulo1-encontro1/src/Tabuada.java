public class Tabuada {

    public static void imprimirTabuada(int numero) {
        System.out.println("=== Tabuada do " + numero + " ===");
        for (int i = 1; i <= 10; i++) {
            System.out.printf("%d × %d = %d%n", numero, i, numero * i);
        }
    }

    public static void main(String[] args) {
        imprimirTabuada(2);
        System.out.println();
        imprimirTabuada(5);
        System.out.println();
        imprimirTabuada(7);
    }
}