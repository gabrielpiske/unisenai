package com.example.exercicio7;

import java.util.ArrayList;
import java.util.List;

public class CentralEntregas {

    private List<Pedido> pedidos = new ArrayList<>();

    public void adicionarPedido(Pedido pedido) {
        pedidos.add(pedido);
    }

    public void gerarRelatorio() {
        double total = 0;

        int motos = 0;
        int carros = 0;
        int caminhoes = 0;

        System.out.println("\n===== RELATÓRIO DE ENTREGAS =====");

        for (Pedido pedido : pedidos) {
            pedido.exibirDados();

            Entrega entrega = pedido.getEntrega();

            total += entrega.calcularCusto();

            if (entrega instanceof EntregaMoto) {
                motos++;
            } else if (entrega instanceof EntregaCarro) {
                carros++;
            } else if (entrega instanceof EntregaCaminhao) {
                caminhoes++;
            }
        }

        System.out.printf("Custo total: R$ %.2f%n", total);
        System.out.println("Entregas de moto: " + motos);
        System.out.println("Entregas de carro: " + carros);
        System.out.println("Entregas de caminhão: " + caminhoes);
    }
}
