package org.example.task4;

import javax.swing.JOptionPane;
import java.util.ArrayList;

public class MiniBanco {
    static ArrayList<Conta> contas = new ArrayList<>();
    static Conta contaAtual = null;

    public static void main(String[] args) {
        String[] menuPrincipal = {"Abrir Conta", "Selecionar Conta", "Listar Contas", "Sair"};

        while (true) {
            int escolha = JOptionPane.showOptionDialog(
                    null,
                    "🏦 MiniBanco\n\n" +
                            "Total de contas: " + contas.size() + "\n" +
                            "Conta selecionada: " + (contaAtual != null ?
                            contaAtual.getNumero() + " - " + contaAtual.getTitular() : "Nenhuma") + "\n\n" +
                            "Escolha uma opção:",
                    "MiniBanco - Sistema Bancário",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.INFORMATION_MESSAGE,
                    null,
                    menuPrincipal,
                    menuPrincipal[0]
            );

            switch (escolha) {
                case 0:
                    abrirConta();
                    break;
                case 1:
                    selecionarConta();
                    break;
                case 2:
                    listarContas();
                    break;
                case 3:
                    JOptionPane.showMessageDialog(null, "👋 Saindo do MiniBanco... Até logo!");
                    return;
                default:
                    JOptionPane.showMessageDialog(null, "Opção inválida!");
                    break;
            }
        }
    }

    static void abrirConta() {
        try {
            // Captura o titular
            String titular = JOptionPane.showInputDialog("Digite o nome do titular:");
            if (titular == null) return;

            titular = titular.trim();
            if (titular.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Titular não pode ser vazio!");
                return;
            }

            // Seleciona o tipo de conta
            String[] tipos = {"Corrente", "Poupança"};
            int tipoIndex = JOptionPane.showOptionDialog(
                    null,
                    "Selecione o tipo de conta:",
                    "Tipo de Conta",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    tipos,
                    tipos[0]
            );

            if (tipoIndex == -1) return;
            String tipo = tipos[tipoIndex];

            // Captura o saldo inicial
            String saldoStr = JOptionPane.showInputDialog("Digite o saldo inicial (R$):");
            if (saldoStr == null) return;

            double saldoInicial = Double.parseDouble(saldoStr.trim());
            if (saldoInicial < 0) {
                JOptionPane.showMessageDialog(null, "Saldo inicial não pode ser negativo!");
                return;
            }

            // Cria a conta
            Conta novaConta = new Conta(titular, tipo, saldoInicial);
            contas.add(novaConta);

            JOptionPane.showMessageDialog(null,
                    "✅ Conta criada com sucesso!\n\n" +
                            "Número: " + novaConta.getNumero() + "\n" +
                            "Titular: " + titular + "\n" +
                            "Tipo: " + tipo + "\n" +
                            "Saldo inicial: R$ " + String.format("%.2f", saldoInicial),
                    "Conta Criada",
                    JOptionPane.INFORMATION_MESSAGE
            );

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um valor numérico válido para o saldo!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao abrir conta: " + e.getMessage());
        }
    }

    static void selecionarConta() {
        if (contas.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Nenhuma conta cadastrada! Abra uma conta primeiro.");
            return;
        }

        // Cria lista de contas para seleção
        String[] opcoes = new String[contas.size()];
        for (int i = 0; i < contas.size(); i++) {
            Conta c = contas.get(i);
            opcoes[i] = String.format("%s - %s (R$ %.2f)", c.getNumero(), c.getTitular(), c.getSaldo());
        }

        int escolha = JOptionPane.showOptionDialog(
                null,
                "Selecione uma conta para operar:",
                "Selecionar Conta",
                JOptionPane.DEFAULT_OPTION,
                JOptionPane.QUESTION_MESSAGE,
                null,
                opcoes,
                opcoes[0]
        );

        if (escolha == -1) return;

        contaAtual = contas.get(escolha);

        JOptionPane.showMessageDialog(null,
                "✅ Conta selecionada!\n\n" +
                        "Conta: " + contaAtual.getNumero() + "\n" +
                        "Titular: " + contaAtual.getTitular() + "\n" +
                        "Tipo: " + contaAtual.getTipo() + "\n" +
                        "Saldo: R$ " + String.format("%.2f", contaAtual.getSaldo()),
                "Conta Selecionada",
                JOptionPane.INFORMATION_MESSAGE
        );

        // Menu de operações da conta
        operarConta();
    }

