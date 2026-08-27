package org.example;

import org.example.classes.Classe;
import org.example.classes.Personagem;
import org.example.classes.Reino;
import org.example.exceptions.ClasseException;
import org.example.exceptions.PersonagemException;
import org.example.exceptions.ReinoException;

public class Main {
    public static void main(String[] args) {
        try {

            // Criando um reino
            Reino reino = new Reino(
                    "Valhara",
                    "+3 Ataque",
                    3
            );

            System.out.println("Reino criado: " + reino.getNome());


            // Criando uma classe
            Classe classe = new Classe(
                    "Paladino",
                    "🛡️",
                    "#3b82f6"
            );

            System.out.println("Classe criada: " + classe.getNome());


            // Criando um personagem
            Personagem personagem = new Personagem(
                    "Schaps Men",
                    "paladino",
                    "valhara"
            );

            System.out.println(
                    "Personagem criado: " + personagem.getNome()
            );

            System.out.println(
                    "Nível: " + personagem.getNivel()
            );

            System.out.println(
                    "XP: " + personagem.getXp()
            );


            // Equipando itens
            personagem.equiparArma("Espada Longa");
            personagem.equiparArmadura("Armadura de Aço");
            personagem.equiparAnel("Anel da Força");
            System.out.println("Equipamentos adicionados com sucesso.");

        } catch (ReinoException e) {

            System.out.println("Erro no Reino: " + e.getMessage());

        } catch (ClasseException e) {

            System.out.println("Erro na Classe: " + e.getMessage());

        } catch (PersonagemException e) {

            System.out.println("Erro no Personagem: " + e.getMessage());

        }
    }
}