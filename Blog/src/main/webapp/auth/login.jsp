<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoUsuario" %>
<%@page import="com.blog.entidades.Usuario" %>

       <%
             String userLogin=(String)session.getAttribute("userLogin");
             if(userLogin !=null){
                 response.sendRedirect("../index.jsp");
             }
        %>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">

<div class="container">
<h1 class="text-center">Login</h1>
<form action="login.jsp" method="POST" class="col-4 mx-auto">
  <div class="form-group mt-2">
    <label for="exampleInputEmail1">Login</label>
    <input type="text" class="form-control" id="login" name="login" required placeholder="Insira seu login">
  </div>
  <div class="form-group mt-2">
    <label for="senha">Senha</label>
    <input type="password" class="form-control" id="senha" name="senha" required placeholder="Insira sua senha ...">
  </div>

  <button type="submit" class="btn btn-primary mt-2">Login</button>
</form>
<div class="text-center">

<%
 if("POST".equals(request.getMethod())){
        if(
            request.getParameter("login")!=null
            && request.getParameter("senha")!=null
            && ! request.getParameter("login").isEmpty()
            && ! request.getParameter("senha").isEmpty()
        ){
            Usuario usuario = new Usuario();
            usuario.setLogin(request.getParameter("login"));
            usuario.setSenha(request.getParameter("senha"));

            usuario = DaoUsuario.Login(usuario);

            if(usuario.isLogado()){
                session.setAttribute("userLogin", usuario.getLogin());
                session.setAttribute("userId", Integer.toString(usuario.getId()));
                session.setAttribute("userRole", Integer.toString(usuario.getTiposUsuario_id()));
                response.sendRedirect("../index.jsp");
            }
            else{
                out.write("<p class='alert alert-danger'>Não foi possível efetuar o login, verifique sua senha e usuário!</p>");
            }
        }
    }
%>

<p>Ainda não tem uma conta?</p>
<a href="registro.jsp"> Registre-se</a>
</div>
</div>
</body>
</html>