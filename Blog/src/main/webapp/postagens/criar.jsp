<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.entidades.Postagem" %>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">
<h1>Criar postagem</h1>

<form action="criar.jsp" method="POST">
  <div class="form-group">
    <label for="titulo">Titulo</label>
    <input type="text" class="form-control" id="titulo" name="titulo" required maxlength="255" placeholder="Insira o titulo...">
  </div>

   <div class="form-group">
      <label for="corpo">Corpo da postagem</label>
      <textarea class="form-control" id="corpo" name="corpo" required rows="3" maxlength="3000" placeholder="Insira o corpo da postagem..."></textarea>
    </div>

<button class="btn btn-success mt-3">Salvar</button>
</form>


<%
    if("POST".equals(request.getMethod())){
        if(
            request.getParameter("titulo")!=null
            && request.getParameter("corpo")!=null
            && ! request.getParameter("corpo").isEmpty()
            && ! request.getParameter("titulo").isEmpty()
        ){
        String corpo = request.getParameter("corpo");
        String titulo = request.getParameter("titulo");
            out.write("<script>document.getElementById('corpo').value='"+corpo+"';document.getElementById('titulo').value='"+titulo+"';</script>");


            if(titulo.length()>255 || titulo.length()<3){
                out.write("<p class='alert alert-danger'>O titulo deve possuir no máximo 255 caracteres e no minimo 3 caracteres</p>");
            }
            else if(corpo.length()>300 || corpo.length()<10 ){
                out.write("<p class='alert alert-danger'>O corpo deve possuir no máximo 3000 caracteres e no mínimo 10 caracteres</p>");
            }
            else{

                Postagem post = new Postagem();
                post.setCorpo(corpo);
                post.setTitulo(titulo);
                if(DaoPostagem.criar(post)){
                    response.sendRedirect("consultar.jsp");
                }
                out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao salvar a postagem, tente novamente!</p>");
            }


        }

    }
%>
</div>

</body>

</html>