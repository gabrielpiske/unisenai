package org.example.exceptions;

public class PlanoVencidoException extends AcademiaException{
    public PlanoVencidoException(String nome){
        super("Aluno com plano vencido: " + nome);
    }
}
