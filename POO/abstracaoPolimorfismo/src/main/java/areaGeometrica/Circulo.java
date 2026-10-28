package areaGeometrica;

public class Circulo extends FiguraGeometrica {
    private double raio;

    public Circulo() {
    }

    public Circulo(double raio) {
        if (raio <= 0) {
            throw new IllegalArgumentException("O raio do círculo deve ser maior que zero.");
        }
        this.raio = raio;
    }

    public double getRaio() {
        return raio;
    }

    public void setRaio(double raio) {
        if (raio <= 0) {
            throw new IllegalArgumentException("O raio deve ser maior que zero.");
        }
        this.raio = raio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * Math.pow(raio, 2);
    }

    @Override
    public String getNomeFigura() {
        return String.format("Círculo (raio=%.2f)", raio);
    }
}