    static void operarConta() {
        if (contaAtual == null) {
            JOptionPane.showMessageDialog(null, "Nenhuma conta selecionada!");
            return;
        }

        String[] menuConta = {"Depositar", "Sacar", "Transferir", "Render Juros", "Extrato", "Voltar"};

        while (true) {
            int escolha = JOptionPane.showOptionDialog(
                    null,
                    "💳 Conta: " + contaAtual.getNumero() + "\n" +
                            "Titular: " + contaAtual.getTitular() + "\n" +
                            "Tipo: " + contaAtual.getTipo() + "\n" +
                            "Saldo: R$ " + String.format("%.2f", contaAtual.getSaldo()) + "\n\n" +
                            "Escolha uma operação:",
                    "Operações da Conta",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.INFORMATION_MESSAGE,
                    null,
                    menuConta,
                    menuConta[0]
            );

            switch (escolha) {
                case 0:
                    depositar();
                    break;
                case 1:
                    sacar();
                    break;
                case 2:
                    transferir();
                    break;
                case 3:
                    renderJuros();
                    break;
                case 4:
                    extrato();
                    break;
                case 5:
                    return;
                default:
                    JOptionPane.showMessageDialog(null, "Opção inválida!");
                    break;
            }
        }
    }

    static void depositar() {
        try {
            String valorStr = JOptionPane.showInputDialog("Digite o valor para depósito (R$):");
            if (valorStr == null) return;

            double valor = Double.parseDouble(valorStr.trim());
            contaAtual.depositar(valor);

            JOptionPane.showMessageDialog(null,
                    "💰 Depósito realizado com sucesso!\n\n" +
                            "Valor: R$ " + String.format("%.2f", valor) + "\n" +
                            "Novo saldo: R$ " + String.format("%.2f", contaAtual.getSaldo()),
                    "Depósito Efetuado",
                    JOptionPane.INFORMATION_MESSAGE
            );

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um valor numérico válido!");
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao depositar: " + e.getMessage());
        }
    }

    static void sacar() {
        try {
            String valorStr = JOptionPane.showInputDialog(
                    "Digite o valor para saque (R$):\n" +
                            "Saldo disponível: R$ " + String.format("%.2f", contaAtual.getSaldo())
            );
            if (valorStr == null) return;

            double valor = Double.parseDouble(valorStr.trim());

            if (contaAtual.sacar(valor)) {
                JOptionPane.showMessageDialog(null,
                        "🏦 Saque realizado com sucesso!\n\n" +
                                "Valor: R$ " + String.format("%.2f", valor) + "\n" +
                                "Novo saldo: R$ " + String.format("%.2f", contaAtual.getSaldo()),
                        "Saque Efetuado",
                        JOptionPane.INFORMATION_MESSAGE
                );
            } else {
                JOptionPane.showMessageDialog(null,
                        "❌ Saque não realizado!\n\n" +
                                "Saldo insuficiente!\n" +
                                "Saldo atual: R$ " + String.format("%.2f", contaAtual.getSaldo()) + "\n" +
                                "Valor solicitado: R$ " + String.format("%.2f", valor),
                        "Saldo Insuficiente",
                        JOptionPane.ERROR_MESSAGE
                );
            }

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um valor numérico válido!");
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao sacar: " + e.getMessage());
        }
    }

    static void transferir() {
        try {
            if (contas.size() < 2) {
                JOptionPane.showMessageDialog(null, "É necessário ter pelo menos 2 contas para transferir!");
                return;
            }

            // Seleciona conta destino
            String[] opcoes = new String[contas.size() - 1];
            int idx = 0;
            for (int i = 0; i < contas.size(); i++) {
                if (contas.get(i) != contaAtual) {
                    Conta c = contas.get(i);
                    opcoes[idx++] = String.format("%s - %s (R$ %.2f)", c.getNumero(), c.getTitular(), c.getSaldo());
                }
            }

            int escolha = JOptionPane.showOptionDialog(
                    null,
                    "Selecione a conta destino:\n" +
                            "Saldo disponível: R$ " + String.format("%.2f", contaAtual.getSaldo()),
                    "Transferência - Conta Destino",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    opcoes,
                    opcoes[0]
            );

            if (escolha == -1) return;

            // Encontra a conta destino
            Conta destino = null;
            int count = 0;
            for (int i = 0; i < contas.size(); i++) {
                if (contas.get(i) != contaAtual) {
                    if (count == escolha) {
                        destino = contas.get(i);
                        break;
                    }
                    count++;
                }
            }

            if (destino == null) {
                JOptionPane.showMessageDialog(null, "Erro ao selecionar conta destino!");
                return;
            }

            String valorStr = JOptionPane.showInputDialog(
                    "Digite o valor para transferência (R$):\n" +
                            "Saldo disponível: R$ " + String.format("%.2f", contaAtual.getSaldo()) + "\n" +
                            "Conta destino: " + destino.getNumero() + " - " + destino.getTitular()
            );
            if (valorStr == null) return;

            double valor = Double.parseDouble(valorStr.trim());

            if (contaAtual.transferir(destino, valor)) {
                JOptionPane.showMessageDialog(null,
                        "🔄 Transferência realizada com sucesso!\n\n" +
                                "Valor: R$ " + String.format("%.2f", valor) + "\n" +
                                "De: " + contaAtual.getNumero() + " - " + contaAtual.getTitular() + "\n" +
                                "Para: " + destino.getNumero() + " - " + destino.getTitular() + "\n" +
                                "Novo saldo: R$ " + String.format("%.2f", contaAtual.getSaldo()),
                        "Transferência Efetuada",
                        JOptionPane.INFORMATION_MESSAGE
                );
            } else {
                JOptionPane.showMessageDialog(null,
                        "❌ Transferência não realizada!\n\n" +
                                "Saldo insuficiente!\n" +
                                "Saldo atual: R$ " + String.format("%.2f", contaAtual.getSaldo()) + "\n" +
                                "Valor solicitado: R$ " + String.format("%.2f", valor),
                        "Saldo Insuficiente",
                        JOptionPane.ERROR_MESSAGE
                );
            }

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um valor numérico válido!");
        } catch (IllegalArgumentException e) {
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao transferir: " + e.getMessage());
        }
    }

