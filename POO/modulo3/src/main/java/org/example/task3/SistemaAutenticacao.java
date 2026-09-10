package org.example.task3;

import javax.swing.JOptionPane;

public class SistemaAutenticacao {
    private String senhaHash;
    private boolean bloqueado;
    private int tentativasCorretas;
    private int tentativasErradas;
    private static final int MAX_TENTATIVAS = 3;

    public SistemaAutenticacao(String senhaInicial) {
        if (senhaInicial == null || senhaInicial.isEmpty()) {
            throw new IllegalArgumentException("Senha não pode ser vazia!");
        }
        this.senhaHash = String.valueOf(senhaInicial.hashCode());
        this.bloqueado = false;
    }

    public boolean isBloqueado() { return bloqueado; }

    private String hash(String senha) {
        return String.valueOf(senha.hashCode());
    }

    public boolean autenticar(String senha) {
        if (bloqueado) {
            JOptionPane.showMessageDialog(null,
                    "🚫 Sistema bloqueado",
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return false;
        }

        if (hash(senha).equals(senhaHash)) {
            tentativasCorretas++;
            JOptionPane.showMessageDialog(null,
                    "utenticação bem-sucedida!");
            return true;
        } else {
            tentativasErradas++;
            if (tentativasErradas >= MAX_TENTATIVAS) {
                bloqueado = true;
                JOptionPane.showMessageDialog(null,
                        "Sistema bloqueado após " + MAX_TENTATIVAS + " tentativas!",
                        "Erro", JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null,
                        "Senha incorreta! Tentativas restantes: " +
                                (MAX_TENTATIVAS - tentativasErradas),
                        "Erro", JOptionPane.ERROR_MESSAGE);
            }
            return false;
        }
    }

    public boolean redefinirSenha(String senhaAtual, String novaSenha) {
        if (bloqueado) {
            JOptionPane.showMessageDialog(null,
                    "Sistema bloqueado",
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (!hash(senhaAtual).equals(senhaHash)) {
            tentativasErradas++;
            if (tentativasErradas >= MAX_TENTATIVAS) bloqueado = true;
            JOptionPane.showMessageDialog(null,
                    "Senha atual incorreta!",
                    "Erro", JOptionPane.ERROR_MESSAGE);
            return false;
        }
        if (novaSenha == null || novaSenha.isEmpty()) {
            JOptionPane.showMessageDialog(null,
                    "⚠️ Nova senha inválida!",
                    "Aviso", JOptionPane.WARNING_MESSAGE);
            return false;
        }
        this.senhaHash = hash(novaSenha);
        JOptionPane.showMessageDialog(null, "Senha redefinida com sucesso!");
        return true;
    }

    public String estatisticas() {
        return "📊 Estatísticas do Sistema" +
                "\nTentativas corretas: " + tentativasCorretas +
                "\nTentativas erradas: " + tentativasErradas +
                "\nStatus: " + (bloqueado ? "BLOQUEADO" : "Ativo");
    }
}