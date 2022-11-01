<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.entidades.Postagem" %>

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

Postagem post = DaoPostagem.getPostagem(Integer.parseInt(request.getParameter("id")));


%>
<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />
<div class="container">
<h1>Editar postagem</h1>

<form action="editar.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly value="<% out.write(""+post.getId()); %>"/>
</div>
  <div class="form-group">
    <label for="titulo">Titulo</label>
    <input type="text" class="form-control" id="titulo" name="titulo" required maxlength="255" placeholder="Insira o titulo..." value="<%out.write(post.getTitulo());%>">
  </div>

   <div class="form-group">
      <label for="corpo">Corpo da postagem</label>
      <textarea class="form-control" id="corpo" name="corpo" required rows="3" maxlength="3000" placeholder="Insira o corpo da postagem..." ><%out.write(post.getCorpo());%></textarea>
    </div>

<button class="btn btn-success mt-3">Salvar</button>
</form>


<%
    if("POST".equals(request.getMethod())){
        if(
            request.getParameter("titulo")!=null
            && request.getParameter("corpo")!=null
            && request.getParameter("id")!=null
            && ! request.getParameter("corpo").isEmpty()
            && ! request.getParameter("titulo").isEmpty()
            && ! request.getParameter("id").isEmpty()
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

                Postagem postEditado = new Postagem();
                postEditado.setCorpo(corpo);
                postEditado.setTitulo(titulo);
                postEditado.setId(Integer.parseInt(request.getParameter("id")));
                if(DaoPostagem.editar(postEditado)){
                    response.sendRedirect("consultar.jsp");
                }
                out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao editar a postagem, tente novamente!</p>");
            }


        }

    }
%>
</div>




</body>


</html>