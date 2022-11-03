<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.entidades.Postagem" %>

 <%
  String userRole=(String)session.getAttribute("userRole");
  if(userRole == null || !userRole.equals("1") ){
    response.sendRedirect("../index.jsp");
  }
  %>
<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />
 <jsp:include page="/Quill/quill.jsp" />
 <style>
 #editor-container {
   height: 130px;
 }
</style>
<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">
<h1>Criar postagem</h1>

<form action="criar.jsp" method="POST" id="formCriar">
  <div class="form-group">
    <label for="titulo">Titulo</label>
    <input type="text" class="form-control" id="titulo" name="titulo" required maxlength="255" placeholder="Insira o titulo...">
  </div>


        <div class="form-group">
          <label for="corpo">Corpo da postagem</label>
          <input type="text" class="form-control" id="corpo" name="corpo" hidden  maxlength="3000" placeholder="Insira o corpo da postagem..."/>
          <div id="editor-container">
          </div>
        </div>


<button class="btn btn-success mt-3">Salvar</button>
</form>
<p class="d-none alert alert-danger" id="msgErro"> </p>


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
            out.write("<script>document.getElementById('corpo').value='"+corpo+"';document.getElementById('titulo').value='"+titulo+"';document.getElementById('editor-container').innerHTML='"+corpo+"';</script>");


            if(titulo.length()>255 || titulo.length()<3){
                out.write("<p class='alert alert-danger'>O titulo deve possuir no máximo 255 caracteres e no minimo 3 caracteres</p>");
            }
            else if(corpo.length()>3000 || corpo.length()<10 ){
                out.write("<p class='alert alert-danger'>O corpo deve possuir no máximo 3000 caracteres e no mínimo 10 caracteres</p>");
            }
            else{
                String userId=(String)session.getAttribute("userId");
                if(userId !=null && ! userId.isEmpty()){
                Postagem post = new Postagem();
                post.setCorpo(corpo);
                post.setTitulo(titulo);
                post.setUsuarioCriador_id(Integer.parseInt(userId));
                if(DaoPostagem.criar(post)){
                    response.sendRedirect("consultar.jsp");
                }
                out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao salvar a postagem, tente novamente!</p>");
                }
                else{
                out.write("<p class='alert alert-danger'>Não foi possível identificar o seu usuário!</p>");
                }
            }


        }

    }
%>
</div>
<script>
var quill = new Quill('#editor-container', {
  theme: 'snow',
  placeholder: 'Digite o corpo da mensagem...',
});

var form = document.getElementById('formCriar');
form.onsubmit = function() {
  // Populate hidden form on submit
  var about = document.querySelector('input[name=corpo]');
  about.value = quill.root.innerHTML;
   if(quill.getLength()<10){
   const elemErro = document.getElementById('msgErro')
   elemErro.classList.remove('d-none');
   elemErro.innerText = 'O corpo da postagem deve possuir mais que 10 caracteres'
   return false;
   }
  console.log("Submitted", quill.root.innerHTML);
};

</script>
</body>

</html>