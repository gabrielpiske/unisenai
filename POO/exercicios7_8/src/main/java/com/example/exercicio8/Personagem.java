package com.example.exercicio8;

public abstract class Personagem {

    protected String nome;
    protected int pontosVida;
    protected int forca;
    protected int defesa;

    public Personagem(String nome, int pontosVida, int forca, int defesa) {
        this.nome = nome;
        this.pontosVida = pontosVida;
        this.forca = forca;
        this.defesa = defesa;
    }

    public abstract void atacar(Personagem alvo);

    public void receberDano(int dano) {
        int danoFinal = Math.max(1, dano - defesa);

        pontosVida = Math.max(0, pontosVida - danoFinal);

        System.out.println(nome + " recebeu " + danoFinal + " de dano.");
        System.out.println("Vida restante: " + pontosVida);
    }

    public boolean estaVivo() {
        return pontosVida > 0;
    }

    public String getNome() {
        return nome;
    }
}
