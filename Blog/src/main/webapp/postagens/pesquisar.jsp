<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entidades.Postagem" %>
<%@page import="com.blog.dao.DaoPostagem" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.List" %>

<%
int pagina = 0;

if( request.getParameter("pagina")!=null
    && ! request.getParameter("pagina").isEmpty()){

    pagina = Integer.parseInt(request.getParameter("pagina"));

}
String pesquisa = "";
if(request.getParameter("pesquisa")!=null && ! request.getParameter("pesquisa").isEmpty()){
    pesquisa=request.getParameter("pesquisa");
}
if(pesquisa.isEmpty()){
     response.sendRedirect("../index.jsp");
}


int proximaPagina = pagina +1;

int paginaAnterior = pagina -1 ;

int totalPosts = DaoPostagem.getTotalPostsPesquisa(pesquisa);

boolean mostrarProxima = true;

if((proximaPagina * 10) > totalPosts){
 mostrarProxima = false;
}



List<Postagem> postagens = DaoPostagem.searchPosts(pagina,pesquisa);
%>

<html>
 <jsp:include page="/Bootstrap/bootstrap.jsp" />

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />

<div class="container">

<h1>Resultados da pesquisa</h1>
<small>Total de postagens na página atual: <% out.write(""+ postagens.size()); %></small>
<%

for(Postagem post: postagens ){
    out.write("<div class='card m-3'>");
       out.write("<div class='card-body'>");
          out.write("<h5 class='card-title text-center'>"+post.getTitulo()+"</h5>");

          if(post.getCorpo().length()>15){
          out.write("<p class='card-text'>"+post.getCorpo().replaceAll("<.*?>", "").replaceAll("<.*?/>", "").substring(0,15)+" ...</p>");
          }
          else{
            out.write("<p class='card-text'>"+post.getCorpo().replaceAll("<.*?>", "").replaceAll("<.*?/>", "")+" ...</p>");
          }
          out.write("<a href=/postagens/exibir.jsp?id="+post.getId()+" class='btn btn-primary'>Visualizar tudo</a>");
       out.write("</div>");
       out.write("<div class='card-footer text-muted text-center'>");
       out.write(""+DateFormat.getDateTimeInstance().format(post.getDataCriacao()));
       out.write("</div>");
    out.write("</div>");

}

%>
<div class="text-center m-2">
<% if(paginaAnterior>=0){ %>
<a class="btn btn-primary" href='pesquisar.jsp?pagina=<%out.write(""+paginaAnterior);%>&pesquisa=<%out.write(pesquisa);%>'>Página anterior</a>
<% } %>
<% if(mostrarProxima){ %>
<a class="btn btn-primary" href='pesquisar.jsp?pagina=<%out.write(""+proximaPagina);%>&pesquisa=<%out.write(pesquisa);%>'>Próxima página</a>
<% } %>
</div>
</div>
</body>
</html>
