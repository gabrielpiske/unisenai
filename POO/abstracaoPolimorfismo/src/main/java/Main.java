import java.util.Scanner;

/**
 * Classe principal unificada do projeto abstracaoPolimorfismo.
 * Permite executar todos os desafios da lista (Exercícios 3, 4, 5 e 6)
 * de uma só vez ou individualmente através de um menu interativo.
 */
public class Main {

    public static void executarTodosDemonstracao() {
        areaGeometrica.Main.executar();
        System.out.println();
        sistemaPagamento.Main.executarDemonstracao();
        System.out.println();
        folhaPagamento.Main.executar();
        System.out.println();
        sistemaBancario.Main.executar();
    }

    public static void main(String[] args) {
        if (args.length > 0 && args[0].equalsIgnoreCase("--todos")) {
            executarTodosDemonstracao();
            return;
        }

        Scanner scanner = new Scanner(System.in);
        boolean executando = true;

        while (executando) {
            System.out.println("\n==============================================================");
            System.out.println("   LISTA DE EXERCÍCIOS — ABSTRAÇÃO E POLIMORFISMO (POO)");
            System.out.println("==============================================================");
            System.out.println("  3 - Exercício 3: Cálculo de áreas geométricas (Nível 2)");
            System.out.println("  4 - Exercício 4: Sistema de pagamento (Nível 2)");
            System.out.println("  5 - Exercício 5: Folha de pagamento (Nível 3)");
            System.out.println("  6 - Exercício 6: Sistema bancário (Nível 3)");
            System.out.println("  1 - Executar TODOS os exercícios em sequência");
            System.out.println("  0 - Sair");
            System.out.print("Escolha uma opção: ");

            if (!scanner.hasNextLine()) {
                break;
            }
            String entrada = scanner.nextLine().trim();

            switch (entrada) {
                case "3" -> areaGeometrica.Main.executar();
                case "4" -> {
                    sistemaPagamento.Main.executarDemonstracao();
                    sistemaPagamento.Main.executarInterativo(scanner);
                }
                case "5" -> folhaPagamento.Main.executar();
                case "6" -> sistemaBancario.Main.executar();
                case "1" -> {
                    executarTodosDemonstracao();
                    sistemaPagamento.Main.executarInterativo(scanner);
                }
                case "0" -> {
                    System.out.println("Encerrando o programa.");
                    executando = false;
                }
                default -> System.out.println("Opção inválida! Escolha 3, 4, 5, 6, 1 ou 0.");
            }
        }
    }
}
