package org.example;

import org.example.exeptions.AtaqueRecebidoException;

/**
 * Classe Guerreiro
 * Subclasse de Personagem com combate físico baseado em arma
 * Implements: Herança, @Override, encapsulamento
 */

public class Guerreiro extends Personagem {
    private int forcaEspada = 25;

    /**
     * Construtor do Guerreiro
     * Chama super(nome) e inicializa atributos específicos
     * @param nome Nome do personagem
     */
    public Guerreiro(String nome) {
        super(nome);  // Chama construtor da superclasse Personagem

        // Inicializa valores específicos do Guerreiro
        this.hp = 100;
        this.hpMax = 100;
        this.mana = 50;
        this.manaMax = 50;
        this.atk = 25;

        System.out.println("INSTANCIAÇÃO");
        System.out.println("> new Guerreiro(\"" + nome + "\") instanciado. Objeto Personagem criado na memória.");
    }

    /**
     * Método sobrescrito: atacarComEspada
     * Calcula dano conforme o ATK (varia com nível)
     * @param inimigo Inimigo que será atacado
     * @return Dano causado
     */
    public int atacarComEspada(Inimigo inimigo) {
        int dano = this.atk;  // Dano igual ao ATK (25, 30, 35...)

        inimigo.receberDano(dano);

        System.out.println("OVERRIDE");
        System.out.println("> @Override " + this.nome + ".atacarComEspada(inimigo) → dano " +
                dano + ". Inimigo HP: " + inimigo.getHp() + ".");

        return dano;
    }

    /**
     * Método implementado: atacar
     * Implementação do método abstrato da superclasse
     */
    @Override
    public void atacar(Inimigo inimigo) {
        atacarComEspada(inimigo);
    }

    /**
     * Método sobrescrito: subirNivel
     * Restaura HP e Mana, aumenta ATK
     */
    @Override
    public void subirNivel() {
        this.nivel++;
        this.atk += 5;  // Guerreiro aumenta ATK com nível
        this.hpMax += 35;  // Aumenta HP máximo também
        this.manaMax += 10;  // Aumenta Mana máxima

        setVida(this.hpMax);  // Restaura ao novo máximo
        setMana(this.manaMax);

        System.out.println("INVARIANTE");
        System.out.println("> subirNivel() chamado. HP e Mana restaurados ao novo máximo. ATK aumentado. Nível "
                + this.nivel + ".");
    }

    /**
     * Método sobrescrito: receberDano
     * Guerreiro recebe dano de um inimigo
     */
    @Override
    public void receberDano(int dano) throws AtaqueRecebidoException {
        setVida(this.hp - dano);

        System.out.println("EXCEÇÃO");
        System.out.println("> AtaqueRecebidoException! Inimigo contra-atacou. −" + dano +
                " HP. setVida() validou: hp >= 0.");

        if (this.hp <= 0) {
            throw new AtaqueRecebidoException("Guerreiro " + this.nome + " foi derrotado!");
        }
    }

    /**
     * Getter para Força da Espada
     */
    public int getForcaEspada() {
        return this.forcaEspada;
    }

    /**
     * Getter para Experiência
     */
    @Override
    public int getExperiencia() {
        return this.experiencia;
    }

    /**
     * Adiciona experiência ao personagem
     */
    @Override
    public void adicionarExperiencia(int xp) {
        this.experiencia += xp;
        System.out.println("INFO");
        System.out.println("> Guerreiro " + this.nome + " ganhou " + xp + " de experiência.");
    }

    /**
     * Método toString
     */
    @Override
    public String toString() {
        return "Guerreiro " + super.toString() + " (Força da Espada: " + this.forcaEspada + ", XP: " + this.experiencia + ")";
    }
}