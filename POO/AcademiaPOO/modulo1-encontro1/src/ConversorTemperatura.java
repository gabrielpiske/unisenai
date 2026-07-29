public class ConversorTemperatura {
    public static double celsiusParaFahrenheit(double celsius) {
        double fahrenheit = (9*celsius+160)/5;
        return  fahrenheit;
    }

    public static double celsiusParaKelvin(double celsius) {
        double kelvin = (celsius + 273.15);
        return kelvin;
    }

    public static void main(String[] args) {
        System.out.println("0°C em Fahrenheit: " + celsiusParaFahrenheit(0));   // 32.0
        System.out.println("100°C em Fahrenheit: " + celsiusParaFahrenheit(100)); // 212.0
        System.out.println("0°C em Kelvin: " + celsiusParaKelvin(0));           // 273.15
    }
}
