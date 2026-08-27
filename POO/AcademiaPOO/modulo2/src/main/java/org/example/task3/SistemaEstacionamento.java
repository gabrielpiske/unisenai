package org.example.task3;

import javax.swing.JOptionPane;
import java.util.ArrayList;
import java.util.stream.Collectors;

public class SistemaEstacionamento {
    static ArrayList<Veiculo> patio = new ArrayList<>();

    public static void main(String[] args) {
        String[] opcoes = {"Registrar Entrada", "Registrar Saída", "Listar Veículos no Pátio", "Sair"};

        while (true) {
            int escolha = JOptionPane.showOptionDialog(
                    null,
                    "🚗 Sistema de Estacionamento\n\n" +
                            "Veículos no pátio: " + patio.size() + "\n" +
                            "Capacidade: Ilimitada\n\n" +
                            "Escolha uma opção:",
                    "Estacionamento Park & Go",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.INFORMATION_MESSAGE,
                    null,
                    opcoes,
                    opcoes[0]
            );

            switch (escolha) {
                case 0:
                    registrarEntrada();
                    break;
                case 1:
                    registrarSaida();
                    break;
                case 2:
                    listarVeiculos();
                    break;
                case 3:
                    JOptionPane.showMessageDialog(null, "Encerrando sistema... Até logo! 👋");
                    return;
                default:
                    JOptionPane.showMessageDialog(null, "Opção inválida!");
                    break;
            }
        }
    }

    static void registrarEntrada() {
        try {
            // Captura a placa
            String placa = JOptionPane.showInputDialog("Digite a placa do veículo:");
            if (placa == null) return;

            placa = placa.trim().toUpperCase();
            if (placa.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Placa não pode ser vazia!");
                return;
            }

            // Verifica se o veículo já está no pátio
            for (Veiculo v : patio) {
                if (v.placa.equalsIgnoreCase(placa)) {
                    JOptionPane.showMessageDialog(null,
                            "Veículo com placa " + placa + " já está estacionado!\n" +
                                    "Entrada: " + v.horaEntrada + "h",
                            "Veículo já registrado",
                            JOptionPane.WARNING_MESSAGE
                    );
                    return;
                }
            }

            // Captura o tipo do veículo
            String[] tipos = {"Carro", "Moto", "Caminhão"};
            int tipoIndex = JOptionPane.showOptionDialog(
                    null,
                    "Selecione o tipo do veículo:",
                    "Tipo de Veículo",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    tipos,
                    tipos[0]
            );

            if (tipoIndex == -1) return; // Cancelou

            String tipo = tipos[tipoIndex];

            // Captura a hora de entrada
            String horaStr = JOptionPane.showInputDialog("Digite a hora de entrada (0-23):");
            if (horaStr == null) return;

            int horaEntrada = Integer.parseInt(horaStr.trim());

            // Valida a hora
            if (horaEntrada < 0 || horaEntrada > 23) {
                JOptionPane.showMessageDialog(null, "Hora inválida! Digite um valor entre 0 e 23.");
                return;
            }

            // Cria e adiciona o veículo
            Veiculo veiculo = new Veiculo(placa, tipo, horaEntrada);
            patio.add(veiculo);

            JOptionPane.showMessageDialog(null,
                    "✅ Entrada registrada com sucesso!\n\n" +
                            "Placa: " + placa + "\n" +
                            "Tipo: " + tipo + "\n" +
                            "Hora de entrada: " + horaEntrada + "h\n" +
                            "Veículos no pátio: " + patio.size(),
                    "Entrada Registrada",
                    JOptionPane.INFORMATION_MESSAGE
            );

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um número válido para a hora!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar entrada: " + e.getMessage());
        }
    }

