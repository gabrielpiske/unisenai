package folhaPagamento;

public class FuncionarioComissionado extends Funcionario {
    private double valorTotalVendas;
    private double taxaComissao; // Ex.: 0.10 para 10%

    public FuncionarioComissionado() {
    }

    public FuncionarioComissionado(String nome, String identificacao, double valorTotalVendas, double taxaComissao) {
        super(nome, identificacao);
        if (valorTotalVendas < 0 || taxaComissao < 0) {
            throw new IllegalArgumentException("Vendas e taxa de comissão não podem ser negativas.");
        }
        this.valorTotalVendas = valorTotalVendas;
        this.taxaComissao = taxaComissao;
    }

    public double getValorTotalVendas() {
        return valorTotalVendas;
    }

    public void setValorTotalVendas(double valorTotalVendas) {
        if (valorTotalVendas < 0) {
            throw new IllegalArgumentException("Valor total das vendas não pode ser negativo.");
        }
        this.valorTotalVendas = valorTotalVendas;
    }

    public double getTaxaComissao() {
        return taxaComissao;
    }

    public void setTaxaComissao(double taxaComissao) {
        if (taxaComissao < 0) {
            throw new IllegalArgumentException("Taxa de comissão não pode ser negativa.");
        }
        this.taxaComissao = taxaComissao;
    }

    @Override
    public double calcularSalario() {
        return valorTotalVendas * taxaComissao;
    }

    @Override
    public String getCategoria() {
        return "Comissionado";
    }
}
