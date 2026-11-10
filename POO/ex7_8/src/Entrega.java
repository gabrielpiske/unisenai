public abstract class Entrega {

    private String codigo;
    private double distanciaKm;
    private double pesoKg;

    public Entrega(String codigo, double distanciaKm, double pesoKg) {
        this.codigo = codigo;
        this.distanciaKm = distanciaKm;
        this.pesoKg = pesoKg;
    }

    public String getCodigo() {
        return codigo;
    }

    public double getDistanciaKm() {
        return distanciaKm;
    }

    public double getPesoKg() {
        return pesoKg;
    }

    public abstract double calcularCusto();

    public abstract int calcularPrazo();

}
