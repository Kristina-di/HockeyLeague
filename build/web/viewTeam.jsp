<%-- 
    Document   : viewTeam
    Created on : Dec 16, 2020, 6:00:48 PM
    Author     : diask
--%>

<%@page import="data.DBManager"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Player"%>
<%@page import="data.PlayerDAO"%>
<%@page import="java.sql.*"%>
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
        <table>
             <%
            out.println(request.getParameter("type") + " team");
            %>
<ol>
    <%
        try{
        DBManager dbm = new DBManager();
    ResultSet rs = dbm.executeQuery("SELECT * FROM players");
    while(rs.next()){
    %>
    <li><%= rs.getString("Name") %></li>
    <%
        }
}catch(Exception e){
    %>
    Error Loading Driver: <%= e.toString()
    %>
    <%}%>
</ol>
        <%
            PlayerDAO playerDAO = new PlayerDAO();
            ArrayList<Player> players = playerDAO.retrieveAllPlayers();
            for(Player player: players){
        %>
        <tr><td><%=player.getName()%></td><td>
                <form action="updatePlayer.jsp" method="GET">
                <input type="hidden" name="ID" value="<%=player.getName()%>">
                <input type="submit" name="action" value="Edit">
                </form></td><td>
                <form action="deletePlayer.jsp" method="GET">
                <input type="hidden" name="ID" value="<%=player.getName()%>">
                <input type="submit" name="action" value="Delete">
                </form>
            </td></tr>
        <%
            }
        %>
        </table>
    </body>
</html>
