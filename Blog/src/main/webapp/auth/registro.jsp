<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">

<div class="container">
<h1 class="text-center">Registro</h1>
<form class="col-4 mx-auto">
  <div class="form-group mt-2">
    <label for="exampleInputEmail1">Login</label>
    <input type="text" class="form-control" id="login" name="login"  placeholder="Insira seu login">
  </div>
  <div class="form-group mt-2">
    <label for="senha">Senha</label>
    <input type="password" class="form-control" id="senha" name="senha" placeholder="Insira sua senha ...">
  </div>

  <button type="submit" class="btn btn-primary mt-2">Registrar</button>
</form>
<div class="text-center">
<p>Já possui uma conta?</p>
<a href="login.jsp">Efetuar login</a>
</div>
</div>
</body>
</html>