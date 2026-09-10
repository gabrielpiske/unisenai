package org.example.task1;

import javax.swing.JOptionPane;

public class ContaBancaria {
    private String titular;
    private double saldo;

    public ContaBancaria(String titular, double saldoInicial) {
        if (titular == null || titular.trim().isEmpty()) {
            throw new IllegalArgumentException("Titular inválido!");
        }
        if (saldoInicial < 0) {
            throw new IllegalArgumentException("Saldo inicial não pode ser negativo!");
        }
        this.titular = titular;
        this.saldo = saldoInicial;
    }

    public String getTitular() { return titular; }

    public String getSaldo() {
        return String.format("R$ %.2f", saldo);
    }

    public void depositar(double valor) {
        if (valor <= 0) {
            JOptionPane.showMessageDialog(null,
                    "Valor de depósito inválido! Deve ser maior que zero.",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        saldo += valor;
        JOptionPane.showMessageDialog(null,
                "Depósito realizado!\nNovo saldo: " + getSaldo());
    }

    public void sacar(double valor) {
        if (valor <= 0) {
            JOptionPane.showMessageDialog(null,
                    "⚠️ Valor de saque inválido! Deve ser maior que zero.",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (valor > saldo) {
            JOptionPane.showMessageDialog(null,
                    "Saldo insuficiente!\nSaldo atual: " + getSaldo(),
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return;
        }
        saldo -= valor;
        JOptionPane.showMessageDialog(null,
                "Saque realizado!\nNovo saldo: " + getSaldo());
    }
}