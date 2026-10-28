package folhaPagamento;

public class Main {

    public static void executar() {
        System.out.println("==============================================================");
        System.out.println("   EXERCÍCIO 5 — FOLHA DE PAGAMENTO");
        System.out.println("==============================================================");

        Empresa empresa = new Empresa("TechSolutions SENAI Ltda.");

        // Adicionando funcionários de diferentes categorias
        empresa.adicionarFuncionario(new FuncionarioCLT("Ana Beatriz", "CLT-101", 4200.00, 650.00));
        empresa.adicionarFuncionario(new FuncionarioHorista("Carlos Eduardo", "HOR-202", 45.00, 160.0));
        empresa.adicionarFuncionario(new FuncionarioComissionado("Mariana Silva", "COM-303", 55000.00, 0.08));

        // 6 e 7. Exibir salários individuais e calcular total da folha usando polimorfismo
        empresa.processarFolhaPagamento();

        // Desafio adicional: média salarial e funcionário com maior remuneração
        System.out.println("\n--- Desafio Adicional: Estatísticas da Folha ---");
        System.out.printf("Média Salarial da Empresa: R$ %.2f%n", empresa.calcularMediaSalarial());

        Funcionario destaque = empresa.obterFuncionarioMaiorRemuneracao();
        if (destaque != null) {
            System.out.printf("Maior Remuneração: %s (%s) com R$ %.2f%n",
                    destaque.getNome(), destaque.getCategoria(), destaque.calcularSalario());
        }

        System.out.println("\n--- Pergunta para reflexão ---");
        System.out.println("P: Por que a classe Empresa não precisa ter um cálculo de salário específico para cada tipo de funcionário?");
        System.out.println("R: Porque através da abstração e do polimorfismo, a classe Empresa interage apenas com o tipo abstrato");
        System.out.println("   'Funcionario' e invoca 'calcularSalario()'. Cada subclasse encapsula sua própria regra de cálculo,");
        System.out.println("   permitindo adicionar novas modalidades de contratação sem modificar o código da classe Empresa.");
    }

    public static void main(String[] args) {
        executar();
    }
}
