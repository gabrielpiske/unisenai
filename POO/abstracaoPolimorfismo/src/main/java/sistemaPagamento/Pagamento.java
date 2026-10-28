package sistemaPagamento;

/**
 * Nível 2 — Exercício 4: Sistema de pagamento
 */
public abstract class Pagamento {

    /**
     * Valida que o valor da compra não seja negativo ou igual a zero (Desafio Adicional).
     */
    protected void validarValor(double valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Erro: O valor da compra deve ser maior que zero (valor informado: R$ "
                    + String.format("%.2f", valor) + ").");
        }
    }

    /**
     * Calcula o valor final do pagamento conforme a regra da modalidade.
     */
    public abstract double calcularValorFinal(double valor);

    /**
     * Retorna o nome legível da modalidade de pagamento.
     */
    public abstract String getModalidade();

    /**
     * Desafio adicional: gera uma descrição detalhada do pagamento
     * (valor original, desconto ou acréscimo e total final) e impede valores <= 0.
     */
    public String gerarDescricao(double valor) {
        validarValor(valor);

        double valorFinal = calcularValorFinal(valor);
        double diferenca = valorFinal - valor;

        String detalheAjuste;
        if (diferenca < 0) {
            double desconto = Math.abs(diferenca);
            double percentual = (desconto / valor) * 100.0;
            detalheAjuste = String.format("Desconto: R$ %.2f (%.0f%%)", desconto, percentual);
        } else if (diferenca > 0) {
            double acrescimo = diferenca;
            double percentual = (acrescimo / valor) * 100.0;
            detalheAjuste = String.format("Acréscimo: R$ %.2f (%.0f%%)", acrescimo, percentual);
        } else {
            detalheAjuste = "Sem desconto ou acréscimo (R$ 0,00)";
        }

        return String.format(
                "Modalidade: %s | Valor Original: R$ %.2f | %s | Total Final: R$ %.2f",
                getModalidade(), valor, detalheAjuste, valorFinal
        );
    }
}
