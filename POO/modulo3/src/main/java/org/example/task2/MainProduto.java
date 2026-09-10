package org.example.task2;

import javax.swing.JOptionPane;

public class MainProduto {
    public static void main(String[] args) {
        Produto produto = null;
        String[] opcoes = {"Novo Produto", "Alterar Preço",
                "Aplicar Desconto", "Ver Ficha", "Sair"};
        int escolha;

        do {
            escolha = JOptionPane.showOptionDialog(null,
                    "Gerenciador de Produto",
                    "CRUD Produto",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,
                    null, opcoes, opcoes[0]);

            try {
                switch (escolha) {
                    case 0 -> {
                        String nome = JOptionPane.showInputDialog("Nome:");
                        double preco = Double.parseDouble(
                                JOptionPane.showInputDialog("Preço:"));
                        double desc = Double.parseDouble(
                                JOptionPane.showInputDialog("Desconto (%):"));
                        produto = new Produto(nome, preco, desc);
                        JOptionPane.showMessageDialog(null, "Produto criado!");
                    }
                    case 1 -> {
                        if (produto == null) { avisoSemProduto(); break; }
                        double p = Double.parseDouble(
                                JOptionPane.showInputDialog("Novo preço:"));
                        produto.setPreco(p);
                    }
                    case 2 -> {
                        if (produto == null) { avisoSemProduto(); break; }
                        double d = Double.parseDouble(
                                JOptionPane.showInputDialog("Desconto (%):"));
                        produto.setDesconto(d);
                    }
                    case 3 -> {
                        if (produto == null) { avisoSemProduto(); break; }
                        JOptionPane.showMessageDialog(null, produto.ficha());
                    }
                    case 4 -> JOptionPane.showMessageDialog(null, "Encerrando...");
                }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Digite apenas números!",
                        "Erro", JOptionPane.ERROR_MESSAGE);
            } catch (IllegalArgumentException e) {
                JOptionPane.showMessageDialog(null, "❌ " + e.getMessage(),
                        "Erro", JOptionPane.ERROR_MESSAGE);
            }
        } while (escolha != 4 && escolha != -1);
    }

    private static void avisoSemProduto() {
        JOptionPane.showMessageDialog(null,
                "⚠️ Nenhum produto cadastrado. Use 'Novo Produto' primeiro.",
                "Aviso", JOptionPane.WARNING_MESSAGE);
    }
}