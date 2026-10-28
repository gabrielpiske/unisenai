package sistemaPagamento;

public class PagamentoBoleto extends Pagamento {
    private static final double TAXA_DESCONTO = 0.02; // 2% de desconto

    @Override
    public double calcularValorFinal(double valor) {
        validarValor(valor);
        return valor - (valor * TAXA_DESCONTO);
    }

    @Override
    public String getModalidade() {
        return "Boleto (2% de desconto)";
    }
}
