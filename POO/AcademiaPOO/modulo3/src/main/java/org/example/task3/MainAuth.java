package org.example.task3;

import javax.swing.JOptionPane;

public class MainAuth {
    public static void main(String[] args) {
        String senhaIni = JOptionPane.showInputDialog("Cadastre a senha inicial:");
        if (senhaIni == null) return;

        SistemaAutenticacao sistema;
        try {
            sistema = new SistemaAutenticacao(senhaIni);
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "❌ " + e.getMessage(),
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return;
        }

        String[] opcoes = {"Login", "Redefinir Senha", "Estatísticas", "Sair"};
        int escolha;

        do {
            escolha = JOptionPane.showOptionDialog(null,
                    "Sistema de Autenticação",
                    "Menu",
                    JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,
                    null, opcoes, opcoes[0]);

            switch (escolha) {
                case 0 -> {
                    String s = JOptionPane.showInputDialog("Digite a senha:");
                    if (s != null) sistema.autenticar(s);
                }
                case 1 -> {
                    String atual = JOptionPane.showInputDialog("Senha atual:");
                    String nova = JOptionPane.showInputDialog("Nova senha:");
                    if (atual != null && nova != null)
                        sistema.redefinirSenha(atual, nova);
                }
                case 2 -> JOptionPane.showMessageDialog(null, sistema.estatisticas());
                case 3 -> JOptionPane.showMessageDialog(null, "Encerrando...");
            }
        } while (escolha != 3 && escolha != -1 &&
                !(escolha == -1));
    }
}