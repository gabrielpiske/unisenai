import java.util.ArrayList;
import java.util.List;

public class CentralEntregas {

    private List<Pedido> pedidos = new ArrayList<>();

    public void adicionarPedido(Pedido pedido) {
        pedidos.add(pedido);
    }

    public double calcularCustoTotal() {
        double total = 0;
        for (Pedido p : pedidos) {
            total += p.getCustoEntrega();
        }
        return total;
    }

    public void exibirRelatorios() {
        int qtdMoto = 0, qtdCarro = 0, qtdCaminhao = 0;

        System.out.println("=== RELATÓRIO DE PEDIDOS ===");
        for (Pedido p : pedidos) {
            System.out.printf("Pedido: %s | Destino: %s | Prazo Estimado: %d dia(s) | Custo: R$ %.2f%n",
                    p.getCodigo(), p.getEnderecoDestino(), p.getPrazoEntrega(), p.getCustoEntrega());

            // Contabiliza a quantidade por modalidade
            if (p.getEntrega() instanceof EntregaMoto) {
                qtdMoto++;
            } else if (p.getEntrega() instanceof EntregaCarro) {
                qtdCarro++;
            } else if (p.getEntrega() instanceof EntregaCaminhao) {
                qtdCaminhao++;
            }
        }

        System.out.println("\n=== RESUMO GERAL ===");
        System.out.printf("Custo Total das Entregas: R$ %.2f%n", calcularCustoTotal());
        System.out.println("Quantidade por Modalidade:");
        System.out.println(" - Motos: " + qtdMoto);
        System.out.println(" - Carros: " + qtdCarro);
        System.out.println(" - Caminhões: " + qtdCaminhao);
    }
}
