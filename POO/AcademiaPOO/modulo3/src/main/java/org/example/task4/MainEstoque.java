package org.example.task4;

import javax.swing.JOptionPane;
import java.util.ArrayList;

public class MainEstoque {
    private static ArrayList<ItemEstoque> estoque = new ArrayList<>();

    public static void main(String[] args) {
        String[] opcoes = {"Adicionar ao Estoque", "Retirar do Estoque",
                "Ver Status", "Relatório", "Sair"};
        int escolha;

        do {
            escolha = JOptionPane.showOptionDialog(null,
                    "Mini Estoque",
                    "Menu do Estoque",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,
                    null, opcoes, opcoes[0]);

            try {
                switch (escolha) {
                    case 0 -> adicionarAoEstoque();
                    case 1 -> retirarDoEstoque();
                    case 2 -> verStatus();
                    case 3 -> relatorio();
                    case 4 -> JOptionPane.showMessageDialog(null, "Encerrando...");
                }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "❌ Digite apenas números!",
                        "Erro", JOptionPane.ERROR_MESSAGE);
            } catch (IllegalArgumentException e) {
                JOptionPane.showMessageDialog(null, "❌ " + e.getMessage(),
                        "Erro", JOptionPane.ERROR_MESSAGE);
            }
        } while (escolha != 4 && escolha != -1);
    }

    // "Adicionar ao Estoque" — cria novo item OU incrementa existente
    private static void adicionarAoEstoque() {
        String nome = JOptionPane.showInputDialog("Nome do item:");
        if (nome == null || nome.trim().isEmpty()) return;

        ItemEstoque existente = buscarPorNome(nome);

        if (existente != null) {
            int qtd = Integer.parseInt(JOptionPane.showInputDialog(
                    "Item já existe. Quantidade a adicionar:"));
            existente.adicionar(qtd);
        } else {
            int qtd = Integer.parseInt(JOptionPane.showInputDialog("Quantidade inicial:"));
            int qtdMin = Integer.parseInt(JOptionPane.showInputDialog("Quantidade mínima:"));
            double preco = Double.parseDouble(JOptionPane.showInputDialog("Preço unitário:"));
            estoque.add(new ItemEstoque(nome, qtd, qtdMin, preco));
            JOptionPane.showMessageDialog(null, "✅ Item '" + nome + "' cadastrado!");
        }
    }

    private static void retirarDoEstoque() {
        String nome = JOptionPane.showInputDialog("Nome do item:");
        ItemEstoque item = buscarPorNome(nome);
        if (item == null) {
            JOptionPane.showMessageDialog(null,
                    "⚠️ Item não encontrado!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        int qtd = Integer.parseInt(JOptionPane.showInputDialog("Quantidade a retirar:"));
        item.retirar(qtd);
    }

    private static void verStatus() {
        String nome = JOptionPane.showInputDialog("Nome do item:");
        ItemEstoque item = buscarPorNome(nome);
        if (item == null) {
            JOptionPane.showMessageDialog(null, "⚠️ Item não encontrado!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        String status = "📦 " + item.getNome() +
                "\nQuantidade: " + item.getQuantidade() +
                "\nMínimo: " + item.getQuantidadeMinima() +
                "\nPreço: R$ " + String.format("%.2f", item.getPreco()) +
                "\nPrecisa reposição? " + (item.precisaReposicao() ? "SIM ⚠️" : "NÃO ✓");
        JOptionPane.showMessageDialog(null, status);
    }

    private static void relatorio() {
        if (estoque.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Estoque vazio!");
            return;
        }

        StringBuilder html = new StringBuilder("<html><h2>📊 Relatório de Estoque</h2>");
        double total = 0;

        for (ItemEstoque item : estoque) {
            html.append(item.statusHtml());
            total += item.valorTotal();
        }

        html.append("<hr><b>Valor total do estoque: R$ ")
                .append(String.format("%.2f", total))
                .append("</b></html>");

        JOptionPane.showMessageDialog(null, html.toString(),
                "Relatório", JOptionPane.INFORMATION_MESSAGE);
    }

    private static ItemEstoque buscarPorNome(String nome) {
        if (nome == null) return null;
        for (ItemEstoque item : estoque) {
            if (item.getNome().equalsIgnoreCase(nome.trim())) return item;
        }
        return null;
    }
}