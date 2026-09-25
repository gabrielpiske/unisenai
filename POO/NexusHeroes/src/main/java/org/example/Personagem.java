package org.example;

import org.example.exeptions.AtaqueRecebidoException;

/**
 * Classe Abstrata Personagem
 * Superclasse que define o comportamento comum de todos os heróis
 * Implements: Encapsulamento com atributos protegidos, invariantes de HP/Mana
 */

public abstract class Personagem {
    // Atributos protegidos - visíveis nas subclasses
    protected String nome;
    protected int hp;
    protected int hpMax;
    protected int mana;
    protected int manaMax;
    protected int atk;
    protected int nivel;
    protected int experiencia;
    protected java.util.ArrayList<Item> inventario;

    /**
     * Construtor padrão da classe Personagem
     * Inicializa nome e cria inventário vazio
     * @param nome Nome do personagem
     */
    public Personagem(String nome) {
        this.nome = nome;
        this.inventario = new java.util.ArrayList<>();
        this.nivel = 1;
        this.experiencia = 0;
        System.out.println("INSTANCIAÇÃO");
        System.out.println("> Objeto Personagem criado na memória.");
    }

    /**
     * Setter para HP com invariante de validação
     * Garante: 0 <= hp <= hpMax
     * @param valor Novo valor de HP
     */
    protected void setVida(int valor) {
        int novoHp = Math.max(0, Math.min(valor, this.hpMax));
        this.hp = novoHp;
        System.out.println("INVARIANTE");
        System.out.println("> setVida(" + this.hp + ") chamado. Math.min(hp+" +
                (valor - this.hp) + ", " + this.hpMax + ").");
    }

    /**
     * Setter para Mana com invariante de validação
     * Garante: 0 <= mana <= manaMax
     * @param valor Novo valor de Mana
     */
    protected void setMana(int valor) {
        int novoMana = Math.max(0, Math.min(valor, this.manaMax));
        this.mana = novoMana;
        System.out.println("INVARIANTE");
        System.out.println("> setMana(" + this.mana + ") chamado. Math.min(mana+" +
                (valor - this.mana) + ", " + this.manaMax + ").");
    }

    /**
     * Getter para HP
     */
    public int getHp() {
        return this.hp;
    }

    /**
     * Getter para Mana
     */
    public int getMana() {
        return this.mana;
    }

    /**
     * Getter para ATK
     */
    public int getAtk() {
        return this.atk;
    }

    /**
     * Getter para Nível
     */
    public int getNivel() {
        return this.nivel;
    }

    /**
     * Getter para Nome
     */
    public String getNome() {
        return this.nome;
    }

    /**
     * Getter para Experiência
     */
    public int getExperiencia() {
        return this.experiencia;
    }

    /**
     * Adiciona experiência ao personagem
     * @param xp Quantidade de experiência a adicionar
     */
    public void adicionarExperiencia(int xp) {
        this.experiencia += xp;
        System.out.println("INFO");
        System.out.println("> " + this.nome + " ganhou " + xp + " de experiência.");
    }

    /**
     * Método abstrato para calcular dano
     * Deve ser implementado nas subclasses (Guerreiro, Mago)
     */
    public abstract void atacar(Inimigo inimigo);

    /**
     * Método para receber dano de um inimigo
     * Valida HP e pode lançar exceções
     */
    public void receberDano(int dano) throws AtaqueRecebidoException {
        setVida(this.hp - dano);

        if (this.hp <= 0) {
            throw new AtaqueRecebidoException("Personagem derrotado!");
        }
    }

    /**
     * Método para subir de nível
     * Restaura HP e Mana ao máximo
     */
    public void subirNivel() {
        this.nivel++;
        this.atk += 5;
        this.hp = this.hpMax;
        this.mana = this.manaMax;
        System.out.println("INVARIANTE");
        System.out.println("> subirNivel() chamado. HP e Mana restaurados ao novo máximo. ATK aumentado. Nível "
                + this.nivel + ".");
    }

    /**
     * Método para adicionar item ao inventário
     */
    public void adicionarItem(Item item) {
        this.inventario.add(item);
        System.out.println("INSTANCIAÇÃO");
        System.out.println("> new Item(\"" + item.getNome() + "\", " + item.getQuantidade() +
                ") instanciado. Adicionado ao inventário de " + this.nome + ".");
    }

    /**
     * Método para exibir status do personagem
     */
    @Override
    public String toString() {
        return this.nome + " [Nível " + this.nivel + ", HP: " + this.hp + "/" +
                this.hpMax + ", Mana: " + this.mana + "/" + this.manaMax + ", ATK: " + this.atk + "]";
    }
}