    static void renderJuros() {
        try {
            if (contaAtual.getTipo().equals("Poupança")) {
                double saldoAntes = contaAtual.getSaldo();
                contaAtual.renderJuros();

                JOptionPane.showMessageDialog(null,
                        "📈 Rendimento aplicado com sucesso!\n\n" +
                                "Saldo antes: R$ " + String.format("%.2f", saldoAntes) + "\n" +
                                "Saldo depois: R$ " + String.format("%.2f", contaAtual.getSaldo()) + "\n" +
                                "Rendimento: R$ " + String.format("%.2f", contaAtual.getSaldo() - saldoAntes) + "\n" +
                                "Taxa: 0.5% ao mês",
                        "Rendimento Aplicado",
                        JOptionPane.INFORMATION_MESSAGE
                );
            } else {
                JOptionPane.showMessageDialog(null,
                        "⚠️ Apenas contas poupança podem render juros!\n" +
                                "Conta atual: " + contaAtual.getTipo(),
                        "Operação Inválida",
                        JOptionPane.WARNING_MESSAGE
                );
            }

        } catch (IllegalStateException e) {
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao aplicar juros: " + e.getMessage());
        }
    }

    static void extrato() {
        if (contaAtual == null) {
            JOptionPane.showMessageDialog(null, "Nenhuma conta selecionada!");
            return;
        }

        String extrato = contaAtual.extratoHtml();
        JOptionPane.showMessageDialog(null, extrato, "Extrato Bancário", JOptionPane.INFORMATION_MESSAGE);
    }

    static void listarContas() {
        if (contas.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Nenhuma conta cadastrada!");
            return;
        }

        StringBuilder html = new StringBuilder();
        html.append("<html><head><style>");
        html.append("body { font-family: Arial, sans-serif; }");
        html.append(".container { max-width: 500px; margin: 0 auto; }");
        html.append(".header { text-align: center; margin-bottom: 20px; }");
        html.append(".conta { margin: 10px 0; padding: 10px; border: 1px solid #3498db; border-radius: 5px; background-color: #ecf0f1; }");
        html.append(".conta:hover { background-color: #d5dbdb; }");
        html.append(".numero { font-weight: bold; color: #2c3e50; }");
        html.append(".tipo { display: inline-block; padding: 2px 10px; border-radius: 3px; font-size: 12px; }");
        html.append(".corrente { background-color: #3498db; color: white; }");
        html.append(".poupanca { background-color: #2ecc71; color: white; }");
        html.append(".saldo { color: #27ae60; font-weight: bold; }");
        html.append(".total { margin-top: 20px; text-align: center; padding: 10px; background-color: #2c3e50; color: white; border-radius: 5px; }");
        html.append("</style></head><body><div class='container'>");
        html.append("<div class='header'>");
        html.append("<h2>🏦 Lista de Contas</h2>");
        html.append("<p>Total: <strong>").append(contas.size()).append("</strong> contas</p>");
        html.append("<hr>");
        html.append("</div>");

        for (int i = 0; i < contas.size(); i++) {
            Conta c = contas.get(i);
            String classeTipo = c.getTipo().toLowerCase();

            html.append("<div class='conta'>");
            html.append("<div class='numero'>").append(i + 1).append(". ").append(c.getNumero());
            html.append(" <span class='tipo ").append(classeTipo).append("'>").append(c.getTipo()).append("</span>");
            html.append("</div>");
            html.append("<div>👤 ").append(c.getTitular()).append("</div>");
            html.append("<div class='saldo'>💰 R$ ").append(String.format("%.2f", c.getSaldo())).append("</div>");
            html.append("</div>");
        }

        // Resumo
        html.append("<div class='total'>");
        html.append("Total de contas: ").append(contas.size());
        html.append("</div>");

        html.append("</div></body></html>");

        JOptionPane.showMessageDialog(null, html.toString(), "Lista de Contas", JOptionPane.INFORMATION_MESSAGE);
    }
}