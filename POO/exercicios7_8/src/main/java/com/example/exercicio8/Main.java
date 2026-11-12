package com.example.exercicio8;

public class Main {

    public static void main(String[] args) {

        Guerreiro guerreiro = new Guerreiro("Thor");
        Mago mago = new Mago("Merlin");
        Arqueiro arqueiro = new Arqueiro("Legolas");

        Arena arena = new Arena();

        arena.iniciarCombate(guerreiro, mago);

        // arena.iniciarCombate(arqueiro, guerreiro);
    }
}
