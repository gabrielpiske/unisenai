package org.example.exeptions;

public class TrapDamageException extends Exception {
    private int damageAmount = 20;

    public TrapDamageException(String message) {
        super(message);
    }

    public TrapDamageException(String message, int damage) {
        super(message);
        this.damageAmount = damage;
    }

    public int getDamageAmount() {
        return this.damageAmount;
    }
}