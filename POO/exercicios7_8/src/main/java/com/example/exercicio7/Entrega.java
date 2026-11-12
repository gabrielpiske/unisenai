package com.example.exercicio7;

public abstract class Entrega {

    protected int codigo;
    protected double distanciaKm;
    protected double pesoKg;

    public Entrega(int codigo, double distanciaKm, double pesoKg) {
        if (distanciaKm <= 0 || pesoKg <= 0) {
            throw new IllegalArgumentException("Distância e peso devem ser positivos.");
        }

        this.codigo = codigo;
        this.distanciaKm = distanciaKm;
        this.pesoKg = pesoKg;
    }

    public abstract double calcularCusto();

    public abstract int calcularPrazo();
}
