package org.example.task4;

import java.util.ArrayList;

public class Conta {
    private static int contador = 0;
    private String numero;
    private String titular;
    private double saldo;
    private String tipo;
    private ArrayList<String> historico;

    Conta(String titular, String tipo, double saldoInicial) {
        contador++;
        this.numero = String.format("CC-%04d", contador);
        this.titular = titular;
        this.tipo = tipo;
        this.saldo = saldoInicial;
        this.historico = new ArrayList<>();
        historico.add(String.format("📌 Abertura: R$ %.2f", saldoInicial));
    }

    void depositar(double valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de depósito deve ser positivo!");
        }
        saldo += valor;
        historico.add(String.format("💰 Depósito: +R$ %.2f | Saldo: R$ %.2f", valor, saldo));
    }

    boolean sacar(double valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de saque deve ser positivo!");
        }
        if (valor > saldo) {
            return false;
        }
        saldo -= valor;
        historico.add(String.format("🏦 Saque: -R$ %.2f | Saldo: R$ %.2f", valor, saldo));
        return true;
    }

    boolean transferir(Conta destino, double valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de transferência deve ser positivo!");
        }
        if (valor > saldo) {
            return false;
        }
        // Saca da conta atual
        saldo -= valor;
        historico.add(String.format("🔄 Transferência enviada: -R$ %.2f para %s | Saldo: R$ %.2f",
                valor, destino.getNumero(), saldo));

        // Deposita na conta destino
        destino.saldo += valor;
        destino.historico.add(String.format("🔄 Transferência recebida: +R$ %.2f de %s | Saldo: R$ %.2f",
                valor, this.numero, destino.saldo));

        return true;
    }

    void renderJuros() {
        if (tipo.equals("Poupança")) {
            double juros = saldo * 0.005; // 0.5%
            saldo += juros;
            historico.add(String.format("📈 Rendimento: +R$ %.2f (0.5%%) | Saldo: R$ %.2f", juros, saldo));
        } else {
            throw new IllegalStateException("Apenas contas poupança rendem juros!");
        }
    }

    String extratoHtml() {
        StringBuilder html = new StringBuilder();
        html.append("<html><head><style>");
        html.append("body { font-family: Arial, sans-serif; background-color: #f0f4f8; }");
        html.append(".extrato { max-width: 500px; margin: 0 auto; padding: 20px; background-color: white; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }");
        html.append(".header { text-align: center; border-bottom: 2px solid #3498db; padding-bottom: 15px; margin-bottom: 20px; }");
        html.append(".header h2 { color: #2c3e50; margin: 0; }");
        html.append(".info { background-color: #ecf0f1; padding: 15px; border-radius: 5px; margin-bottom: 20px; }");
        html.append(".info table { width: 100%; }");
        html.append(".info td { padding: 5px; }");
        html.append(".info .label { font-weight: bold; color: #555; }");
        html.append(".info .value { text-align: right; }");
        html.append(".saldo { font-size: 24px; color: #27ae60; font-weight: bold; }");
        html.append(".historico { max-height: 300px; overflow-y: auto; margin: 15px 0; }");
        html.append(".operacao { padding: 8px; margin: 5px 0; background-color: #f8f9fa; border-left: 3px solid #3498db; border-radius: 3px; }");
        html.append(".operacao:hover { background-color: #e9ecef; }");
        html.append(".footer { text-align: center; margin-top: 20px; font-size: 12px; color: #95a5a6; }");
        html.append("</style></head><body><div class='extrato'>");

        html.append("<div class='header'>");
        html.append("<h2>🏦 Extrato Bancário</h2>");
        html.append("</div>");

        html.append("<div class='info'>");
        html.append("<table>");
        html.append("<tr><td class='label'>Conta:</td><td class='value'><b>").append(numero).append("</b></td></tr>");
        html.append("<tr><td class='label'>Titular:</td><td class='value'>").append(titular).append("</td></tr>");
        html.append("<tr><td class='label'>Tipo:</td><td class='value'>").append(tipo).append("</td></tr>");
        html.append("<tr><td class='label'>Saldo Atual:</td><td class='value'><span class='saldo'>R$ ").append(String.format("%.2f", saldo)).append("</span></td></tr>");
        html.append("</table>");
        html.append("</div>");

        html.append("<h3 style='color: #2c3e50;'>📋 Histórico de Operações</h3>");
        html.append("<div class='historico'>");

        if (historico.isEmpty()) {
            html.append("<p style='text-align: center; color: #95a5a6;'>Nenhuma operação realizada</p>");
        } else {
            for (int i = historico.size() - 1; i >= 0; i--) {
                html.append("<div class='operacao'>").append(historico.get(i)).append("</div>");
            }
        }

        html.append("</div>");

        html.append("<div class='footer'>");
        html.append("Total de operações: ").append(historico.size());
        html.append("</div>");

        html.append("</div></body></html>");
        return html.toString();
    }

    String getSumarioHtml() {
        return String.format("<b>%s</b> | %s | Tipo: %s | <b>R$ %.2f</b>",
                numero, titular, tipo, saldo);
    }

    String getNumero() {
        return numero;
    }

    String getTitular() {
        return titular;
    }

    String getTipo() {
        return tipo;
    }

    double getSaldo() {
        return saldo;
    }
}
