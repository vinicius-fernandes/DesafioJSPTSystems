<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.entidades.Postagem" %>


<%

if(request.getParameter("id")==null || request.getParameter("id").isEmpty()){
    response.sendRedirect("consultar.jsp");
}

Postagem post = DaoPostagem.getPostagem(Integer.parseInt(request.getParameter("id")));


%>

<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">

<h1>Excluir postagem</h1>

<p class="text-danger">Você realmente deseja excluir a postagem? Ela e todos os comentários relacionados serão removidos!</p>

<form action="excluir.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly value="<% out.write(""+post.getId()); %>"/>
</div>
<div class="form-group mb-3">
 <label for="descricao">Titulo</label>
 <input type="text" class="form-control" name="titulo" id="titulo" readonly value="<% out.write(post.getTitulo()); %>"/>
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
                if(DaoPostagem.excluir(id)){
                    response.sendRedirect("consultar.jsp");
                }
                else{
                    out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao remover a postagem</p>");
                }
            }
            else{
            response.sendRedirect("consultar.jsp");
            }
        }else{
        out.write("<p class='alert alert-danger'>Não foi possível identificar a postagem a ser excluída</p>");
        }


    }

%>

</div>

</body>
</html>
