public class Pedido {

    private String codigo;
    private String enderecoDestino;
    private Entrega entrega;

    public Pedido(String codigo, String enderecoDestino, Entrega entrega) {
        this.codigo = codigo;
        this.enderecoDestino = enderecoDestino;
        this.entrega = entrega;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getEnderecoDestino() {
        return enderecoDestino;
    }

    public Entrega getEntrega() {
        return entrega;
    }

    public double getCustoEntrega() {
        return entrega.calcularCusto();
    }

    public int getPrazoEntrega() {
        return entrega.calcularPrazo();
    }

}
