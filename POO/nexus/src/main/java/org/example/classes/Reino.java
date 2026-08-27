package org.example.classes;

import org.example.exceptions.ReinoException;

public class Reino {

    private String nome;
    private String bonus;
    private int valorBonus;

    public Reino(String nome, String bonus, int valorBonus) throws ReinoException {

        if (nome == null || nome.trim().isEmpty()) {
            throw new ReinoException("O nome do reino não pode ser vazio.");
        }

        if (bonus == null || bonus.trim().isEmpty()) {
            throw new ReinoException("O bônus do reino não pode ser vazio.");
        }

        if (valorBonus < 0) {
            throw new ReinoException("O valor do bônus não pode ser negativo.");
        }

        this.nome = nome;
        this.bonus = bonus;
        this.valorBonus = valorBonus;
    }

    public String getNome() {
        return nome;
    }

    public String getBonus() {
        return bonus;
    }

    public int getValorBonus() {
        return valorBonus;
    }
}