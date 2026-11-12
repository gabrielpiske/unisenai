package com.example.exercicio7;

public class EntregaCarro extends Entrega {

    public EntregaCarro(int codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);

        if (pesoKg > 50) {
            throw new IllegalArgumentException("Carro suporta até 50 kg.");
        }
    }

    @Override
    public double calcularCusto() {
        return 10 + (distanciaKm * 2) + (pesoKg * 0.8);
    }

    @Override
    public int calcularPrazo() {
        return (int) Math.ceil(distanciaKm / 50);
    }

}
