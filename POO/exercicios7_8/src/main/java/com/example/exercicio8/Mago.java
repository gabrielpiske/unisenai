package com.example.exercicio8;

public class Mago extends Personagem {
    private int mana = 30;

    public Mago(String nome) {
        super(nome, 80, 15, 5);
    }

    @Override
    public void atacar(Personagem alvo) {

        if (mana >= 10) {
            mana -= 10;

            System.out.println(nome + " lançou uma magia!");
            System.out.println("Mana restante: " + mana);

            alvo.receberDano(forca + 15);
        } else {
            System.out.println(nome + " está sem mana! Ataque básico.");

            alvo.receberDano(forca);
        }
    }
}
