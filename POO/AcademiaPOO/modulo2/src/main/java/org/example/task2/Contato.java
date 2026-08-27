package org.example.task2;

public class Contato {
    String nome;
    String telefone;
    String email;

    Contato(String nome, String telefone, String email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }

    String toHtml() {
        return String.format("<b>%s</b> | Tel: %s | Email: %s", nome, telefone, email);
    }

    String toHtmlDetalhado() {
        return String.format(
                "<div style='margin: 10px 0; padding: 10px; border: 1px solid #ddd; border-radius: 5px;'>" +
                        "<strong>Nome:</strong> %s<br>" +
                        "<strong>Telefone:</strong> %s<br>" +
                        "<strong>Email:</strong> %s" +
                        "</div>",
                nome, telefone, email
        );
    }
}
