<%-- 
    Document   : index.jsp
    Created on : Dec 16, 2020, 5:59:12 PM
    Author     : diask
--%>

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
        <form method="ViewPlayerServlet" action="Team">
            Team:
            <select name="type" size="1" id="type">
                <option value="red">Red</option>
                <option value="blue">Blue</option>
            </select>
            <br><br>
            <a href="addPlayer.jsp">Add Player</a>
            <a href="viewTeam.jsp">See All Players</a>
<!--            <input type="Submit" value="Add Player">-->
        </form>
    </body>
</html>
