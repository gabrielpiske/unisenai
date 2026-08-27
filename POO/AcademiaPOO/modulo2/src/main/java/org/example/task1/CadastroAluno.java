package org.example.task1;

import javax.swing.JOptionPane;

public class CadastroAluno {
    public static void main(String[] args) {
        try {
            // Coletando dados via showInputDialog
            String nome = JOptionPane.showInputDialog("Digite o nome do aluno:");
            if (nome == null || nome.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Nome não pode ser vazio!");
                return;
            }

            String matricula = JOptionPane.showInputDialog("Digite a matrícula do aluno:");
            if (matricula == null || matricula.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Matrícula não pode ser vazia!");
                return;
            }

            String nota1Str = JOptionPane.showInputDialog("Digite a primeira nota do aluno (0 a 10):");
            if (nota1Str == null) {
                JOptionPane.showMessageDialog(null, "Operação cancelada!");
                return;
            }

            String nota2Str = JOptionPane.showInputDialog("Digite a segunda nota do aluno (0 a 10):");
            if (nota2Str == null) {
                JOptionPane.showMessageDialog(null, "Operação cancelada!");
                return;
            }

            // Convertendo notas para double
            double nota1 = Double.parseDouble(nota1Str);
            double nota2 = Double.parseDouble(nota2Str);

            // Validando notas
            if (nota1 < 0 || nota1 > 10 || nota2 < 0 || nota2 > 10) {
                JOptionPane.showMessageDialog(null, "As notas devem estar entre 0 e 10!");
                return;
            }

            // Criando objeto Aluno
            Aluno aluno = new Aluno(nome, matricula, nota1, nota2);

            // Exibindo ficha via showMessageDialog
            JOptionPane.showMessageDialog(null, aluno.fichaHtml(), "Ficha do Aluno", JOptionPane.INFORMATION_MESSAGE);

        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, "Erro: Digite valores numéricos válidos para as notas!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro inesperado: " + e.getMessage());
        }
    }
}