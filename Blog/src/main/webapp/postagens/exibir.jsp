<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entidades.Postagem" %>
<%@page import="com.blog.entidades.Usuario" %>
<%@page import="com.blog.entidades.Comentario" %>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.dao.DaoComentario" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.List" %>

<%

if(request.getParameter("id")==null || request.getParameter("id").isEmpty()){
    response.sendRedirect("../index.jsp");
}

Postagem post = DaoPostagem.getPostagem(Integer.parseInt(request.getParameter("id")));
List<Comentario> comentarios = DaoComentario.getComentariosPost(Integer.parseInt(request.getParameter("id")));

%>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg=light">
 <jsp:include page="/Layout/navbar.jsp" />


 <div class="container">
 <h1 class="text-center"><% out.write(post.getTitulo()); %> </h1>
 <p> <% out.write(post.getCorpo());%></p>
 <small> <%
 if(post.getDataCriacao()!=null){
 out.write(""+DateFormat.getDateInstance().format(post.getDataCriacao()));
 }
 %>
 </small>
 <small> Publicado por: <%
 if(post.getUsuarioCriador() != null){
    out.write(post.getUsuarioCriador().getLogin()) ;
 }
 %> </small>

 <h4 class="mt-3">Comentários</h4>

 <%
 for(Comentario com: comentarios){
    out.write("<div class='card col-6 m-3'>");
        out.write("<div class='card-body'>");

             out.write("<p class='card-text'>"+com.getCorpo()+" </p>");

        out.write("</div>");
        out.write("<div class='card-footer text-muted text-center'>");
        if(com.getDataCriacao()!=null){
        out.write(""+DateFormat.getDateInstance().format(com.getDataCriacao()));
        }
        if(com.getUsuario()!=null){
        out.write(" | Publicado por: "+com.getUsuario().getLogin());
        }
        out.write("</div>");
     out.write("</div>");

 }
 %>

 </div>

</body>

</html>
