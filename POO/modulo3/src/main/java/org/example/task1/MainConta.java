package org.example.task1;

import javax.swing.*;

public class MainConta  {
    public static void main(String[] args) {
        try {
            String titular = JOptionPane.showInputDialog("Nome do titular:");
            double saldoIni = Double.parseDouble(
                    JOptionPane.showInputDialog("Saldo inicial:"));

            ContaBancaria conta = new ContaBancaria(titular, saldoIni);

            String[] opcoes = {"Depositar", "Sacar", "Ver Saldo", "Sair"};
            int escolha;

            do {
                escolha = JOptionPane.showOptionDialog(null,
                        "Escolha uma operação:",
                        "Conta Bancária - " + conta.getTitular(),
                        JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,
                        null, opcoes, opcoes[0]);

                switch (escolha) {
                    case 0 -> {
                        double v = Double.parseDouble(
                                JOptionPane.showInputDialog("Valor do depósito:"));
                        conta.depositar(v);
                    }
                    case 1 -> {
                        double v = Double.parseDouble(
                                JOptionPane.showInputDialog("Valor do saque:"));
                        conta.sacar(v);
                    }
                    case 2 -> JOptionPane.showMessageDialog(null,
                            "Saldo atual: " + conta.getSaldo());
                    case 3 -> JOptionPane.showMessageDialog(null, "Encerrando...");
                }
            } while (escolha != 3 && escolha != -1);

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Digite apenas números!",
                    "Erro", JOptionPane.ERROR_MESSAGE);
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "❌ " + e.getMessage(),
                    "Erro de Validação", JOptionPane.ERROR_MESSAGE);
        }
    }
}