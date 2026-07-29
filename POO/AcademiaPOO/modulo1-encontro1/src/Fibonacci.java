public class Fibonacci {

    public static long fibonacci(int n) {
        if (n == 0) return 0;
        if (n == 1) return 1;

        long anterior = 0;
        long atual = 1;

        for (int i = 2; i <= n; i++) {
            long proximo = anterior + atual;
            anterior = atual;
            atual = proximo;
        }

        return atual;
    }

    public static void imprimirFibonacci(int quantidade) {
        System.out.print("Fibonacci: ");
        for (int i = 0; i < quantidade; i++) {
            System.out.print(fibonacci(i));
            if (i < quantidade - 1) System.out.print(", ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        imprimirFibonacci(10);
        // Esperado: Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
    }
}