package com.blog.entidades;

import java.util.Date;

public class Postagem {
    private int id;

    private String titulo;
    private String corpo;
    private Date dataCriacao;
    private  int usuarioCriador_id;
    private Usuario usuarioCriador;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCorpo() {
        return corpo;
    }

    public void setCorpo(String corpo) {
        this.corpo = corpo;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public int getUsuarioCriador_id() {
        return usuarioCriador_id;
    }

    public void setUsuarioCriador_id(int usuarioCriador_id) {
        this.usuarioCriador_id = usuarioCriador_id;
    }

    public Usuario getUsuarioCriador() {
        return usuarioCriador;
    }

    public void setUsuarioCriador(Usuario usuarioCriador) {
        this.usuarioCriador = usuarioCriador;
    }
}
