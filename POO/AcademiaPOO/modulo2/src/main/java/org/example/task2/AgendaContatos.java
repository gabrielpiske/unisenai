package org.example.task2;

import javax.swing.JOptionPane;

public class AgendaContatos {
    static Contato[] contatos = new Contato[50];
    static int numContatos = 0;

    public static void main(String[] args) {
        String[] opcoes = {"Adicionar", "Listar Todos", "Buscar por Nome", "Remover", "Sair"};

        while (true) {
            int escolha = JOptionPane.showOptionDialog(
                    null,
                    "Bem-vindo à Agenda de Contatos!\n\n" +
                            "Total de contatos: " + numContatos + "\n" +
                            "Capacidade: 50 contatos\n\n" +
                            "Escolha uma opção:",
                    "Agenda de Contatos",
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.INFORMATION_MESSAGE,
                    null,
                    opcoes,
                    opcoes[0]
            );

            switch (escolha) {
                case 0:
                    adicionar();
                    break;
                case 1:
                    listar();
                    break;
                case 2:
                    buscar();
                    break;
                case 3:
                    remover();
                    break;
                case 4:
                    JOptionPane.showMessageDialog(null, "Saindo da agenda... Até logo!");
                    return;
                default:
                    JOptionPane.showMessageDialog(null, "Opção inválida!");
                    break;
            }
        }
    }

    static void adicionar() {
        // Verifica se o array está cheio
        if (numContatos >= contatos.length) {
            JOptionPane.showMessageDialog(null, "Agenda cheia! Não é possível adicionar mais contatos.");
            return;
        }

        try {
            // Captura os dados do contato
            String nome = JOptionPane.showInputDialog("Digite o nome do contato:");
            if (nome == null || nome.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Nome não pode ser vazio!");
                return;
            }

            String telefone = JOptionPane.showInputDialog("Digite o telefone do contato:");
            if (telefone == null || telefone.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Telefone não pode ser vazio!");
                return;
            }

            String email = JOptionPane.showInputDialog("Digite o email do contato:");
            if (email == null || email.trim().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Email não pode ser vazio!");
                return;
            }

            // Adiciona o contato
            contatos[numContatos++] = new Contato(nome.trim(), telefone.trim(), email.trim());

            JOptionPane.showMessageDialog(null,
                    "Contato adicionado com sucesso!\n\n" +
                            "Nome: " + nome + "\n" +
                            "Telefone: " + telefone + "\n" +
                            "Email: " + email,
                    "Sucesso",
                    JOptionPane.INFORMATION_MESSAGE
            );

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao adicionar contato: " + e.getMessage());
        }
    }

    static void listar() {
        if (numContatos == 0) {
            JOptionPane.showMessageDialog(null, "A agenda está vazia! Adicione alguns contatos.");
            return;
        }

        StringBuilder html = new StringBuilder();
        html.append("<html><head><style>");
        html.append("body { font-family: Arial, sans-serif; }");
        html.append(".container { max-width: 500px; margin: 0 auto; }");
        html.append(".header { text-align: center; margin-bottom: 20px; }");
        html.append(".contato { margin: 10px 0; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }");
        html.append(".contato:hover { background-color: #f5f5f5; }");
        html.append(".nome { font-weight: bold; color: #2c3e50; }");
        html.append(".info { color: #7f8c8d; }");
        html.append("</style></head><body><div class='container'>");
        html.append("<div class='header'>");
        html.append("<h2>📇 Lista de Contatos</h2>");
        html.append("<p>Total: <strong>").append(numContatos).append("</strong> contatos</p>");
        html.append("<hr>");
        html.append("</div>");

        for (int i = 0; i < numContatos; i++) {
            html.append("<div class='contato'>");
            html.append("<div class='nome'>").append(i + 1).append(". ").append(contatos[i].nome).append("</div>");
            html.append("<div class='info'>📞 ").append(contatos[i].telefone).append("</div>");
            html.append("<div class='info'>✉️ ").append(contatos[i].email).append("</div>");
            html.append("</div>");
        }

        html.append("</div></body></html>");

        JOptionPane.showMessageDialog(null, html.toString(), "Lista de Contatos", JOptionPane.INFORMATION_MESSAGE);
    }

    static void buscar() {
        String termo = JOptionPane.showInputDialog("Digite o nome (ou parte) do contato que deseja buscar:");
        if (termo == null) {
            return; // Usuário cancelou
        }

        if (termo.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "Termo de busca não pode ser vazio!");
            return;
        }

