package org.example.exeptions;

public class ManaInsuficienteException extends Exception {
    private int manaAtual;
    private int manaNecessaria;

    public ManaInsuficienteException(String message) {
        super(message);
    }

    public ManaInsuficienteException(String message, int manaAtual, int manaNecessaria) {
        super(message);
        this.manaAtual = manaAtual;
        this.manaNecessaria = manaNecessaria;
    }

    public int getManaAtual() {
        return this.manaAtual;
    }

    public int getManaNecessaria() {
        return this.manaNecessaria;
    }
}