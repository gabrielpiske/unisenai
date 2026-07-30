package org.example;

import javax.swing.JOptionPane;

public class ConversorTemperatura {
    public static void main(String[] args) {
        String[] conversoes = {"°C → °F", "°C → K", "°F → °C", "°F → K", "K → °C", "K → °F", "Sair"};

        while (true) {
            int opcao = JOptionPane.showOptionDialog(
                    null,
                    "Escolha a conversão desejada:",
                    "Conversor de Temperatura",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    conversoes,
                    conversoes[0]
            );

            if (opcao == 6 || opcao == JOptionPane.CLOSED_OPTION) {
                break;
            }

            String unidadeOrigem = conversoes[opcao].split(" ")[0];

            String input = JOptionPane.showInputDialog(
                    null,
                    "Digite o valor da temperatura em " + unidadeOrigem + ":",
                    "Entrada de Temperatura",
                    JOptionPane.QUESTION_MESSAGE
            );

            if (input == null) {
                continue;
            }

            try {
                double valor = Double.parseDouble(input.replace(',', '.'));

                if (isAbaixoZeroAbsoluto(valor, opcao)) {
                    JOptionPane.showMessageDialog(
                            null,
                            "Temperatura fisicamente impossível!\nO valor informado está abaixo do Zero Absoluto (0 K).",
                            "Aviso - Temperatura Inválida",
                            JOptionPane.WARNING_MESSAGE
                    );
                    continue;
                }

                double resultado = converter(valor, opcao);

                String[] partes = conversoes[opcao].split(" → ");
                String de = partes[0];
                String para = partes[1];

                JOptionPane.showMessageDialog(
                        null,
                        String.format("%.2f %s = %.2f %s", valor, de, resultado, para),
                        "Resultado da Conversão",
                        JOptionPane.INFORMATION_MESSAGE
                );

            } catch (NumberFormatException e) {
                // Tratamento de entradas não numéricas
                JOptionPane.showMessageDialog(
                        null,
                        "Por favor, insira um número válido.",
                        "Erro de Entrada",
                        JOptionPane.ERROR_MESSAGE
                );
            }
        }
    }

    static boolean isAbaixoZeroAbsoluto(double valor, int tipo) {
        switch (tipo) {
            case 0: // °C → °F
            case 1: // °C → K
                return valor < -273.15;
            case 2: // °F → °C
            case 3: // °F → K
                return valor < -459.67;
            case 4: // K → °C
            case 5: // K → °F
                return valor < 0.0;
            default:
                return false;
        }
    }

    static double converter(double valor, int tipo) {
        switch (tipo) {
            case 0: // °C → °F
                return (valor * 9.0 / 5.0) + 32;
            case 1: // °C → K
                return valor + 273.15;
            case 2: // °F → °C
                return (valor - 32) * 5.0 / 9.0;
            case 3: // °F → K
                return (valor - 32) * 5.0 / 9.0 + 273.15;
            case 4: // K → °C
                return valor - 273.15;
            case 5: // K → °F
                return (valor - 273.15) * 9.0 / 5.0 + 32;
            default:
                return 0;
        }
    }
}