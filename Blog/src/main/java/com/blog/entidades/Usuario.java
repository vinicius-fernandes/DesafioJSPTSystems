package com.blog.entidades;

public class Usuario {
    private int id;
    private String login;
    private String senha;
    private int tiposUsuario_id;

    private boolean logado;

    private tiposUsuario tipoUsuario;

    public Usuario (){

    }

    public Usuario(int id, String login, String senha, int tiposUsuario_id, tiposUsuario tipoUsuario) {
        this.id = id;
        this.login = login;
        this.senha = senha;
        this.tiposUsuario_id = tiposUsuario_id;
        this.tipoUsuario = tipoUsuario;
    }

    public boolean isModerador(){
        return this.getTiposUsuario_id() == 1;
    }

    public tiposUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(tiposUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getTiposUsuario_id() {
        return tiposUsuario_id;
    }

    public void setTiposUsuario_id(int tiposUsuario_id) {
        this.tiposUsuario_id = tiposUsuario_id;
    }

    public boolean isLogado() {
        return logado;
    }

    public void setLogado(boolean logado) {
        this.logado = logado;
    }
}
