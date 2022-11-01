<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entidades.Postagem" %>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="java.text.DateFormat" %>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">
<h1>Últimas postagens</h1>
<%

for(Postagem post: DaoPostagem.ultimosPosts()){
    out.write("<div class='card m-3'>");
       out.write("<div class='card-body'>");
          out.write("<h5 class='card-title text-center'>"+post.getTitulo()+"</h5>");
          if(post.getCorpo().length()>15){
          out.write("<p class='card-text'>"+post.getCorpo().substring(0,15)+" ...</p>");
          }
          else{
            out.write("<p class='card-text'>"+post.getCorpo()+" ...</p>");
          }
          out.write("<a href=/postagens/exibir.jsp?id="+post.getId()+" class='btn btn-primary'>Visualizar tudo</a>");
       out.write("</div>");
       out.write("<div class='card-footer text-muted text-center'>");
       out.write(""+DateFormat.getDateInstance().format(post.getDataCriacao()));
       out.write("</div>");
    out.write("</div>");

}

%>
</div>
</body>
</html>
