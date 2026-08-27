package org.example;

public class ContaPoupanca {
    private String titular;
    private double saldo;
    private double taxaRendimentoMensal;

    public ContaPoupanca(String titular, double taxaRendimentoMensal) {
        this.titular = titular;
        if (taxaRendimentoMensal > 0 && taxaRendimentoMensal < 100) {
            this.taxaRendimentoMensal = taxaRendimentoMensal;
        } else {
            return;
        }
    }
    public void depositar(double valorDepositar) {
        if (valorDepositar > 0) {
            this.saldo += valorDepositar;
        } else {
            throw new IllegalArgumentException();
        }
    }

    public void sacar(double valorSacar) {
        if(valorSacar > 0 && valorSacar < saldo){
            this.saldo -= valorSacar;
        } else  {
            throw new IllegalArgumentException();
        }
    }

    public void aplicarRendimento(){
        double rendimento = this.saldo * (this.taxaRendimentoMensal/100);
        this.saldo += rendimento;
        System.out.println("Rendimento: " + rendimento);
    }

    public void extrato(){
        System.out.println("\nExtrato: " + this.saldo);
        System.out.println("Taxa de Rendimento: " + this.taxaRendimentoMensal);
        System.out.println("Titular: " + this.titular);
    }

    public double getSaldo() {
        return saldo;
    }
}
