package org.example;

public class Main {
    public static void main(String[] args) {
        Pessoa p1 = new Pessoa("teste", 1);
        Pessoa p2 = new Pessoa();

        // Instância da classe
        p1.nome = "Joao";
        p2.nome = "Maria";
        p2.display(p2);
    }
}
/* Estruturas que modelam um objeto
 *  - Atributos → nome, idade, cor, raca
 *  - Métodos ⇒ correr, comer, chorar
 *
 */