        termo = termo.toLowerCase().trim();
        int encontrados = 0;
        StringBuilder resultados = new StringBuilder();
        resultados.append("<html><head><style>");
        resultados.append("body { font-family: Arial, sans-serif; }");
        resultados.append(".container { max-width: 500px; margin: 0 auto; }");
        resultados.append(".header { text-align: center; margin-bottom: 20px; }");
        resultados.append(".resultado { margin: 10px 0; padding: 10px; border: 1px solid #3498db; border-radius: 5px; background-color: #ecf0f1; }");
        resultados.append(".nome { font-weight: bold; color: #2c3e50; }");
        resultados.append(".info { color: #7f8c8d; }");
        resultados.append("</style></head><body><div class='container'>");
        resultados.append("<div class='header'>");
        resultados.append("<h2>🔍 Resultados da Busca</h2>");
        resultados.append("<p>Buscando por: <strong>'").append(termo).append("'</strong></p>");
        resultados.append("<hr>");
        resultados.append("</div>");

        for (int i = 0; i < numContatos; i++) {
            if (contatos[i].nome.toLowerCase().contains(termo)) {
                encontrados++;
                resultados.append("<div class='resultado'>");
                resultados.append("<div class='nome'>").append(encontrados).append(". ").append(contatos[i].nome).append("</div>");
                resultados.append("<div class='info'>📞 ").append(contatos[i].telefone).append("</div>");
                resultados.append("<div class='info'>✉️ ").append(contatos[i].email).append("</div>");
                resultados.append("</div>");
            }
        }

        if (encontrados == 0) {
            resultados.append("<p style='text-align: center; color: #e74c3c;'>Nenhum contato encontrado com o termo '<strong>").append(termo).append("</strong>'</p>");
        } else {
            resultados.append("<p style='text-align: center; color: #2ecc71;'>Encontrados: <strong>").append(encontrados).append("</strong> contato(s)</p>");
        }

        resultados.append("</div></body></html>");

        JOptionPane.showMessageDialog(null, resultados.toString(), "Resultado da Busca", JOptionPane.INFORMATION_MESSAGE);
    }

    static void remover() {
        if (numContatos == 0) {
            JOptionPane.showMessageDialog(null, "A agenda está vazia! Não há contatos para remover.");
            return;
        }

        String nomeBusca = JOptionPane.showInputDialog("Digite o nome do contato que deseja remover:");
        if (nomeBusca == null) {
            return; // Usuário cancelou
        }

        if (nomeBusca.trim().isEmpty()) {
            JOptionPane.showMessageDialog(null, "Nome não pode ser vazio!");
            return;
        }

        nomeBusca = nomeBusca.trim();
        int posicao = -1;

        // Busca o contato pelo nome exato (case-insensitive)
        for (int i = 0; i < numContatos; i++) {
            if (contatos[i].nome.equalsIgnoreCase(nomeBusca)) {
                posicao = i;
                break;
            }
        }

        if (posicao == -1) {
            // Tenta buscar por parte do nome (para ajudar o usuário)
            StringBuilder sugestoes = new StringBuilder();
            sugestoes.append("Nenhum contato encontrado com o nome exato: '").append(nomeBusca).append("'\n\n");
            sugestoes.append("Contatos disponíveis:\n");
            for (int i = 0; i < numContatos; i++) {
                sugestoes.append("- ").append(contatos[i].nome).append("\n");
            }
            JOptionPane.showMessageDialog(null, sugestoes.toString(), "Contato não encontrado", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Mostra os dados do contato e pede confirmação
        Contato contatoRemover = contatos[posicao];
        int confirmacao = JOptionPane.showConfirmDialog(
                null,
                "Tem certeza que deseja remover este contato?\n\n" +
                        "Nome: " + contatoRemover.nome + "\n" +
                        "Telefone: " + contatoRemover.telefone + "\n" +
                        "Email: " + contatoRemover.email,
                "Confirmar Remoção",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.WARNING_MESSAGE
        );

        if (confirmacao == JOptionPane.YES_OPTION) {
            // Remove o contato (shift-left no array)
            for (int i = posicao; i < numContatos - 1; i++) {
                contatos[i] = contatos[i + 1];
            }
            contatos[numContatos - 1] = null; // Limpa a última posição
            numContatos--;

            JOptionPane.showMessageDialog(null, "Contato removido com sucesso!", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
        } else {
            JOptionPane.showMessageDialog(null, "Remoção cancelada.", "Cancelado", JOptionPane.INFORMATION_MESSAGE);
        }
    }
}