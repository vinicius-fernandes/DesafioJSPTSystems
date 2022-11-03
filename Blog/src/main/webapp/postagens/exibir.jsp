<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entidades.Postagem" %>
<%@page import="com.blog.entidades.Usuario" %>
<%@page import="com.blog.entidades.Comentario" %>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="com.blog.dao.DaoComentario" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.List" %>

<%

if(request.getParameter("id")==null || request.getParameter("id").isEmpty()){
    response.sendRedirect("../index.jsp");
}

Postagem post = DaoPostagem.getPostagem(Integer.parseInt(request.getParameter("id")));
List<Comentario> comentarios = DaoComentario.getComentariosPost(Integer.parseInt(request.getParameter("id")));

%>





<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg=light">
 <jsp:include page="/Layout/navbar.jsp" />


 <div class="container">
 <h1 class="text-center"><% out.write(post.getTitulo()); %> </h1>
 <p> <% out.write(post.getCorpo());%></p>
 <small> <%
 if(post.getDataCriacao()!=null){
 out.write(""+DateFormat.getDateTimeInstance().format(post.getDataCriacao()));
 }
 %>
 </small>
 <small> Publicado por: <%
 if(post.getUsuarioCriador() != null){
    out.write(post.getUsuarioCriador().getLogin()) ;
 }
 %> </small>

 <h4 class="mt-3">Comentários</h4>
       <%
             String userLogin=(String)session.getAttribute("userLogin");
             if(userLogin !=null){ %>
<form action="exibir.jsp?id=<%out.write(""+post.getId());%>" method="POST">
   <div class="form-group">
      <textarea class="form-control" id="corpoComentario" name="corpoComentario" required rows="3" maxlength="255" placeholder="Insira o seu comentário..." ></textarea>
    </div>

 <button class="btn btn-success mt-4">Comentar</button>

</form>
        <%
        }
        else{

      %>
      <div>
      <p class="alert alert-primary"> Para comentar é necessário estar logado, <a href="../auth/login.jsp">clique aqui para efetuar o login</a></p>
      </div>


         <%
              }

        %>

<%
    if("POST".equals(request.getMethod()) && userLogin !=null){
                if(
                    request.getParameter("id")!=null
                    && request.getParameter("corpoComentario")!=null
                    && request.getParameter("id")!=null
                    && ! request.getParameter("corpoComentario").isEmpty()
                ){
                    String comentario = request.getParameter("corpoComentario");
                        out.write("<script>document.getElementById('corpoComentario').value='"+comentario+"';</script>");

                    if(comentario.length()>255 || comentario.length()<2){
                        out.write("<p class='alert alert-danger'>O comentario deve possuir entre 3 e 255 caracteres</p>");
                    }
                    else{
                        String userId=(String)session.getAttribute("userId");
                        if(userId !=null && ! userId.isEmpty()){

                            Comentario novoComentario = new Comentario();
                            novoComentario.setPostagem_id(Integer.parseInt(request.getParameter("id")));


                            novoComentario.setUsuario_id(Integer.parseInt(userId));
                            novoComentario.setCorpo(comentario);

                            if(DaoComentario.criar(novoComentario)){
                                out.write("<p class='alert alert-success'>O comentário foi salvo e em breve será analisado por um moderador.</p>");

                            }
                            else{
                                out.write("<p class='alert alert-danger'>Ocorreu um erro interno ao criar o comentário</p>");
                            }
                        }
                        else{
                                    out.write("<p class='alert alert-danger'>Não é possível identificar o usuário fazendo a postagem</p>");
                        }

                    }

                }
    }

%>

 <%
 for(Comentario com: comentarios){
    out.write("<div class='card col-6 my-3'>");
        out.write("<div class='card-body'>");

             out.write("<p class='card-text'>"+com.getCorpo()+" </p>");

        out.write("</div>");
        out.write("<div class='card-footer text-muted text-center'>");
        if(com.getDataCriacao()!=null){
        out.write(""+DateFormat.getDateTimeInstance().format(com.getDataCriacao()));
        }
        if(com.getUsuario()!=null){
        out.write(" | Publicado por: "+com.getUsuario().getLogin());
        }
        out.write("</div>");
     out.write("</div>");

 }
 %>

 </div>

</body>

</html>
