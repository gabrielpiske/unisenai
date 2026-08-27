package org.example;

public class Main {
    public static void main(String[] args) {
        ContaPoupanca c1 = new ContaPoupanca("João", 15.5);
        c1.depositar(1000.0);
        c1.depositar(1000.0);

        for(int i = 1; i <= 3; i++){
            c1.aplicarRendimento();
            c1.sacar(100.0);
        }

        c1.extrato();
    }
}