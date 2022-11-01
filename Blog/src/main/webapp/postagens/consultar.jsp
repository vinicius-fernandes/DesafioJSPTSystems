<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.entidades.Postagem" %>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

</body>

<div class="container">
<h1>Postagens</h1>
<a class="btn btn-primary m-1" href="criar.jsp">Nova postagem</a>
<table class="table table-bordered">
<thead>
<tr>
<th>Id</th>
<th>Titulo </th>
<th> Opções </th>
</tr>
</thead>
<tbody>
<%
for(Postagem post : DaoPostagem.getPosts()){
    out.write("<tr>");
    out.write("<td>"+post.getId()+"</td>");
    out.write("<td>"+post.getTitulo()+"</td>");
    out.write("<td><a class='btn btn-primary m-1' href=editar.jsp?id="+post.getId()+">Editar</a><a class='btn btn-danger m-1' href=excluir.jsp?id="+post.getId()+">Deletar</a></td>");


    out.write("</tr>");
}
%>

<tbody>

</table>

</div>

</html>