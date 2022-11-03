package com.blog.dao;

import com.blog.entidades.Comentario;
import com.blog.entidades.Postagem;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoComentario {


    public static boolean deleteComentariosPost(int postId){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("delete from comentarios where Postagens_id=?;");
            stm.setInt(1,postId);
            stm.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }


    }

    public static boolean alterarAprovacao(int id,boolean statusAtual){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("update comentarios set aprovado=?  where id=?;");
            stm.setBoolean(1,!statusAtual);
            stm.setInt(2,id);
            stm.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public static boolean excluir(int id){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("delete from comentarios where id=?;");
            stm.setInt(1,id);
            stm.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }


    }

    public static boolean criar(Comentario comentario){

        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("insert into comentarios (Postagens_id,Usuarios_id,corpo,aprovado) values (?,?,?,0);");
            stm.setInt(1,comentario.getPostagem_id());
            stm.setInt(2,comentario.getUsuario_id());
            stm.setString(3,comentario.getCorpo());
            stm.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }


    }

    public static List<Comentario> getComentariosPost(int postId){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from comentarios where Postagens_id=? and aprovado=1;");
            stm.setInt(1,postId);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Comentario com = new Comentario();
                com.setAprovado(true);
                com.setId(rs.getInt("id"));
                com.setPostagem_id(rs.getInt("Postagens_id"));
                com.setUsuario_id(rs.getInt("Usuarios_id"));
                com.setDataCriacao(rs.getTimestamp("dataCriacao"));
                com.setCorpo(rs.getString("corpo"));
                com.setUsuario(DaoUsuario.getUsuario(rs.getInt("Usuarios_id")));
                lista.add(com);
            }
            return lista;
        } catch (SQLException e) {
            return lista;
        }


    }
    public static Comentario getComentario(int id){
        Comentario com = new Comentario();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from comentarios where id=?;");
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                com.setAprovado(rs.getBoolean("aprovado"));
                com.setId(rs.getInt("id"));
                com.setPostagem_id(rs.getInt("Postagens_id"));
                com.setUsuario_id(rs.getInt("Usuarios_id"));
                com.setDataCriacao(rs.getTimestamp("dataCriacao"));
                com.setCorpo(rs.getString("corpo"));
                com.setUsuario(DaoUsuario.getUsuario(rs.getInt("Usuarios_id")));
            }
            return com;
        } catch (SQLException e) {
            return com;
        }


    }

    public static List<Comentario> getComentarios(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from comentarios ;");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Comentario com = new Comentario();
                com.setAprovado(rs.getBoolean("aprovado"));
                com.setId(rs.getInt("id"));
                com.setPostagem_id(rs.getInt("Postagens_id"));
                com.setUsuario_id(rs.getInt("Usuarios_id"));
                com.setDataCriacao(rs.getTimestamp("dataCriacao"));
                com.setCorpo(rs.getString("corpo"));
                com.setUsuario(DaoUsuario.getUsuario(rs.getInt("Usuarios_id")));
                lista.add(com);
            }
            return lista;
        } catch (SQLException e) {
            return lista;
        }


    }
}
