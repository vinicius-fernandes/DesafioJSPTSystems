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

<h1>Excluir comentário</h1>

<p class="text-danger">Você realmente deseja excluir o comentário?</p>

<form action="excluir.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly  value="<% out.write(""+comentario.getId()); %>"/>
</div>
<div class="form-group mb-3">
 <label for="descricao">Comentário</label>
 <input type="text" class="form-control" name="corpo" id="corpo" readonly  value="<% out.write(comentario.getCorpo()); %>"/>
</div>

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
                if(DaoComentario.excluir(id)){
                    response.sendRedirect("consultar.jsp");
                }
                else{
                    out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao remover o comentário</p>");
                }
            }
            else{
            response.sendRedirect("consultar.jsp");
            }
        }else{
        out.write("<p class='alert alert-danger'>Não foi possível identificar o comentário a ser excluída</p>");
        }


    }

%>

</div>

</body>
</html>
