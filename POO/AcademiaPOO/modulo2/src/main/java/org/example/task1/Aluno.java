package org.example.task1;

public class Aluno {
    private String nome;
    private String matricula;
    private double nota1;
    private double nota2;

    Aluno(String nome, String matricula, double nota1, double nota2) {
        this.nome = nome;
        this.matricula = matricula;
        this.nota1 = nota1;
        this.nota2 = nota2;
    }

    double getMedia() {
        return (nota1 + nota2) / 2;
    }

    String getSituacao() {
        double media = getMedia();
        if (media >= 7) {
            return "Aprovado";
        } else if (media >= 5) {
            return "Recuperação";
        } else {
            return "Reprovado";
        }
    }

    String fichaHtml() {
        double media = getMedia();
        String situacao = getSituacao();
        String cor;

        switch (situacao) {
            case "Aprovado":
                cor = "green";
                break;
            case "Recuperação":
                cor = "orange";
                break;
            case "Reprovado":
                cor = "red";
                break;
            default:
                cor = "black";
        }

        return String.format(
                "<html>" +
                        "<h2 style='text-align:center;'>FICHA DO ALUNO</h2>" +
                        "<hr>" +
                        "<p><strong>Nome:</strong> %s</p>" +
                        "<p><strong>Matrícula:</strong> %s</p>" +
                        "<p><strong>Nota 1:</strong> %.1f</p>" +
                        "<p><strong>Nota 2:</strong> %.1f</p>" +
                        "<p><strong>Média:</strong> %.1f</p>" +
                        "<p><strong>Situação:</strong> <span style='color:%s; font-weight:bold;'>%s</span></p>" +
                        "</html>",
                nome, matricula, nota1, nota2, media, cor, situacao
        );
    }
}
