package com.example.exercicio7;

public class EntregaMoto extends Entrega {

    public EntregaMoto(int codigo, double distanciaKm, double pesoKg) {
        super(codigo, distanciaKm, pesoKg);

        if (pesoKg > 5) {
            throw new IllegalArgumentException("Moto suporta até 5 kg.");
        }
    }

    @Override
    public double calcularCusto() {
        return 5 + (distanciaKm * 1.5) + (pesoKg * 0.5);
    }

    @Override
    public int calcularPrazo() {
        return (int) Math.ceil(distanciaKm / 30);
    }

}
