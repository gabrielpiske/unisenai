package sistemaBancario;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Banco {
    private String nome;
    private final List<ContaBancaria> contas;

    public Banco(String nome) {
        this.nome = nome;
        this.contas = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void adicionarConta(ContaBancaria conta) {
        if (conta != null) {
            contas.add(conta);
        }
    }

    public List<ContaBancaria> getContas() {
        return Collections.unmodifiableList(contas);
    }

    public double calcularTotalRecursos() {
        double total = 0.0;
        for (ContaBancaria conta : contas) {
            total += conta.getSaldo();
        }
        return total;
    }

    /**
     * Apresenta os saldos, os rendimentos calculados e o total de recursos das contas cadastradas.
     */
    public void apresentarResumoContas() {
        System.out.println("\n--- Relatório de Contas Cadastradas — " + nome + " ---");
        for (ContaBancaria conta : contas) {
            System.out.printf("Conta: %-8s | Titular: %-18s | %-36s | Saldo: R$ %9.2f | Rendimento Mensal: R$ %7.2f%n",
                    conta.getNumero(),
                    conta.getTitular(),
                    conta.getTipoConta(),
                    conta.getSaldo(),
                    conta.calcularRendimentoMensal());
        }
        System.out.println("-------------------------------------------------------------------------------------------------------------------------------");
        System.out.printf("Total de Recursos no Banco: R$ %.2f%n", calcularTotalRecursos());
    }
}
