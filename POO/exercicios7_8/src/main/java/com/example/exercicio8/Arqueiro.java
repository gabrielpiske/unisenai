package com.example.exercicio8;

import java.util.Random;

public class Arqueiro extends Personagem {

    private Random random = new Random();

    public Arqueiro(String nome) {
        super(nome, 90, 18, 7);
    }

    @Override
    public void atacar(Personagem alvo) {

        int dano = forca;

        if (random.nextInt(100) < 25) {
            dano *= 2;

            System.out.println(nome + " acertou um ataque CRÍTICO!");
        } else {
            System.out.println(nome + " disparou uma flecha!");
        }

        alvo.receberDano(dano);
    }

}
