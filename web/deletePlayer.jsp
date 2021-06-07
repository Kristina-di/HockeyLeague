<%-- 
    Document   : deletePlayer
    Created on : Dec 16, 2020, 6:18:04 PM
    Author     : diask
--%>




<%@page import="bean.Player"%>
<%@page import="data.PlayerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body{
                text-align: center;
                margin-top: 100px;               
            }
            form{
                border: solid;
                padding: 50px;
                border-radius: 30px;
                width: 150px;	
                height: 100px
            }
            a{
                font-size: 10px; 
            }
        </style>
    </head>
    <body>
        <h1>Delete Player</h1>
        <%
            int ID = Integer.parseInt(request.getParameter("Id"));
            PlayerDAO palyerDAO = new PlayerDAO();
            Player player = palyerDAO.retrievePlayer(ID);
        %>
        
        Delete <%=player.getName()%> ?
        
        <form action="WorldControllerServlet" method="GET">
            <input type="hidden" name="ID" value="<%=player.getName()%>">
            <br><input type="submit" name="action" value="Delete Player"> 
        </form>
    </body>
</html>
