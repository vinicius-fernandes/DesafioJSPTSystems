package com.blog.entidades;

import java.util.Date;

public class Comentario {
    private int id;
    private int postagem_id;
    private int usuario_id;
    private Date dataCriacao;
    private boolean aprovado;
    private Postagem postagem;
    private Usuario usuario;

    private String corpo;


    public Comentario(){

    }

    public Comentario(int id, int postagem_id, int usuario_id, Date dataCriacao, boolean aprovado, Postagem postagem, Usuario usuario) {
        this.id = id;
        this.postagem_id = postagem_id;
        this.usuario_id = usuario_id;
        this.dataCriacao = dataCriacao;
        this.aprovado = aprovado;
        this.postagem = postagem;
        this.usuario = usuario;
    }

    public String getCorpo() {
        return corpo;
    }

    public void setCorpo(String corpo) {
        this.corpo = corpo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostagem_id() {
        return postagem_id;
    }

    public void setPostagem_id(int postagem_id) {
        this.postagem_id = postagem_id;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }

    public Postagem getPostagem() {
        return postagem;
    }

    public void setPostagem(Postagem postagem) {
        this.postagem = postagem;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
