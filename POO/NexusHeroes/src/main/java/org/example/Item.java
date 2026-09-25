package org.example;

/**
 * Classe Item
 * Representa objetos coletáveis no jogo (HeroCoins, etc)
 */
public class Item {
    private String nome;
    private int quantidade;

    /**
     * Construtor do Item
     * @param nome Nome do item (ex: "HeroCoin")
     * @param quantidade Quantidade de itens
     */
    public Item(String nome, int quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    public String getNome() {
        return this.nome;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public void adicionarQuantidade(int valor) {
        this.quantidade += valor;
    }

    public void reduzirQuantidade(int valor) {
        this.quantidade = Math.max(0, this.quantidade - valor);
    }

    @Override
    public String toString() {
        return this.nome + " x" + this.quantidade;
    }
}
