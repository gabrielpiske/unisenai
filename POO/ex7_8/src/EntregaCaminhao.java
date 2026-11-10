public class EntregaCaminhao extends Entrega {

    private static final double LIMITE_PESO = 10000.0;

    public EntregaCaminhao(String codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);
        if (pesoKg > LIMITE_PESO) {
            throw new IllegalArgumentException("Peso excede a capacidade do caminhão (máx: 10000 kg).");
        }
    }

    @Override
    public double calcularCusto() {
        return 100.00 + (getDistanciaKm() * 4.50) + (getPesoKg() * 0.20);
    }

    @Override
    public int calcularPrazo() {
        return (int) Math.ceil(getDistanciaKm() / 250.0) + 1;
    }

}
