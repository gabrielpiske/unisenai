public class VerificadorPrimo {

    public static boolean ehPrimo(int numero) {
        if (numero < 2) return false;
        double limite = Math.sqrt(numero);
        for (int i = 2; i <= limite; i++) {
            if (numero % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int[] numeros = {1, 2, 7, 10, 13, 15, 17, 100};
        for (int n : numeros) {
            System.out.println(n + " é primo? " + ehPrimo(n));
        }
    }
}