package sistemaPagamento;

public class PagamentoPix extends Pagamento {
    private static final double TAXA_DESCONTO = 0.05; // 5% de desconto

    @Override
    public double calcularValorFinal(double valor) {
        validarValor(valor);
        return valor - (valor * TAXA_DESCONTO);
    }

    @Override
    public String getModalidade() {
        return "Pix (5% de desconto)";
    }
}
