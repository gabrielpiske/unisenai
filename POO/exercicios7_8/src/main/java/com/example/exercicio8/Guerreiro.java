package com.example.exercicio8;

public class Guerreiro extends Personagem {
 public Guerreiro(String nome) {
        super(nome, 120, 20, 10);
    }

    @Override
    public void atacar(Personagem alvo) {
        int dano = forca + 5;

        System.out.println(nome + " realizou um ataque físico!");

        alvo.receberDano(dano);
    }
    
}
