package org.example.task3;

public class Veiculo {
    String placa;
    String tipo;
    int horaEntrada;

    Veiculo(String placa, String tipo, int horaEntrada) {
        this.placa = placa;
        this.tipo = tipo;
        this.horaEntrada = horaEntrada;
    }

    double calcularTarifa(int horaSaida) {
        int horas = Math.max(1, horaSaida - horaEntrada); // mínimo 1 hora
        return switch (tipo) {
            case "Carro"    -> 5.00 + horas * 3.00;
            case "Moto"     -> 2.00 + horas * 1.50;
            case "Caminhão" -> 10.00 + horas * 8.00;
            default -> throw new IllegalStateException("Tipo desconhecido: " + tipo);
        };
    }

    String ticketHtml(int horaSaida) {
        int horas = Math.max(1, horaSaida - horaEntrada);
        double tarifaBase = 0;
        double tarifaHora = 0;

        switch (tipo) {
            case "Carro":
                tarifaBase = 5.00;
                tarifaHora = 3.00;
                break;
            case "Moto":
                tarifaBase = 2.00;
                tarifaHora = 1.50;
                break;
            case "Caminhão":
                tarifaBase = 10.00;
                tarifaHora = 8.00;
                break;
        }

        double total = calcularTarifa(horaSaida);

        return String.format(
                "<html><head><style>" +
                        "body { font-family: 'Courier New', monospace; }" +
                        ".ticket { max-width: 350px; margin: 0 auto; padding: 20px; border: 2px solid #333; background-color: #f9f9f9; }" +
                        ".header { text-align: center; border-bottom: 2px dashed #333; padding-bottom: 10px; margin-bottom: 15px; }" +
                        ".header h2 { margin: 0; color: #2c3e50; }" +
                        ".header p { margin: 5px 0; color: #7f8c8d; }" +
                        ".info { margin: 10px 0; }" +
                        ".info table { width: 100%%; }" +
                        ".info td { padding: 5px; }" +
                        ".info .label { font-weight: bold; color: #555; }" +
                        ".info .value { text-align: right; }" +
                        ".detalhes { margin: 15px 0; padding: 10px; background-color: #ecf0f1; border-radius: 5px; }" +
                        ".total { margin-top: 15px; padding-top: 15px; border-top: 2px dashed #333; text-align: center; }" +
                        ".total .valor { font-size: 24px; font-weight: bold; color: #27ae60; }" +
                        ".footer { text-align: center; margin-top: 15px; font-size: 10px; color: #95a5a6; }" +
                        "</style></head><body>" +
                        "<div class='ticket'>" +
                        "<div class='header'>" +
                        "<h2>🎫 COMPROVANTE</h2>" +
                        "<p>Estacionamento Park & Go</p>" +
                        "</div>" +
                        "<div class='info'>" +
                        "<table>" +
                        "<tr><td class='label'>Placa:</td><td class='value'><b>%s</b></td></tr>" +
                        "<tr><td class='label'>Tipo:</td><td class='value'><b>%s</b></td></tr>" +
                        "<tr><td class='label'>Entrada:</td><td class='value'>%dh</td></tr>" +
                        "<tr><td class='label'>Saída:</td><td class='value'>%dh</td></tr>" +
                        "<tr><td class='label'>Permanência:</td><td class='value'><b>%d horas</b></td></tr>" +
                        "</table>" +
                        "</div>" +
                        "<div class='detalhes'>" +
                        "<table>" +
                        "<tr><td class='label'>Tarifa Base:</td><td class='value'>R$ %.2f</td></tr>" +
                        "<tr><td class='label'>Valor por hora:</td><td class='value'>R$ %.2f</td></tr>" +
                        "<tr><td class='label'>Horas cobradas:</td><td class='value'>%d h</td></tr>" +
                        "<tr><td class='label'>Subtotal:</td><td class='value'>R$ %.2f</td></tr>" +
                        "</table>" +
                        "</div>" +
                        "<div class='total'>" +
                        "<p style='margin: 0; font-size: 14px; color: #555;'>VALOR TOTAL</p>" +
                        "<p class='valor'>R$ %.2f</p>" +
                        "</div>" +
                        "<div class='footer'>" +
                        "<p>Obrigado pela preferência! 🚗</p>" +
                        "<p>Horário: %d:%02d</p>" +
                        "</div>" +
                        "</div></body></html>",
                placa, tipo, horaEntrada, horaSaida, horas,
                tarifaBase, tarifaHora, horas, tarifaBase + (horas * tarifaHora),
                total,
                horaSaida, 0
        );
    }
}
