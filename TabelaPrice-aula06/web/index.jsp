<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 21:55:47
    Author     : jorge
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - identificação</title>
    </head>
    <body>
        <h1>Calculadora Tabela Price</h1>
        <h3>Nome: Jorge A. Rossetti Lapa - RA: 1290481823018</h3>
        
        
        <h3>POR VALOR ENTRE COM OS VALORES</h3>
        
    <form action="tabela-price.jsp">
        <p>Valor Presente: </p><input class="co" type="number" name="vp" min="0" step="0.01" placeholder="0.00"/>
        <p>Juros: </p><input class="co" type="number" name="i" min="0" step="0.01" placeholder="0.00"/>
    <p>Meses: </p><input class="co" type="number" name="n" min="0" step="1" placeholder="0"/>
    <input id="vo" type="submit" value="calcular"/>
    </form>
    </body>
</html>