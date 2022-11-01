<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoComentario" %>
<%@page import="com.blog.entidades.Comentario" %>

 <%
  String userRole=(String)session.getAttribute("userRole");
  if(userRole == null || !userRole.equals("1") ){
    response.sendRedirect("../index.jsp");
  }
  %>
<%

if(request.getParameter("id")==null || request.getParameter("id").isEmpty()){
    response.sendRedirect("consultar.jsp");
}

Comentario comentario = DaoComentario.getComentario(Integer.parseInt(request.getParameter("id")));


%>

<html>

 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">

<h1>Alterar aprovação comentário</h1>

<p class="text-danger">Você realmente deseja alterar a aprovação do comentário?</p>

<form action="alterarAprovacao.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly value="<% out.write(""+comentario.getId()); %>"/>
</div>
<div class="form-group mb-3">
 <label for="descricao">Comentário</label>
 <input type="text" class="form-control" name="corpo" id="corpo" readonly  value="<% out.write(comentario.getCorpo()); %>"/>
</div>

<h5>Status aprovação atual </h5>
<%
if(comentario.isAprovado()){
out.write("<p>Aprovado</p>");
}
else{
out.write("<p>Não aprovado</p>");
}
%>

<div class="form-check">
  <input class="form-check-input" type="radio" name="excluir" id="excluirSim" value="1" required/>
  <label class="form-check-label" for="excluirSim">
    Sim
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="excluir" id="excluirNao" value="0" >
  <label class="form-check-label" for="excluirNao">
  Não
  </label>
</div>

 <button class="btn btn-success mt-4">Confirmar</button>
</form>


<%
    if("POST".equals(request.getMethod())){

    if(request.getParameter("id")!=null
        && request.getParameter("excluir")!=null
        && !request.getParameter("id").isEmpty()
        && !request.getParameter("excluir").isEmpty()
        ){
            int id = Integer.parseInt(request.getParameter("id"));
            int opcaoExcluir = Integer.parseInt(request.getParameter("excluir"));

            if(opcaoExcluir==1){
                if(DaoComentario.alterarAprovacao(id,comentario.isAprovado())){
                    response.sendRedirect("consultar.jsp");
                }
                else{
                    out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao alterar a aprovação do comentário</p>");
                }
            }
            else{
            response.sendRedirect("consultar.jsp");
            }
        }else{
        out.write("<p class='alert alert-danger'>Não foi possível identificar o comentário a ser alterado</p>");
        }


    }

%>

</div>

</body>
</html>
