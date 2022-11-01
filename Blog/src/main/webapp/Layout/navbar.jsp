<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5 p-2">
  <a class="navbar-brand" href="../index.jsp">Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="../index.jsp">Home </a>
      </li>
     <%
                  String userRole=(String)session.getAttribute("userRole");
                  if(userRole !=null && userRole.equals("1") ){ %>
      <li class="nav-item">
        <a class="nav-link" href="../postagens/consultar.jsp">Gerir postagens</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../comentarios/consultar.jsp">Gerir comentários</a>
      </li>
        <% }
      %>
      <%
            String userLogin=(String)session.getAttribute("userLogin");
            if(userLogin !=null){ %>
                  <li class="nav-item float-right">
                    <a class="nav-link text-danger" href="../auth/logout.jsp">Logout</a>
                  </li>
            <% }

            else{
      %>
               <li class="nav-item float-right">
                          <a class="nav-link text-primary" href="../auth/login.jsp">Login</a>
                </li>
        <% }

      %>
    </ul>
  </div>
</nav>