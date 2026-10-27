package org.example;

public class Pessoa {
    String nome;
    int idade;

    public Pessoa() {

    }

    public Pessoa(String pNome, int pIdade) {
        this.nome = pNome;
        this.idade = pIdade;
    }

    public void display() {
        System.out.println(this.nome);
        System.out.println(this.idade);
    }

    public void display(Pessoa p) {
        System.out.println(p.nome);
        System.out.println(p.idade);
    }
}