    static void registrarSaida() {
        if (patio.isEmpty()) {
            JOptionPane.showMessageDialog(null, "O pátio está vazio! Não há veículos para sair.");
            return;
        }

        try {
            // Lista as placas disponíveis
            String listaPlacas = patio.stream()
                    .map(v -> "• " + v.placa + " (" + v.tipo + ") - Entrada: " + v.horaEntrada + "h")
                    .collect(Collectors.joining("\n"));

            String placa = JOptionPane.showInputDialog(
                    "Digite a placa do veículo que está saindo:\n\n" +
                            "Veículos no pátio:\n" + listaPlacas
            );

            if (placa == null) return;

            placa = placa.trim().toUpperCase();
            if (placa.isEmpty()) {
                JOptionPane.showMessageDialog(null, "Placa não pode ser vazia!");
                return;
            }

            // Busca o veículo
            Veiculo veiculoEncontrado = null;
            int index = -1;

            for (int i = 0; i < patio.size(); i++) {
                if (patio.get(i).placa.equalsIgnoreCase(placa)) {
                    veiculoEncontrado = patio.get(i);
                    index = i;
                    break;
                }
            }

            if (veiculoEncontrado == null) {
                JOptionPane.showMessageDialog(null,
                        "❌ Veículo com placa " + placa + " não encontrado no pátio!\n\n" +
                                "Placas disponíveis:\n" + listaPlacas,
                        "Veículo não encontrado",
                        JOptionPane.ERROR_MESSAGE
                );
                return;
            }

            // Captura a hora de saída
            String horaStr = JOptionPane.showInputDialog(
                    "Digite a hora de saída (0-23):\n" +
                            "Entrada: " + veiculoEncontrado.horaEntrada + "h"
            );

            if (horaStr == null) return;

            int horaSaida = Integer.parseInt(horaStr.trim());

            // Valida a hora
            if (horaSaida < 0 || horaSaida > 23) {
                JOptionPane.showMessageDialog(null, "Hora inválida! Digite um valor entre 0 e 23.");
                return;
            }

            if (horaSaida < veiculoEncontrado.horaEntrada) {
                JOptionPane.showMessageDialog(null,
                        "❌ Hora de saída (" + horaSaida + "h) não pode ser anterior à entrada (" +
                                veiculoEncontrado.horaEntrada + "h)!",
                        "Horário inválido",
                        JOptionPane.ERROR_MESSAGE
                );
                return;
            }

            // Gera o ticket
            String ticket = veiculoEncontrado.ticketHtml(horaSaida);

            // Mostra o ticket e confirma a saída
            int confirmacao = JOptionPane.showConfirmDialog(
                    null,
                    ticket,
                    "🎫 Ticket de Saída",
                    JOptionPane.YES_NO_OPTION,
                    JOptionPane.INFORMATION_MESSAGE
            );

            if (confirmacao == JOptionPane.YES_OPTION) {
                // Remove o veículo do pátio
                patio.remove(index);

                JOptionPane.showMessageDialog(null,
                        "🚗 Veículo removido com sucesso!\n\n" +
                                "Placa: " + placa + "\n" +
                                "Total pago: R$ " + String.format("%.2f", veiculoEncontrado.calcularTarifa(horaSaida)) + "\n" +
                                "Veículos restantes: " + patio.size(),
                        "Saída Registrada",
                        JOptionPane.INFORMATION_MESSAGE
                );
            } else {
                JOptionPane.showMessageDialog(null, "Saída cancelada. Veículo permanece no pátio.");
            }

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite um número válido para a hora!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao registrar saída: " + e.getMessage());
        }
    }

    static void listarVeiculos() {
        if (patio.isEmpty()) {
            JOptionPane.showMessageDialog(null, "🅿️ O pátio está vazio!");
            return;
        }

        StringBuilder html = new StringBuilder();
        html.append("<html><head><style>");
        html.append("body { font-family: Arial, sans-serif; }");
        html.append(".container { max-width: 500px; margin: 0 auto; }");
        html.append(".header { text-align: center; margin-bottom: 20px; }");
        html.append(".veiculo { margin: 10px 0; padding: 10px; border: 1px solid #3498db; border-radius: 5px; background-color: #ecf0f1; }");
        html.append(".placa { font-weight: bold; font-size: 16px; color: #2c3e50; }");
        html.append(".tipo { display: inline-block; padding: 2px 10px; border-radius: 3px; font-size: 12px; }");
        html.append(".carro { background-color: #3498db; color: white; }");
        html.append(".moto { background-color: #2ecc71; color: white; }");
        html.append(".caminhao { background-color: #e67e22; color: white; }");
        html.append(".info { color: #7f8c8d; margin-top: 5px; }");
        html.append(".total { margin-top: 20px; text-align: center; padding: 10px; background-color: #2c3e50; color: white; border-radius: 5px; }");
        html.append("</style></head><body><div class='container'>");
        html.append("<div class='header'>");
        html.append("<h2>🅿️ Veículos no Pátio</h2>");
        html.append("<p>Total: <strong>").append(patio.size()).append("</strong> veículos</p>");
        html.append("<hr>");
        html.append("</div>");

        for (int i = 0; i < patio.size(); i++) {
            Veiculo v = patio.get(i);
            String classeTipo = v.tipo.toLowerCase();

            html.append("<div class='veiculo'>");
            html.append("<div class='placa'>").append(i + 1).append(". ").append(v.placa);
            html.append(" <span class='tipo ").append(classeTipo).append("'>").append(v.tipo).append("</span>");
            html.append("</div>");
            html.append("<div class='info'>⏰ Entrada: ").append(v.horaEntrada).append("h</div>");
            html.append("<div class='info'>💰 Tarifa base: R$ ").append(String.format("%.2f",
                    v.tipo.equals("Carro") ? 5.00 :
                            v.tipo.equals("Moto") ? 2.00 : 10.00));
            html.append(" | Hora: R$ ").append(String.format("%.2f",
                    v.tipo.equals("Carro") ? 3.00 :
                            v.tipo.equals("Moto") ? 1.50 : 8.00));
            html.append("</div>");
            html.append("</div>");
        }

        // Resumo
        int carros = 0, motos = 0, caminhoes = 0;
        for (Veiculo v : patio) {
            switch (v.tipo) {
                case "Carro": carros++; break;
                case "Moto": motos++; break;
                case "Caminhão": caminhoes++; break;
            }
        }

        html.append("<div class='total'>");
        html.append("🚗 ").append(carros).append(" carros  |  🏍️ ").append(motos).append(" motos  |  🚛 ").append(caminhoes).append(" caminhões");
        html.append("</div>");

        html.append("</div></body></html>");

        JOptionPane.showMessageDialog(null, html.toString(), "Veículos Estacionados", JOptionPane.INFORMATION_MESSAGE);
    }
}