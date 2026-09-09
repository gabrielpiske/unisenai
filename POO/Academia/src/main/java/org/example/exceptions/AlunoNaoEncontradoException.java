package org.example.exceptions;

public class AlunoNaoEncontradoException extends AcademiaException{

    public AlunoNaoEncontradoException(String matricula) {
        super("Aluno não encontrado, matricula: " + matricula);
    }
}
