package org.example.exceptions;

public class ModalidadeIndisponivelException extends AcademiaException{
    public ModalidadeIndisponivelException(String nome){
        super("Modalidade Indisponivel: " + nome);
    }
}
