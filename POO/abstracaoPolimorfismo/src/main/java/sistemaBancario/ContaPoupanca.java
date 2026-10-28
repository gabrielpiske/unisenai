package sistemaBancario;

public class ContaPoupanca extends ContaBancaria {
    private double taxaRendimentoMensal; // Ex.: 0.006 para 0,6% ao mês

    public ContaPoupanca(String numero, String titular, double saldoInicial, double taxaRendimentoMensal) {
        super(numero, titular, saldoInicial);
        if (taxaRendimentoMensal < 0) {
            throw new IllegalArgumentException("A taxa mensal de rendimento da poupança não pode ser negativa.");
        }
        this.taxaRendimentoMensal = taxaRendimentoMensal;
    }

    public double getTaxaRendimentoMensal() {
        return taxaRendimentoMensal;
    }

    public void setTaxaRendimentoMensal(double taxaRendimentoMensal) {
        if (taxaRendimentoMensal < 0) {
            throw new IllegalArgumentException("A taxa mensal de rendimento não pode ser negativa.");
        }
        this.taxaRendimentoMensal = taxaRendimentoMensal;
    }

    /**
     * Calcula o rendimento mensal a partir da taxa configurável aplicada sobre o saldo atual.
     */
    @Override
    public double calcularRendimentoMensal() {
        return getSaldo() * taxaRendimentoMensal;
    }

    /**
     * Aplica (deposita) o rendimento mensal calculado na própria conta poupança.
     */
    public void aplicarRendimentoMensal() {
        double rendimento = calcularRendimentoMensal();
        if (rendimento > 0) {
            depositar(rendimento);
        }
    }

    @Override
    public String getTipoConta() {
        return String.format("Conta Poupança (Taxa: %.2f%%/mês)", taxaRendimentoMensal * 100.0);
    }
}
