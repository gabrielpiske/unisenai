package com.example.exercicio7;

public class Pedido {
    private int codigo;
    private String endereco;
    private Entrega entrega;

    public Pedido(int codigo, String endereco, Entrega entrega) {
        this.codigo = codigo;
        this.endereco = endereco;
        this.entrega = entrega;
    }

    public Entrega getEntrega() {
        return entrega;
    }

    // Substitui a modalidade de entrega
    public void substituirEntrega(Entrega novaEntrega) {
        this.entrega = novaEntrega;
    }

    public void exibirDados() {
        System.out.println("Pedido: " + codigo);
        System.out.println("Destino: " + endereco);
        System.out.printf("Custo: R$ %.2f%n", entrega.calcularCusto());
        System.out.println("Prazo: " + entrega.calcularPrazo() + " dia(s)");
        System.out.println("--------------------------");
    }
}
