package org.example.classes;

public class Aluno {
    private String nome;
    private String matricula;
    private boolean planoAtivo;

    public Aluno(String nome, String matricula, boolean plano) {
        this.nome = nome;
        this.matricula = matricula;
        this.planoAtivo = plano;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPlano(boolean planoAtivo) {
        this.planoAtivo = planoAtivo;
    }

    public boolean getPlano(){
        return planoAtivo;
    }

    public String getMatricula() {
        return matricula;
    }

}
