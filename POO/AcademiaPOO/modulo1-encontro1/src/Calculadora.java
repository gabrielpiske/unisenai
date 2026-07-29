public class Calculadora {

    /*
    Erro 1:
    O método somar usa void, o que significa que ele não retorna nada.
    Porém, ele tenta executar return a + b;. O tipo de retorno precisa mudar para int.
     */
    public static int somar(int a, int b) {
        return a + b;
    }

    /*
    Erro 2:
     O método media divide a soma inteira por 2, resultando em 7 em vez de 7.5.
     Pra arrumar é preciso dividir por 2.0 para forçar a divisão decimal.
     */
    public static double media(int a, int b) {
        return (a + b) / 2.0;
    }

    /*
    Erro 3:
    O método subtrair calcula menor - maior invertendo os parâmetros descritos (maior e menor),
    resultanto em -7.0 no lugar de 7.0. A conta correta é maior - menor.
     */
    public static double subtrair(double maior, double menor) {
        return maior - menor;
    }

    /*
     Erro 4:
     O método dobro não tem a palavra static, mas é chamado direto no método main que é estático.
     O jeito mais simples é transformar o método em static.
     */
    public static double dobro(double x) {
        return x * 2;
    }

    public static void main(String[] args) {
        System.out.println(somar(3, 4));        // deveria imprimir 7
        System.out.println(media(7, 8));        // deveria imprimir 7.5
        System.out.println(subtrair(10, 3));    // deveria imprimir 7.0
        System.out.println(dobro(5));           // deveria imprimir 10.0
    }
}