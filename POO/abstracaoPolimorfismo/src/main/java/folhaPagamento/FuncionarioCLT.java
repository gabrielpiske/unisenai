package folhaPagamento;

public class FuncionarioCLT extends Funcionario {
    private double salarioBase;
    private double comissao;

    public FuncionarioCLT() {
    }

    public FuncionarioCLT(String nome, String identificacao, double salarioBase, double comissao) {
        super(nome, identificacao);
        if (salarioBase < 0 || comissao < 0) {
            throw new IllegalArgumentException("Salário-base e comissão não podem ser negativos.");
        }
        this.salarioBase = salarioBase;
        this.comissao = comissao;
    }

    public double getSalarioBase() {
        return salarioBase;
    }

    public void setSalarioBase(double salarioBase) {
        if (salarioBase < 0) {
            throw new IllegalArgumentException("Salário-base não pode ser negativo.");
        }
        this.salarioBase = salarioBase;
    }

    public double getComissao() {
        return comissao;
    }

    public void setComissao(double comissao) {
        if (comissao < 0) {
            throw new IllegalArgumentException("Comissão não pode ser negativa.");
        }
        this.comissao = comissao;
    }

    @Override
    public double calcularSalario() {
        return salarioBase + comissao;
    }

    @Override
    public String getCategoria() {
        return "CLT";
    }
}
