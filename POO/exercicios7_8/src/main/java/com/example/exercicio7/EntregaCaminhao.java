package com.example.exercicio7;

public class EntregaCaminhao extends Entrega {

    public EntregaCaminhao(int codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);

        if (pesoKg > 1000) {
            throw new IllegalArgumentException("Caminhão suporta até 1000 kg.");
        }
    }

    @Override
    public double calcularCusto() {
        return 30 + (distanciaKm * 3) + (pesoKg * 1.2);
    }

    @Override
    public int calcularPrazo() {
        return (int) Math.ceil(distanciaKm / 70);
    }

}
