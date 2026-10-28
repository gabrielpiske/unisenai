package sistemaBancario;

public class Main {

    public static void executar() {
        System.out.println("==============================================================");
        System.out.println("   EXERCÍCIO 6 — SISTEMA BANCÁRIO");
        System.out.println("==============================================================");

        Banco banco = new Banco("Banco UniSENAI");

        ContaCorrente cc1 = new ContaCorrente("CC-1001", "Gabriel Souza", 1500.00, 25.00);
        ContaPoupanca cp1 = new ContaPoupanca("CP-2001", "Fernanda Lima", 3000.00, 0.006); // 0,6% ao mês
        ContaPoupanca cp2 = new ContaPoupanca("CP-2002", "Lucas Martins", 5000.00, 0.0075); // 0,75% ao mês

        banco.adicionarConta(cc1);
        banco.adicionarConta(cp1);
        banco.adicionarConta(cp2);

        // Estado inicial das contas
        banco.apresentarResumoContas();

        // Operações de depósito, saque e cobrança de tarifa mensal
        System.out.println("\n--- Operações Bancárias e Cobrança de Tarifa ---");
        cc1.depositar(500.00);
        cc1.cobrarTarifaMensal();
        cp1.sacar(400.00);

        // Testando as regras de negócio (depósito negativo, saque acima do saldo e taxa negativa)
        System.out.println("\n--- Teste das Regras de Negócio (Bloqueios) ---");
        cc1.depositar(-100.00);
        cp1.sacar(10000.00);
        try {
            new ContaPoupanca("CP-9999", "Teste Taxa Negativa", 100.0, -0.01);
        } catch (IllegalArgumentException e) {
            System.out.println("Bloqueio de taxa negativa acionado -> " + e.getMessage());
        }

        // Desafio adicional: transferências entre contas (com e sem saldo suficiente)
        System.out.println("\n--- Desafio Adicional: Transferências entre Contas ---");
        // 1. Transferência válida
        cc1.transferir(cp1, 300.00);

        // 2. Transferência sem saldo suficiente (garantindo que os saldos não fiquem inconsistentes)
        double saldoOrigemAntes = cc1.getSaldo();
        double saldoDestinoAntes = cp2.getSaldo();
        cc1.transferir(cp2, 50000.00);
        System.out.printf("Verificação de consistência após falha -> Saldo %s: R$ %.2f (antes: R$ %.2f) | Saldo %s: R$ %.2f (antes: R$ %.2f)%n",
                cc1.getNumero(), cc1.getSaldo(), saldoOrigemAntes,
                cp2.getNumero(), cp2.getSaldo(), saldoDestinoAntes);

        // Estado final das contas
        banco.apresentarResumoContas();
    }

    public static void main(String[] args) {
        executar();
    }
}
