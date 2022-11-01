package com.blog.dao;

import com.blog.entidades.Usuario;
import com.blog.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {
    public static Usuario getUsuario(int id){
        Usuario usuario = new Usuario();
        Connection con = Conexao.conectar();
        usuario.setId(id);

        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where id = ?");
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                usuario.setLogin(rs.getString("login"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTiposUsuario_id(rs.getInt("TiposUsuario_id"));
            }
            return usuario;
        } catch (SQLException e) {
            return usuario;
        }


    }

    public static boolean existeLogin(String login){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement("select login from usuarios where login=?;");
            stm.setString(1,login);
            ResultSet rs = stm.executeQuery();
                return rs.next();

        } catch (SQLException e) {
            return true;
        }

    }
    public static Usuario Registrar(Usuario usuario){
        Connection con = Conexao.conectar();
        usuario.setLogado(false);
        try {
            PreparedStatement stm = con.prepareStatement("insert into usuarios (login,senha,TiposUsuario_id) values (?,?,2);");
            stm.setString(1,usuario.getLogin());
            stm.setString(2,usuario.getSenha());
            stm.execute();
            return DaoUsuario.Login(usuario);
        } catch (SQLException e) {
            return usuario;
        }


    }

    public static Usuario Login(Usuario usuario){
        Connection con = Conexao.conectar();
        usuario.setLogado(false);
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where login = ? and senha = ?;");
            stm.setString(1,usuario.getLogin());
            stm.setString(2, usuario.getSenha());

            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                usuario.setId(rs.getInt("id"));
                usuario.setTiposUsuario_id(rs.getInt("TiposUsuario_id"));
                usuario.setLogado(true);
            }
            return usuario;
        } catch (SQLException e) {
            return usuario;
        }

    }

}
