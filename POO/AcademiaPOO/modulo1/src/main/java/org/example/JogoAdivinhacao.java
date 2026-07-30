package org.example;

 import javax.swing.JOptionPane;

  public class JogoAdivinhacao {
     public static void main(String[] args) {
         boolean jogarNovamente = true;
         while (jogarNovamente) {
             int numero = (int)(Math.random() * 100) + 1;
             int tentativas = 0;
             boolean acertou = false;

             JOptionPane.showMessageDialog(null,                  "Pensei em um número de 1 a 100. Você consegue adivinhar?",
                 "Jogo de Adivinhação", JOptionPane.INFORMATION_MESSAGE);

             while (!acertou) {
                 String input = JOptionPane.showInputDialog(null,                      "Tentativa " + (tentativas + 1) + ": qual é o número?",
                     "Adivinhe!", JOptionPane.QUESTION_MESSAGE);
                 if (input == null) { jogarNovamente = false; break; }

                 try {
                     int guess = Integer.parseInt(input);
                     tentativas++;
                     if      (guess < numero) JOptionPane.showMessageDialog(null, "📉 Muito baixo! Tente maior.", "Dica", JOptionPane.INFORMATION_MESSAGE);
                     else if (guess > numero) JOptionPane.showMessageDialog(null, "📈 Muito alto! Tente menor.", "Dica", JOptionPane.INFORMATION_MESSAGE);
                     else                     acertou = true;
                 } catch (NumberFormatException e) {
                     JOptionPane.showMessageDialog(null, "Digite apenas números inteiros!", "Erro", JOptionPane.ERROR_MESSAGE);
                 }
             }

             if (acertou) {
                 String perf = tentativas <= 3 ? "🏆 Incrível!" : tentativas <= 6 ? "⭐ Muito bom!" : tentativas <= 10 ? "👍 Bom!" : "💪 Continue praticando!";
                 int novo = JOptionPane.showConfirmDialog(null,                      String.format("<html>Você acertou em <b>%d tentativas</b>!<br>%s<br><br>Jogar novamente?</html>", tentativas, perf),
                     "Parabéns!", JOptionPane.YES_NO_OPTION);
                 jogarNovamente = (novo == JOptionPane.YES_OPTION);
             }
         }
     }
 }
