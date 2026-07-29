package org.example;

import javax.swing.JOptionPane;

public class CalculadoraGUI {
    public static void main(String[] args) {
        String[] opcoes = {"Somar (+)", "Subtrair (-)", "Multiplicar (*)", "Dividir (/)", "Sair"};

        while (true) {
            int operacao = JOptionPane.showOptionDialog(
                    null,
                    "Escolha uma operação matemática:",
                    "Calculadora HTML",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    opcoes,
                    opcoes[0]
            );

            // Fecha o programa se clicar em "Sair" ou fechar a janela
            if (operacao == 4 || operacao == JOptionPane.CLOSED_OPTION) {
                break;
            }

            try {
                String num1Str = JOptionPane.showInputDialog("Digite o primeiro número:");
                if (num1Str == null) continue; // Volta para o menu se cancelar
                double n1 = Double.parseDouble(num1Str.trim().replace(',', '.'));

                String num2Str = JOptionPane.showInputDialog("Digite o segundo número:");
                if (num2Str == null) continue; // Volta para o menu se cancelar
                double n2 = Double.parseDouble(num2Str.trim().replace(',', '.'));

                double resultado = calcular(n1, n2, operacao);
                String sinalOp = obterSinal(operacao);

                // HTML com número azul e operação em negrito
                String mensagemHtml = "<html><body style='font-family: Arial, sans-serif; font-size: 14px;'>"
                        + "O resultado de <span style='color: blue;'>" + n1 + "</span> "
                        + "<b>" + sinalOp + "</b> "
                        + "<span style='color: blue;'>" + n2 + "</span> é igual a: "
                        + "<br><br><div style='text-align: center; font-size: 18px; color: blue;'><b>" + resultado + "</b></div>"
                        + "</body></html>";

                JOptionPane.showMessageDialog(null, mensagemHtml, "Resultado", JOptionPane.INFORMATION_MESSAGE);

            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "<html><b style='color: red;'>Erro:</b> Digite apenas números válidos.</html>", "Erro de Entrada", JOptionPane.ERROR_MESSAGE);
            } catch (ArithmeticException e) {
                JOptionPane.showMessageDialog(null, "<html><b style='color: red;'>Erro:</b> " + e.getMessage() + "</html>", "Erro de Cálculo", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private static double calcular(double a, double b, int op) {
        switch (op) {
            case 0: return a + b;
            case 1: return a - b;
            case 2: return a * b;
            case 3:
                if (b == 0) {
                    throw new ArithmeticException("Divisão por zero não é permitida!");
                }
                return a / b;
            default:
                throw new IllegalArgumentException("Operação inválida.");
        }
    }

    private static String obterSinal(int op) {
        switch (op) {
            case 0: return "+";
            case 1: return "-";
            case 2: return "*";
            case 3: return "/";
            default: return "";
        }
    }
}