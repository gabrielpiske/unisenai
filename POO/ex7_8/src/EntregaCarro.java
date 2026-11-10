public class EntregaCarro extends Entrega {

    private static final double LIMITE_PESO = 150.0;

    public EntregaCarro(String codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);
        if (pesoKg > LIMITE_PESO) {
            throw new IllegalArgumentException("Peso excede a capacidade do carro (máx: 150 kg).");
        }
    }

    @Override
    public double calcularCusto() {
        return 20.00 + (getDistanciaKm() * 2.00) + (getPesoKg() * 1.00);
    }

    @Override
    public int calcularPrazo() {
        return Math.max(1, (int) Math.ceil(getDistanciaKm() / 100.0));
    }
}
