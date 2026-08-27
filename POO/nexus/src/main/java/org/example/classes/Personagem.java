package org.example.classes;

import org.example.exceptions.PersonagemException;

public class Personagem {

    private String reinoId;
    private String classeid;
    private String nome;
    private int nivel;
    private int xp;
    private String arma;
    private String armadura;
    private String anel;

    public Personagem(String nome, String classeid, String reinoId)
            throws PersonagemException {

        if (nome == null || nome.trim().isEmpty()) {
            throw new PersonagemException(
                    "O nome do personagem não pode ser vazio."
            );
        }

        if (classeid == null || classeid.trim().isEmpty()) {
            throw new PersonagemException(
                    "O ID da classe não pode ser vazio."
            );
        }

        if (reinoId == null || reinoId.trim().isEmpty()) {
            throw new PersonagemException(
                    "O ID do reino não pode ser vazio."
            );
        }

        this.nome = nome;
        this.classeid = classeid;
        this.reinoId = reinoId;

        // Valores iniciais
        this.nivel = 1;
        this.xp = 0;
    }

    public String getNome() {
        return nome;
    }

    public int getNivel() {
        return nivel;
    }

    public int getXp() {
        return xp;
    }

    public void equiparArma(String arma) throws PersonagemException {

        if (arma == null || arma.trim().isEmpty()) {
            throw new PersonagemException(
                    "A arma não pode ser vazia."
            );
        }

        this.arma = arma;
    }

    public void equiparArmadura(String armadura) throws PersonagemException {

        if (armadura == null || armadura.trim().isEmpty()) {
            throw new PersonagemException(
                    "A armadura não pode ser vazia."
            );
        }

        this.armadura = armadura;
    }

    public void equiparAnel(String anel) throws PersonagemException {

        if (anel == null || anel.trim().isEmpty()) {
            throw new PersonagemException(
                    "O anel não pode ser vazio."
            );
        }

        this.anel = anel;
    }

    public Personagem getPersonagem() {
        return this;
    }
}