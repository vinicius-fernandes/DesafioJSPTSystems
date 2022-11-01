<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoComentario" %>
<%@page import="com.blog.entidades.Comentario" %>
<%@page import="java.text.DateFormat" %>


 <%
  String userRole=(String)session.getAttribute("userRole");
  if(userRole == null || !userRole.equals("1") ){
    response.sendRedirect("../index.jsp");
  }
  %>

<html>

 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />
 <jsp:include page="/DataTable/style.jsp" />


<div class="container">
<h1>Comentários</h1>
<div class="table-responsive my-4">
<table class="table table-bordered" id="table">
<thead>
<tr>
<th>Id</th>
<th>Id Postagem</th>
<th>Conteúdo </th>
<th>Autor</th>
<th>Data</th>
<th>Aprovado ? </th>
<th>Opções</th>
</tr>
</thead>
<tbody>
<%
for(Comentario com : DaoComentario.getComentarios()){
    out.write("<tr>");
    out.write("<td>"+com.getId()+"</td>");
    out.write("<td>"+com.getPostagem_id()+"</td>");
    out.write("<td>"+com.getCorpo()+"</td>");

    if(com.getUsuario()!=null){
    out.write("<td>"+com.getUsuario().getLogin()+"</td>");
    }
    else{
        out.write("<td></td>");
    }
    if(com.getDataCriacao()!=null){
    out.write("<td>"+DateFormat.getDateInstance().format(com.getDataCriacao())+"</td>");
    }
    else{
        out.write("<td></td>");
    }
    if(com.isAprovado()){
        out.write("<td class='text-success'>Sim</td>");

    }
    else{
            out.write("<td class='text-danger'>Não</td>");
    }
    out.write("<td><a class='btn btn-primary m-1' href=alterarAprovacao.jsp?id="+com.getId()+">Alterar aprovação</a><a class='btn btn-danger m-1' href=excluir.jsp?id="+com.getId()+">Deletar</a></td>");

    out.write("</tr>");
}
%>

<tbody>

</table>
</div>
</div>
 <jsp:include page="/DataTable/script.jsp" />

</body>

</html>