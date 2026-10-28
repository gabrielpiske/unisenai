package sistemaPagamento;

import java.util.Scanner;

public class Main {

    /**
     * Executa os casos de teste do enunciado (compra de R$ 200,00 e bloqueio de valor <= 0).
     */
    public static void executarDemonstracao() {
        System.out.println("==============================================================");
        System.out.println("   EXERCÍCIO 4 — SISTEMA DE PAGAMENTO");
        System.out.println("==============================================================");

        double valorTeste = 200.00;
        System.out.printf("%n--- Exemplo de Teste do Enunciado (Compra de R$ %.2f) ---%n", valorTeste);

        Pagamento[] modalidades = new Pagamento[]{
                new PagamentoPix(),
                new PagamentoCartao(),
                new PagamentoBoleto()
        };

        for (Pagamento pagamento : modalidades) {
            System.out.println(pagamento.gerarDescricao(valorTeste));
        }

        System.out.println("\n--- Desafio Adicional: Validação contra valores <= 0 ---");
        try {
            Pagamento pagamentoInvalido = new PagamentoPix();
            System.out.println(pagamentoInvalido.gerarDescricao(-50.00));
        } catch (IllegalArgumentException e) {
            System.out.println("Validação acionada com sucesso -> " + e.getMessage());
        }
    }

    /**
     * Solicita ao usuário o valor de uma compra e a modalidade de pagamento via Scanner.
     */
    public static void executarInterativo(Scanner scanner) {
        System.out.println("\n--- Simulação Interativa de Pagamento ---");
        try {
            System.out.print("Digite o valor da compra (R$): ");
            String entradaValor = scanner.nextLine().trim().replace(",", ".");
            double valorCompra = Double.parseDouble(entradaValor);

            System.out.println("Escolha a modalidade de pagamento:");
            System.out.println("  1 - Pix (5% de desconto)");
            System.out.println("  2 - Cartão (3% de acréscimo)");
            System.out.println("  3 - Boleto (2% de desconto)");
            System.out.print("Opção: ");
            int opcao = Integer.parseInt(scanner.nextLine().trim());

            Pagamento pagamento;
            switch (opcao) {
                case 1 -> pagamento = new PagamentoPix();
                case 2 -> pagamento = new PagamentoCartao();
                case 3 -> pagamento = new PagamentoBoleto();
                default -> {
                    System.out.println("Opção inválida! Selecionando Pix por padrão.");
                    pagamento = new PagamentoPix();
                }
            }

            System.out.println("\nResultado do processamento:");
            System.out.println(pagamento.gerarDescricao(valorCompra));
        } catch (NumberFormatException e) {
            System.out.println("Entrada numérica inválida.");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        executarDemonstracao();
        Scanner scanner = new Scanner(System.in);
        executarInterativo(scanner);
    }
}
