<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int n=10;
    String error = null;
    if(request.getParameter("n")==null){
        error = "Não foi informado o parâmetro necessário 'n'";
    }else{
        try{
            n = Integer.parseInt(request.getParameter("n"));
        }catch(Exception e){
            error = "O valor informado como parâmetro 'n' ('"
                    +request.getParameter("n")
                    +"') não é um número inteiro válido";
        }
    }
        
%>
<html>
    <head>
        <title>JavaEE - JSP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Java Server Pages</h2>
        <h3>Tabuada</h3>
        <h4><a href="index.html">Voltar</a></h4>
        <hr/>
        <%if(error != null){%>
        <div style="color: red"><%= error %></div>
        <%}else{%>
        
        <table>
            <%for(int i=1; i<=10; i++){%>
            <tr>
                <td><%= n %></td>
                <td>x</td>
                <td><%= i %></td>
                <td>=</td>
                <td><%= n*i %></td>
            </tr>
            <%}%>
        </table>
        <hr/>
        <%}%>
        
        <form action="multiplication-table.jsp">
            <input type="number" name="n" value="<%= n %>"/>
            <input type="submit" value="Gerar"/>
        </form>
    </body>
</html>

