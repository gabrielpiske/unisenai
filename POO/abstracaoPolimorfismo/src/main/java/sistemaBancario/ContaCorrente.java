package sistemaBancario;

public class ContaCorrente extends ContaBancaria {
    private double tarifaMensal;

    public ContaCorrente(String numero, String titular, double saldoInicial, double tarifaMensal) {
        super(numero, titular, saldoInicial);
        if (tarifaMensal < 0) {
            throw new IllegalArgumentException("A tarifa mensal da conta corrente não pode ser negativa.");
        }
        this.tarifaMensal = tarifaMensal;
    }

    public double getTarifaMensal() {
        return tarifaMensal;
    }

    public void setTarifaMensal(double tarifaMensal) {
        if (tarifaMensal < 0) {
            throw new IllegalArgumentException("A tarifa mensal não pode ser negativa.");
        }
        this.tarifaMensal = tarifaMensal;
    }

    /**
     * Cobra a tarifa mensal definida no construtor, descontando do saldo se houver recursos suficientes.
     */
    public boolean cobrarTarifaMensal() {
        if (tarifaMensal == 0) {
            return true;
        }
        System.out.printf("[Conta Corrente %s] Cobrando tarifa mensal de R$ %.2f...%n", getNumero(), tarifaMensal);
        return sacar(tarifaMensal);
    }

    /**
     * Conta corrente não gera rendimento positivo (rendimento = R$ 0,00).
     */
    @Override
    public double calcularRendimentoMensal() {
        return 0.0;
    }

    @Override
    public String getTipoConta() {
        return String.format("Conta Corrente (Tarifa: R$ %.2f/mês)", tarifaMensal);
    }
}
