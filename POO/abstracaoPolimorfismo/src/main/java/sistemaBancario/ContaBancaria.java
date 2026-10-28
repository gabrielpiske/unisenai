package sistemaBancario;

/**
 * Nível 3 — Exercício 6: Sistema bancário
 */
public abstract class ContaBancaria {
    private String numero;
    private String titular;
    private double saldo;

    public ContaBancaria(String numero, String titular, double saldoInicial) {
        if (saldoInicial < 0) {
            throw new IllegalArgumentException("O saldo inicial não pode ser negativo.");
        }
        this.numero = numero;
        this.titular = titular;
        this.saldo = saldoInicial;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public double getSaldo() {
        return saldo;
    }

    /**
     * Regra de negócio: Não permitir depósitos negativos ou iguais a zero.
     */
    public boolean depositar(double valor) {
        if (valor <= 0) {
            System.out.printf("[Conta %s] Depósito recusado: o valor (R$ %.2f) deve ser maior que zero.%n",
                    numero, valor);
            return false;
        }
        this.saldo += valor;
        return true;
    }

    /**
     * Regra de negócio: Não permitir saques negativos/iguais a zero ou superiores ao saldo disponível.
     */
    public boolean sacar(double valor) {
        if (valor <= 0) {
            System.out.printf("[Conta %s] Saque recusado: o valor (R$ %.2f) deve ser maior que zero.%n",
                    numero, valor);
            return false;
        }
        if (valor > this.saldo) {
            System.out.printf("[Conta %s] Saque recusado: saldo insuficiente (Saldo atual: R$ %.2f | Tentativa: R$ %.2f).%n",
                    numero, this.saldo, valor);
            return false;
        }
        this.saldo -= valor;
        return true;
    }

    /**
     * Desafio adicional: Transferência entre contas garantindo consistência de saldos
     * quando não houver recursos suficientes ou os parâmetros forem inválidos.
     */
    public boolean transferir(ContaBancaria destino, double valor) {
        if (destino == null) {
            System.out.printf("[Conta %s] Transferência recusada: conta de destino inválida.%n", numero);
            return false;
        }
        if (destino == this) {
            System.out.printf("[Conta %s] Transferência recusada: a conta de destino não pode ser a própria conta de origem.%n", numero);
            return false;
        }
        if (valor <= 0) {
            System.out.printf("[Conta %s] Transferência recusada: o valor (R$ %.2f) deve ser maior que zero.%n",
                    numero, valor);
            return false;
        }
        if (valor > this.saldo) {
            System.out.printf("[Conta %s -> Conta %s] Transferência de R$ %.2f cancelada: saldo insuficiente na origem (R$ %.2f). Saldos mantidos consistentes!%n",
                    this.numero, destino.numero, valor, this.saldo);
            return false;
        }

        // Operação atômica: debita da origem e só credita no destino se o saque foi concluído
        if (this.sacar(valor)) {
            destino.depositar(valor);
            System.out.printf("[Conta %s -> Conta %s] Transferência de R$ %.2f realizada com sucesso!%n",
                    this.numero, destino.numero, valor);
            return true;
        }
        return false;
    }

    /**
     * Método abstrato: o cálculo do rendimento deve variar conforme o tipo de conta.
     */
    public abstract double calcularRendimentoMensal();

    public abstract String getTipoConta();
}
