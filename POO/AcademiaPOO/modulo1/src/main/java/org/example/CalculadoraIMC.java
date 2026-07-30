package org.example;

import javax.swing.JOptionPane;

public class CalculadoraIMC {
    public static void main(String[] args) {
        try {
            // 1. Capturar nome
            String nome = JOptionPane.showInputDialog(null, "Digite o seu nome:", "Calculadora de IMC", JOptionPane.QUESTION_MESSAGE);
            if (nome == null || nome.trim().isEmpty()) {
                return;
            }

            // 2. Capturar peso
            String strPeso = JOptionPane.showInputDialog(null, "Digite o seu peso em kg (ex: 70.5):", "Calculadora de IMC", JOptionPane.QUESTION_MESSAGE);
            if (strPeso == null) return;
            double peso = Double.parseDouble(strPeso.replace(',', '.'));

            // 3. Capturar altura
            String strAltura = JOptionPane.showInputDialog(null, "Digite a sua altura em metros (ex: 1.75):", "Calculadora de IMC", JOptionPane.QUESTION_MESSAGE);
            if (strAltura == null) return;
            double altura = Double.parseDouble(strAltura.replace(',', '.'));

            // Validação de valores negativos ou zero
            if (peso <= 0 || altura <= 0) {
                JOptionPane.showMessageDialog(null, "Peso e altura devem ser maiores que zero!", "Entrada Inválida", JOptionPane.WARNING_MESSAGE);
                return;
            }

            double imc = peso / (altura * altura);

            String[] infoCategoria = getCategoria(imc);
            String categoria = infoCategoria[0];
            String corHex = infoCategoria[1];

            String mensagemHtml = String.format(
                    "<html>" +
                            "<h2>Resultado para: %s</h2>" +
                            "IMC: <b>%.1f</b><br>" +
                            "Categoria: <font color='%s'><b>%s</b></font>" +
                            "</html>",
                    nome, imc, corHex, categoria
            );

            JOptionPane.showMessageDialog(null, mensagemHtml, "Resultado do IMC", JOptionPane.INFORMATION_MESSAGE);

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(
                    null,
                    "Por favor, insira apenas valores numéricos válidos para peso e altura.",
                    "Erro de Formato",
                    JOptionPane.ERROR_MESSAGE
            );
        }
    }

    static String[] getCategoria(double imc) {
        if (imc < 18.5) {
            return new String[]{"Abaixo do peso", "#3b82f6"};
        } else if (imc < 25.0) {
            return new String[]{"Peso normal", "#16a34a"};
        } else if (imc < 30.0) {
            return new String[]{"Sobrepeso", "#f97316"};
        } else {
            return new String[]{"Obesidade", "#dc2626"};
        }
    }
}