package sistemaPagamento;

public class PagamentoCartao extends Pagamento {
    private static final double TAXA_ACRESCIMO = 0.03; // 3% de acréscimo

    @Override
    public double calcularValorFinal(double valor) {
        validarValor(valor);
        return valor + (valor * TAXA_ACRESCIMO);
    }

    @Override
    public String getModalidade() {
        return "Cartão (3% de acréscimo)";
    }
}
