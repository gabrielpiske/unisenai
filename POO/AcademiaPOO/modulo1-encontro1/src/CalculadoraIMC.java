public class CalculadoraIMC {

    public static double calcularIMC(double pesoKg, double alturaM) {
        double imc = pesoKg / (alturaM * alturaM);
        return imc;
    }

    public static String classificarIMC(double imc) {
        String retorno = "";
        if(imc < 18.5){
            retorno = "Abaixo do Peso";
        } else if (imc >= 18.5 && imc < 24.9) {
            retorno = "Peso Normal";
        } else if (imc > 24.9 && imc < 29.9) {
            retorno = "Sobrepeso";
        } else {
            retorno = "Obesidade";
        }
        return retorno;
    }

    public static void main(String[] args) {
        double imc = calcularIMC(76, 1.86);
        System.out.printf("IMC: %.1f — %s%n", imc, classificarIMC(imc));
    }
}