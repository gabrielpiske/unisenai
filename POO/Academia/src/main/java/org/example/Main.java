package org.example;

import org.example.classes.Academia;
import org.example.classes.Aluno;
import org.example.exceptions.AlunoNaoEncontradoException;
import org.example.exceptions.ModalidadeIndisponivelException;
import org.example.exceptions.PlanoVencidoException;

public class Main {
    public static void main(String[] args) {
        Academia academia = new Academia();
        Aluno aluno1 = new Aluno("Celso Silva", "AL1", true);
        Aluno aluno2 = new Aluno("Fulano", "AL2", false);

        academia.cadastraAluno(aluno1);
        academia.cadastraAluno(aluno2);

        academia.cadastraModalidade("Musculação", true);
        academia.cadastraModalidade("Boxe", false);

        testar(academia, "AL1", "Musculação");
        testar(academia, "AL2", "Musculação");
        testar(academia, "AL1", "Boxe");
        testar(academia, "AL3", "Musculação");

    }

    static void testar(Academia academia, String matricula, String modalidade){
        try {
            academia.acessar(matricula, modalidade);
            System.out.println("Acesso não permitido!");
        } catch (AlunoNaoEncontradoException | PlanoVencidoException | ModalidadeIndisponivelException ex) {
            System.out.println(ex.getMessage());
        }
    }
}