package folhaPagamento;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Empresa {
    private String nome;
    private final List<Funcionario> funcionarios;

    public Empresa(String nome) {
        this.nome = nome;
        this.funcionarios = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void adicionarFuncionario(Funcionario funcionario) {
        if (funcionario != null) {
            funcionarios.add(funcionario);
        }
    }

    public List<Funcionario> getFuncionarios() {
        return Collections.unmodifiableList(funcionarios);
    }

    /**
     * Percorre a lista usando polimorfismo (sem verificar manualmente o tipo de cada funcionário),
     * apresenta o salário individual e retorna o total da folha de pagamento.
     */
    public double processarFolhaPagamento() {
        System.out.println("\n--- Folha de Pagamento: " + nome + " ---");
        double totalFolha = 0.0;

        for (Funcionario f : funcionarios) {
            double salario = f.calcularSalario(); // Chamada polimórfica
            totalFolha += salario;
            System.out.printf("Funcionário: %-20s | ID: %-8s | Regime: %-12s | Salário: R$ %8.2f%n",
                    f.getNome(), f.getIdentificacao(), f.getCategoria(), salario);
        }

        System.out.println("----------------------------------------------------------------------------");
        System.out.printf("Total da Folha de Pagamento: R$ %.2f%n", totalFolha);
        return totalFolha;
    }

    /**
     * Desafio adicional: calcula a média salarial da empresa.
     */
    public double calcularMediaSalarial() {
        if (funcionarios.isEmpty()) {
            return 0.0;
        }
        double soma = 0.0;
        for (Funcionario f : funcionarios) {
            soma += f.calcularSalario();
        }
        return soma / funcionarios.size();
    }

    /**
     * Desafio adicional: identifica o funcionário com maior remuneração.
     */
    public Funcionario obterFuncionarioMaiorRemuneracao() {
        if (funcionarios.isEmpty()) {
            return null;
        }
        Funcionario maior = funcionarios.get(0);
        for (Funcionario f : funcionarios) {
            if (f.calcularSalario() > maior.calcularSalario()) {
                maior = f;
            }
        }
        return maior;
    }
}
