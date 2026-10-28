package areaGeometrica;

public class Triangulo extends FiguraGeometrica {
    private double base;
    private double altura;

    public Triangulo() {
    }

    public Triangulo(double base, double altura) {
        if (base <= 0 || altura <= 0) {
            throw new IllegalArgumentException("A base e a altura do triângulo devem ser maiores que zero.");
        }
        this.base = base;
        this.altura = altura;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        if (base <= 0) {
            throw new IllegalArgumentException("A base deve ser maior que zero.");
        }
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        if (altura <= 0) {
            throw new IllegalArgumentException("A altura deve ser maior que zero.");
        }
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return (base * altura) / 2.0;
    }

    @Override
    public String getNomeFigura() {
        return String.format("Triângulo (base=%.2f, altura=%.2f)", base, altura);
    }
}
