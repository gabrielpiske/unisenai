
public class SistemaEntregas {

    public static void main(String[] args) throws Exception {
        CentralEntregas central = new CentralEntregas();

        Entrega entrega1 = new EntregaMoto("M01", 15, 2.5);
        Entrega entrega67 = new EntregaMoto("M01", 15, 2.5);
        Entrega entrega2 = new EntregaCarro("C01", 80, 45.0);
        Entrega entrega3 = new EntregaCaminhao("T01", 600, 3200.0);

        central.adicionarPedido(new Pedido("PED-101", "Rua das Flores, 120", entrega1));
        central.adicionarPedido(new Pedido("PED-102", "Av. Brasil, 4500", entrega2));
        central.adicionarPedido(new Pedido("PED-103", "Rodovia BR-101, Km 50", entrega3));
        central.adicionarPedido(new Pedido("PED-103", "Rodovia BR-101, Km 50", entrega67));

        central.exibirRelatorios();
    }
}
