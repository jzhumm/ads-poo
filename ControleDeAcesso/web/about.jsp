<%-- 
    Document   : about
    Created on : 27 de set. de 2021, 19:37:03
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre - JorgeLapaApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h3>Informações:</h3>
        <%if(sessionName==null){%>
            <div style="color:red">Você precisa de permissão para acessar essa página</div>
        <%}else{%>
            <div><small><b>Jorge A. Rossetti Lapa</b></small></div>
            <div><small><b>RA: 1290481823018</b></small></div>
            <div><small><b><a href="https://github.com/jzhumm">Perfil GitHub</a></b></small></div>
            
            
        <%}%>
    </body>
</html>