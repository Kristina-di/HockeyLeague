<%-- 
    Document   : addPlayer
    Created on : Dec 16, 2020, 6:01:52 PM
    Author     : diask
--%>

<%@page import="java.beans.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.beans.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body{
                margin-top: 100px;               
            }
            form{
                border: solid;
                padding: 50px;
                border-radius: 50px;
                width: 170px;	
                height: 280px
            }
        </style>
    </head>
    <body>
       <form action="AddPlayerServlet" method="POST">
            <p>Add new Player</p> 
          <br>Name <input type="text" name="name" size="20">
          <br>Address <input type="text" name="address" size="20">
          <br>Team <select name="team">
              <option>Red</option>
              <option>Blue</option>
            </select> 
          <br>Role <select name="role">
		<option>Goalie</option>
		<option>Forward</option>
		<option>Defense</option>
		</select>
	<br>Active <input type="checkbox" name="active">
<!--		<br><input type="submit" name="action" value="Add">-->
                 <br><a href="addPlayer.jsp">Add</a>
	</form>
        <%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String city_name=request.getParameter("city_name");
String email=request.getParameter("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
              //"jdbc.mysql://localhost:3306/world","root","dbpass");
 //"jdbc:mysql://localhost:3306/worldautoReconnect=true&useSSL=false");  
  "jdbc:mysql://localhost/?user=root&password=dbpass");     
Statement st = con.createStatement();

int i=st.executeUpdate("insert into users(name, address, team, role)values('"+name+"','"+address+"','"+team+"','"+role+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
    </body>
</html>
