package entregas;

public class EntregaMoto extends Entrega {
    
    private static final double LIMITE_PESO = 20.0;

    public EntregaMoto(String codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);
        if (pesoKg > LIMITE_PESO) {
            throw new IllegalArgumentException("Peso excede a capacidade da moto (máx: 20 kg).");
        }
    }

    @Override
    public double calcularCusto() {
        return 8.00 + (getDistanciaKm() * 1.20) + (getPesoKg() * 0.50);
    }

    @Override
    public int calcularPrazo() {
        return Math.max(1, (int) Math.ceil(getDistanciaKm() / 60.0));
    }

}
