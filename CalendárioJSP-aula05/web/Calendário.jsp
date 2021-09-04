<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! 
    public static class Calendario{
        public static int DiaDaSemana(int ano, int mes, int dia){
            double m,anu,me,div,e,f,a,b,c,d;
            m=(12-mes)/10;
            anu=ano-m;
            me=mes+(12*m);
            div=anu/100;
            e=div/4;
            f=2-div+e;
            a=(int)(365.25*anu);
            b=(int)(30.6001*(me+1));
            c=(int)((f+a)+(b+dia)+5);
            d=(int)(c)%7;
            return (int)d;
        }
        public static String getNomeDia(int dia){
            switch(dia)
            {
                case(0):
                    return "DOMINGO";
                    //break;
                case(1):
                    return "SEGUNDA";
                    //break;
                case(2):
                    return "TERÇA";
                   // break;
                case(3):
                    return "QUARTA";
                   // break;
                case(4):
                    return "QUINTA";
                   // break;
                case(5):
                    return "SEXTA";
                   // break;
                case(6):
                    return "SABADO";
                   // break;
                default:
                    return "";
            }
        }
        public static String getNomeMes(int mes){
            switch(mes)
            {
                case(1):
                    return "JANEIRO";
                    //break;
                case(2):
                    return "FEVEREIRO";
                    //break;
                case(3):
                    return "MARÇO";
                   // break;
                case(4):
                    return "ABRIL";
                   // break;
                case(5):
                    return "MAIO";
                   // break;
                case(6):
                    return "JUNHO";
                   // break;
                case(7):
                    return "JULHO";
                   // break;
                case(8):
                    return "AGOSTO";
                    //break;
                case(9):
                    return "SETEMBRO";
                   // break;
                case(10):
                    return "OUTUBRO";
                   // break;
                case(11):
                    return "NOVEMBRO";
                   // break;
                case(12):
                    return "DEZEMBRO";
                   // break;   
                default:
                    return "";
            }
        }
            
        public static int DiasNoMes(String mesNome){
            if(mesNome.equals("JANEIRO") || mesNome.equals("MARÇO") ||
               mesNome.equals("MAIO") || mesNome.equals("JULHO") ||
               mesNome.equals("AGOSTO") || mesNome.equals("OUTUBRO") || 
               mesNome.equals("DEZEMBRO"))
            {
                return (int)31;
            }
            if(mesNome.equals("ABRIL") || mesNome.equals("JUNHO") ||
               mesNome.equals("SETEMBRO") || mesNome.equals("NOVEMBRO"))
            {
                return (int)30;
            }
            if(mesNome.equals("FEVEREIRO"))
            {
                return (int)28;
            }
            else
                return (int)0;
        }
    }
%>
<%
    int ano = 0, mes = 0, count = 1, novoMes = 0, novoAno = 0;
    mes = Integer.parseInt(request.getParameter("entradaMes"));
    ano = Integer.parseInt(request.getParameter("entradaAno"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendario</title>
    
    <style>
        table, th, td, h1, h3, p{
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
    </style>
    </head>
    <body>
        <div><a href="index.html">Voltar</a></div>
        <h1>Calendario com JSP</h1>
        <table>
            <tr>
                <td>
                    <% if(mes-1==0)
                    {
                        novoMes=12;
                        novoAno=ano-1;
                    }
                    else
                    {
                        novoMes=mes-1;
                        novoAno=ano;
                    } %>
                    <form action="calendario.jsp" method="post">
                        <input type="hidden" name="entradaMes" value="<%=novoMes%>"/>
                        <input type="hidden" name="entradaAno" value="<%=novoAno%>"/>
                        <input type="submit" 
                                value="Retornar para <%=Calendario.getNomeMes(novoMes)+" "+novoAno%>"/></form>                        
                    </td>
                <td><h2><%=Calendario.getNomeMes(mes)%> <%=ano%></h2></td>
                <td>
                    <% if(mes+1==13)
                    {
                        novoMes=01;
                        novoAno=ano+1;
                    }
                    else
                    {
                        novoMes=mes+1;
                        novoAno=ano;
                    } %>
                    <form action="calendario.jsp" method="post">
                        <input type="hidden" name="entradaMes" value="<%=novoMes%>"/>
                        <input type="hidden" name="entradaAno" value="<%=novoAno%>"/>
                        <input type="submit" 
                                value="Avançar para <%=Calendario.getNomeMes(novoMes)+" "+novoAno%>"/></form>                        
                    </td>
            </tr>
        </table>
        <table border="1" cellpadding="0" cellspacing="1">
            <tr>
                <%for(int coluna=0; coluna<7;coluna++){ %>
                <th> <%=Calendario.getNomeDia(coluna)%></th>
                <% } %>
            </tr>
            <% for(int linha=1; linha<=6;linha++){ %>
            <tr>
                <% for(int coluna=0; coluna<7;coluna++){ %>
                <td> 
                    <%  if(count>1 && count<=Calendario.DiasNoMes(Calendario.getNomeMes(mes)))
                        {
                            out.println(count);
                            count++;
                        }
                        if(Calendario.getNomeDia(coluna).equals(Calendario.getNomeDia(Calendario.DiaDaSemana(ano,mes,01)))
                                && count<=7 && count<=Calendario.DiasNoMes(Calendario.getNomeMes(mes)))
                        {
                            out.println(count);
                            count++;
                        }
                        else
                            out.println(" ");
                    %>
                </td>
                <% } %>
            </tr>
            <% } %>
        </table>
        <hr/>
            <h3>Selecionar novo mês e ano</h3>
            
            <form action="calendario.jsp" method="post">
                <p>Entre com o novo mes: <input type="number" min="1" max="12" name="entradaMes" /></p>
                <p>Entre com o novo ano: <input type="number" min="0" name="entradaAno"/></p>
                <p><input type="submit" value="Gerar Novo Calendario"/></p>
            </form>
    </body>
</html>