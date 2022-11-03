package com.blog.dao;

import com.blog.entidades.Postagem;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPostagem {

    public static List<Postagem> ultimosPosts(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from postagens order by dataCriacao desc limit 10;");
           ResultSet rs =  stm.executeQuery();
           while(rs.next()){
               Postagem post = new Postagem();
               post.setId(rs.getInt("id"));
               post.setUsuarioCriador_id(rs.getInt("UsuarioCriador_id"));
               post.setUsuarioCriador(DaoUsuario.getUsuario(rs.getInt("UsuarioCriador_id")));
               post.setTitulo(rs.getString("titulo"));
               post.setCorpo(rs.getString("corpo"));
               post.setDataCriacao(rs.getTimestamp("dataCriacao"));
               lista.add(post);
           }
        } catch (SQLException e) {
            return lista;
        }


        return lista;
    }

    public static int getTotalPosts(){
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement("select count(*) as total from postagens");
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("total");
            }
            return 0;
        } catch (SQLException e) {
            return 0;
        }
    }

    public static List<Postagem> getPosts(int pagina){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from postagens order by id desc limit 10 offset ? ;");
            int limit = 10;
            int offset = limit *pagina;


            stm.setInt(1,offset);
            ResultSet rs =  stm.executeQuery();
            while(rs.next()){
                Postagem post = new Postagem();
                post.setId(rs.getInt("id"));
                post.setUsuarioCriador_id(rs.getInt("UsuarioCriador_id"));
                post.setUsuarioCriador(DaoUsuario.getUsuario(rs.getInt("UsuarioCriador_id")));
                post.setTitulo(rs.getString("titulo"));
                post.setCorpo(rs.getString("corpo"));
                post.setDataCriacao(rs.getTimestamp("dataCriacao"));
                lista.add(post);
            }
        } catch (SQLException e) {
            return lista;
        }


        return lista;
    }

    public static List<Postagem> getPosts(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from postagens order by id desc ;");
            ResultSet rs =  stm.executeQuery();
            while(rs.next()){
                Postagem post = new Postagem();
                post.setId(rs.getInt("id"));
                post.setUsuarioCriador_id(rs.getInt("UsuarioCriador_id"));
                post.setUsuarioCriador(DaoUsuario.getUsuario(rs.getInt("UsuarioCriador_id")));
                post.setTitulo(rs.getString("titulo"));
                post.setCorpo(rs.getString("corpo"));
                post.setDataCriacao(rs.getTimestamp("dataCriacao"));
                lista.add(post);
            }
        } catch (SQLException e) {
            return lista;
        }


        return lista;
    }
    public static Postagem getPostagem(int id){
        Postagem post = new Postagem();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select * from postagens where id=?;");
            stm.setInt(1,id);
            ResultSet rs =  stm.executeQuery();
            if(rs.next()){
                post.setId(rs.getInt("id"));
                post.setUsuarioCriador_id(rs.getInt("UsuarioCriador_id"));
                post.setUsuarioCriador(DaoUsuario.getUsuario(rs.getInt("UsuarioCriador_id")));
                post.setTitulo(rs.getString("titulo"));
                post.setCorpo(rs.getString("corpo"));
                post.setDataCriacao(rs.getTimestamp("dataCriacao"));
                return post;
            }
        } catch (SQLException e) {
            return post;
        }


        return post;
    }

    public static boolean criar(Postagem post){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("insert into postagens (titulo,corpo,UsuarioCriador_id) values (?,?,?);");
            stm.setString(1,post.getTitulo());
            stm.setString(2,post.getCorpo());
            stm.setInt(3,post.getUsuarioCriador_id());
           stm.execute();
           return true;
        } catch (SQLException e) {
            return false;
        }

    }

    public static boolean editar(Postagem post){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("update postagens set titulo =?, corpo =? where id =?;");
            stm.setString(1,post.getTitulo());
            stm.setString(2,post.getCorpo());
            stm.setInt(3,post.getId());
            stm.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }

    }

    public static boolean excluir(int id){
        Connection con = Conexao.conectar();
        try {
            if(DaoComentario.deleteComentariosPost(id)) {
                PreparedStatement stm = con.prepareStatement("delete from postagens where id=?;");
                stm.setInt(1, id);
                stm.execute();
                return true;
            }
            return false;
        } catch (SQLException e) {
            return false;
        }
    }

}
