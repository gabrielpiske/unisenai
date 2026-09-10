package org.example.task2;

import javax.swing.JOptionPane;

public class Produto {
    private String nome;
    private double preco;
    private double desconto;

    public Produto(String nome, double preco, double desconto) {
        if (nome == null || nome.trim().isEmpty()) {
            throw new IllegalArgumentException("Nome inválido!");
        }
        setNomeInterno(nome);
        setPreco(preco);
        setDesconto(desconto);
    }

    private void setNomeInterno(String nome) { this.nome = nome; }

    public String getNome() { return nome; }

    public double getPreco() { return preco; }

    public double getDesconto() { return desconto; }

    public void setPreco(double preco) {
        if (preco <= 0) {
            JOptionPane.showMessageDialog(null,
                    "Preço deve ser maior que zero!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        this.preco = preco;
    }

    public void setDesconto(double desconto) {
        if (desconto < 0) {
            JOptionPane.showMessageDialog(null,
                    "Desconto não pode ser negativo!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (desconto > 50) {
            JOptionPane.showMessageDialog(null,
                    "Desconto máximo é 50%",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        this.desconto = desconto;
    }

    public double getPrecoFinal() {
        return preco * (1 - desconto / 100);
    }

    public String ficha() {
        return "- Produto: " + nome +
                "\nPreço: R$ " + String.format("%.2f", preco) +
                "\nDesconto: " + String.format("%.2f", desconto) + "%" +
                "\nPreço Final: R$ " + String.format("%.2f", getPrecoFinal());
    }
}