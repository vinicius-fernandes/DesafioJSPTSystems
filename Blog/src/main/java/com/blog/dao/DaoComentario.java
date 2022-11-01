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
                com.setDataCriacao(rs.getDate("dataCriacao"));
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
