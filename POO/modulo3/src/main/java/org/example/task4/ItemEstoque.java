package org.example.task4;

import javax.swing.JOptionPane;

public class ItemEstoque {
    private String nome;
    private int quantidade;
    private int quantidadeMinima;
    private double preco;

    public ItemEstoque(String nome, int quantidade, int quantidadeMinima, double preco) {
        if (nome == null || nome.trim().isEmpty())
            throw new IllegalArgumentException("Nome inválido!");
        if (quantidade < 0 || quantidadeMinima < 0)
            throw new IllegalArgumentException("Quantidades não podem ser negativas!");
        if (preco < 0)
            throw new IllegalArgumentException("Preço não pode ser negativo!");

        this.nome = nome;
        this.quantidade = quantidade;
        this.quantidadeMinima = quantidadeMinima;
        this.preco = preco;
    }

    public String getNome() { return nome; }
    public int getQuantidade() { return quantidade; }
    public int getQuantidadeMinima() { return quantidadeMinima; }
    public double getPreco() { return preco; }

    public void adicionar(int qtd) {
        if (qtd <= 0) {
            JOptionPane.showMessageDialog(null,
                    "⚠️ Quantidade a adicionar deve ser positiva!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        quantidade += qtd;
        JOptionPane.showMessageDialog(null,
                "✅ " + qtd + " unidade(s) adicionada(s) a " + nome +
                        "\nEstoque atual: " + quantidade);
    }

    public void retirar(int qtd) {
        if (qtd <= 0) {
            JOptionPane.showMessageDialog(null,
                    "⚠️ Quantidade a retirar deve ser positiva!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (quantidade - qtd < quantidadeMinima) {
            JOptionPane.showMessageDialog(null,
                    "❌ Não é possível retirar " + qtd +
                            " unidades. Mínimo de segurança: " + quantidadeMinima,
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return;
        }
        quantidade -= qtd;
        JOptionPane.showMessageDialog(null,
                "✅ " + qtd + " unidade(s) retirada(s) de " + nome +
                        "\nEstoque atual: " + quantidade);
    }

    public boolean precisaReposicao() {
        return quantidade <= quantidadeMinima * 1.5;
    }

    public double valorTotal() {
        return quantidade * preco;
    }

    public String statusHtml() {
        boolean alerta = precisaReposicao();
        String cor = alerta ? "red" : "green";
        String alertaTxt = alerta ? " ⚠️ REPOSIÇÃO NECESSÁRIA" : " ✓ OK";

        return "<font color='" + cor + "'>" +
                "• " + nome +
                " | Qtd: " + quantidade +
                " (mín: " + quantidadeMinima + ")" +
                " | Preço: R$ " + String.format("%.2f", preco) +
                " | Total: R$ " + String.format("%.2f", valorTotal()) +
                alertaTxt +
                "</font><br>";
    }
}