package folhaPagamento;

public class FuncionarioHorista extends Funcionario {
    private double valorHora;
    private double horasTrabalhadas;

    public FuncionarioHorista() {
    }

    public FuncionarioHorista(String nome, String identificacao, double valorHora, double horasTrabalhadas) {
        super(nome, identificacao);
        if (valorHora < 0 || horasTrabalhadas < 0) {
            throw new IllegalArgumentException("Valor da hora e horas trabalhadas não podem ser negativos.");
        }
        this.valorHora = valorHora;
        this.horasTrabalhadas = horasTrabalhadas;
    }

    public double getValorHora() {
        return valorHora;
    }

    public void setValorHora(double valorHora) {
        if (valorHora < 0) {
            throw new IllegalArgumentException("Valor da hora não pode ser negativo.");
        }
        this.valorHora = valorHora;
    }

    public double getHorasTrabalhadas() {
        return horasTrabalhadas;
    }

    public void setHorasTrabalhadas(double horasTrabalhadas) {
        if (horasTrabalhadas < 0) {
            throw new IllegalArgumentException("Horas trabalhadas não podem ser negativas.");
        }
        this.horasTrabalhadas = horasTrabalhadas;
    }

    @Override
    public double calcularSalario() {
        return valorHora * horasTrabalhadas;
    }

    @Override
    public String getCategoria() {
        return "Horista";
    }
}
