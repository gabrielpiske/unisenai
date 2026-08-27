package org.example.classes;

import org.example.exceptions.ClasseException;

public class Classe {

    private String nome;
    private String emoji;
    private String cor;

    public Classe(String nome, String emoji, String cor) throws ClasseException {

        if (nome == null || nome.trim().isEmpty()) {
            throw new ClasseException("O nome da classe não pode ser vazio.");
        }

        if (emoji == null || emoji.trim().isEmpty()) {
            throw new ClasseException("O emoji da classe não pode ser vazio.");
        }

        if (cor == null || cor.trim().isEmpty()) {
            throw new ClasseException("A cor da classe não pode ser vazia.");
        }

        // Validação de cor no formato hexadecimal
        if (!cor.matches("^#[0-9A-Fa-f]{6}$")) {
            throw new ClasseException(
                    "A cor deve estar no formato hexadecimal. Exemplo: #3b82f6"
            );
        }

        this.nome = nome;
        this.emoji = emoji;
        this.cor = cor;
    }

    public String getNome() {
        return nome;
    }

    public String getEmoji() {
        return emoji;
    }

    public String getCor() {
        return cor;
    }
}