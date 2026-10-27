package org.example;

public class Pedido {
    private int numero;
    private Cliente cliente;
    private Produto produto;
    private int quantidade;

    public Pedido() {
    }

    public Pedido(int numero, Cliente cliente, Produto produto, int quantidade) {
        this.numero = numero;
        this.cliente = cliente;
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double calcularTotal() {
        if (produto == null) {
            return 0.0;
        }
        return produto.getPreco() * quantidade;
    }

    public void exibirDados() {
        String nomeCliente = (cliente != null) ? cliente.getNome() : "Não informado";
        String nomeProduto = (produto != null) ? produto.getNome() : "Não informado";
        System.out.println("Pedido #" + numero + " | Cliente: " + nomeCliente +
                " | Produto: " + nomeProduto + " | Qtd: " + quantidade +
                " | Total: R$ " + calcularTotal());
    }
}
