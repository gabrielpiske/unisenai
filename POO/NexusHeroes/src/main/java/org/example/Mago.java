package org.example;

import org.example.exeptions.AtaqueRecebidoException;
import org.example.exeptions.ManaInsuficienteException;

/**
 * Classe Mago
 * Subclasse de Personagem com combate mágico que consome mana
 * Implements: Herança, @Override, encapsulamento, exceções customizadas
 */

public class Mago extends Personagem {
    private int forcaMagia = 40;
    private int custoMana = 20;

    /**
     * Construtor do Mago
     * Chama super(nome) e inicializa atributos específicos
     * @param nome Nome do personagem
     */
    public Mago(String nome) {
        super(nome);  // Chama construtor da superclasse Personagem

        // Inicializa valores específicos do Mago
        this.hp = 80;
        this.hpMax = 80;
        this.mana = 100;
        this.manaMax = 120;
        this.atk = 0;  // Mago não usa ATK

        System.out.println("INSTANCIAÇÃO");
        System.out.println("> new Mago(\"" + nome + "\") instanciado. Objeto Personagem criado na memória.");
    }

    /**
     * Método sobrescrito: usarMagia
     * Calcula dano mágico fixo em 40
     * Precisa ter mana >= 20, senão lança exceção
     * @param inimigo Inimigo que será atacado
     * @return Dano causado
     * @throws ManaInsuficienteException Se mana < 20
     */
    public int usarMagia(Inimigo inimigo) throws ManaInsuficienteException {
        // Validação: Precisa ter mana suficiente
        if (this.mana < this.custoMana) {
            System.out.println("EXCEÇÃO");
            System.out.println("> ManaInsuficienteException lançada! usarMagia() requer " +
                    this.custoMana + " de Mana. Atual: " + this.mana + ".");
            throw new ManaInsuficienteException(
                    "Mana insuficiente! Necessário: " + this.custoMana + ", Atual: " + this.mana
            );
        }

        // Consome mana
        int dano = this.forcaMagia;  // Dano sempre 40
        this.mana -= this.custoMana;

        // Ataca inimigo
        inimigo.receberDano(dano);

        System.out.println("OVERRIDE");
        System.out.println("> @Override " + this.nome + ".usarMagia() sobrescreve Personagem.usarMagia(). " +
                "Dano mágico: " + dano + ".");

        return dano;
    }

    /**
     * Método implementado: atacar
     * Implementação do método abstrato da superclasse
     */
    @Override
    public void atacar(Inimigo inimigo) {
        try {
            usarMagia(inimigo);
        } catch (ManaInsuficienteException e) {
            System.out.println("INFO");
            System.out.println("> Mago " + this.nome + " não tem mana suficiente para conjurar magia.");
        }
    }

    /**
     * Método sobrescrito: subirNivel
     * Restaura HP e Mana, aumenta manaMax
     */
    @Override
    public void subirNivel() {
        this.nivel++;
        this.manaMax += 20;  // Mago aumenta Mana máxima com nível
        // Guerreiro aumenta ATK, mas Mago não, então não alteramos atk

        setVida(this.hpMax);  // Restaura ao novo máximo
        setMana(this.manaMax);

        System.out.println("INVARIANTE");
        System.out.println("> subirNivel() chamado. HP e Mana restaurados ao novo máximo. ATK aumentado. Nível "
                + this.nivel + ".");
    }

    /**
     * Método sobrescrito: receberDano
     * Mago recebe dano de um inimigo
     */
    @Override
    public void receberDano(int dano) throws AtaqueRecebidoException {
        setVida(this.hp - dano);

        System.out.println("EXCEÇÃO");
        System.out.println("> AtaqueRecebidoException! Inimigo contra-atacou. −" + dano +
                " HP. setVida() validou: hp >= 0.");

        if (this.hp <= 0) {
            throw new AtaqueRecebidoException("Mago " + this.nome + " foi derrotado!");
        }
    }

    /**
     * Getter para Força da Magia
     */
    public int getForcaMagia() {
        return this.forcaMagia;
    }

    /**
     * Getter para Custo de Mana por magia
     */
    public int getCustoMana() {
        return this.custoMana;
    }

    /**
     * Adiciona experiência ao personagem
     */
    @Override
    public void adicionarExperiencia(int xp) {
        this.experiencia += xp;
        System.out.println("INFO");
        System.out.println("> Mago " + this.nome + " ganhou " + xp + " de experiência.");
    }

    /**
     * Método toString
     */
    @Override
    public String toString() {
        return "Mago " + super.toString() + " (Força da Magia: " + this.forcaMagia + ", Custo Mana: " + this.custoMana + ", XP: " + this.experiencia + ")";
    }
}