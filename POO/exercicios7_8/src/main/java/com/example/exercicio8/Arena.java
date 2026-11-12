package com.example.exercicio8;

public class Arena {

    public void iniciarCombate(Personagem p1, Personagem p2) {

        System.out.println("===== INÍCIO DA BATALHA =====");

        int turno = 1;

        while (p1.estaVivo() && p2.estaVivo()) {

            System.out.println("\n===== TURNO " + turno + " =====");

            if (p1.estaVivo()) {
                p1.atacar(p2);
            }

            if (p2.estaVivo()) {
                p2.atacar(p1);
            }

            turno++;
        }

        System.out.println("\n===== FIM DA BATALHA =====");

        if (p1.estaVivo()) {
            System.out.println("Vencedor: " + p1.getNome());
        } else {
            System.out.println("Vencedor: " + p2.getNome());
        }
    }
}
