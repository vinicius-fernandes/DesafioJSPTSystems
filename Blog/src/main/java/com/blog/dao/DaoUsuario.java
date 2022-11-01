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
}
