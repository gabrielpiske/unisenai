package org.example.classes;

import org.example.exceptions.AlunoNaoEncontradoException;
import org.example.exceptions.ModalidadeIndisponivelException;
import org.example.exceptions.PlanoVencidoException;

import java.util.HashMap;
import java.util.Map;

public class Academia {
    private Map<String, Aluno> alunos =  new HashMap<>();
    private Map<String, Boolean> modalidades =  new HashMap<>();

    public void cadastraAluno(Aluno aluno){
        alunos.put(aluno.getMatricula(), aluno);
    }
    public void cadastraModalidade(String nome, Boolean modalidade){
        modalidades.put(nome, modalidade);
    }

    public void acessar(String matricula, String modalidade){
        Aluno aluno = alunos.get(matricula);
        if (aluno == null) {
            throw new AlunoNaoEncontradoException(matricula);
        }
        if(!aluno.getPlano()){
            throw new PlanoVencidoException(aluno.getNome());
        }
        Boolean disponivel = modalidades.get(modalidade);
        if(disponivel == null || !disponivel){
            throw new ModalidadeIndisponivelException(modalidade);
        }
    }
}
