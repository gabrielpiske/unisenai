package com.example.exercicio7;

public class Main {

    public static void main(String[] args) {
        CentralEntregas central = new CentralEntregas();

        Pedido p1 = new Pedido(
                1, "Rua A, 100",
                new EntregaMoto(1, 10, 3)
        );

        Pedido p2 = new Pedido(
                2, "Rua B, 200",
                new EntregaCarro(2, 40, 30)
        );

        Pedido p3 = new Pedido(
                3, "Rua C, 300",
                new EntregaCaminhao(3, 100, 500)
        );

        central.adicionarPedido(p1);
        central.adicionarPedido(p2);
        central.adicionarPedido(p3);

        // Exemplo de substituição da modalidade
        p1.substituirEntrega(new EntregaCarro(1, 10, 3));

        central.gerarRelatorio();
    }
}
