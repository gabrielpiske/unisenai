package org.example;

public class Inimigo {
    private String nome;
    private int hp;
    private int hpMax;
    private int dano;

    /**
     * Construtor do Inimigo
     * @param nome Nome do inimigo (ex: "Goblin")
     * @param hp Pontos de vida
     * @param dano Dano que causa
     */
    public Inimigo(String nome, int hp, int dano) {
        this.nome = nome;
        this.hp = hp;
        this.hpMax = hp;
        this.dano = dano;
        System.out.println("INSTANCIAÇÃO");
        System.out.println("> new " + nome + " instanciado. HP: " + hp + ", Dano: " + dano + ".");
    }

    public String getNome() {
        return this.nome;
    }

    public int getHp() {
        return this.hp;
    }

    public int getHpMax() {
        return this.hpMax;
    }

    public int getDano() {
        return this.dano;
    }

    /**
     * Recebe dano do personagem
     * @param dano Valor de dano recebido
     */
    public void receberDano(int dano) {
        this.hp = Math.max(0, this.hp - dano);
    }

    /**
     * Verifica se o inimigo foi derrotado
     */
    public boolean estaDerrotado() {
        return this.hp <= 0;
    }

    /**
     * Ataque passivo do inimigo (ameaça passiva)
     */
    public int atacarPassivamente() {
        System.out.println("INFO");
        System.out.println("> AmeaçaPassiva! " + this.nome + " adjacente causou " +
                this.dano + " de dano. setVida() validou: hp >= 0.");
        return this.dano;
    }

    @Override
    public String toString() {
        return this.nome + " [HP: " + this.hp + "/" + this.hpMax + ", Dano: " + this.dano + "]";
    }
}