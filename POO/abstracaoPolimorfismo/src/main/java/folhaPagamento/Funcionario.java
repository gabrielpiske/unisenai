package folhaPagamento;

/**
 * Nível 3 — Exercício 5: Folha de pagamento
 *
 * Pergunta para reflexão:
 * Por que a classe Empresa não precisa ter um cálculo de salário específico para cada tipo de funcionário?
 *
 * Resposta:
 * Graças ao polimorfismo e à abstração! Como todos os funcionários herdam da classe abstrata Funcionario
 * e sobrescrevem o método calcularSalario(), a classe Empresa trabalha apenas com a referência genérica
 * Funcionario. Em tempo de execução (ligação dinâmica / dynamic dispatch), o próprio Java invoca a
 * implementação correta de calcularSalario() de acordo com o objeto real (CLT, Horista ou Comissionado),
 * reduzindo o acoplamento e facilitando a adição de novos tipos de funcionários sem alterar a classe Empresa.
 */
public abstract class Funcionario {
    private String nome;
    private String identificacao;

    public Funcionario() {
    }

    public Funcionario(String nome, String identificacao) {
        this.nome = nome;
        this.identificacao = identificacao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIdentificacao() {
        return identificacao;
    }

    public void setIdentificacao(String identificacao) {
        this.identificacao = identificacao;
    }

    public abstract double calcularSalario();

    public String getCategoria() {
        return this.getClass().getSimpleName();
    }

    @Override
    public String toString() {
        return String.format("%s [ID: %s | Categoria: %s | Salário: R$ %.2f]",
                nome, identificacao, getCategoria(), calcularSalario());
    }
}
