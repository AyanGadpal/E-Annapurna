<%-- 
    Document   : validateVolunteer
    Created on : Sep 1, 2019, 2:16:57 PM
    Author     : Janak  
--%>

<%@page import="java.lang.System.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>

<%
    String hname = request.getParameter("hname");
    String typeofshelter = request.getParameter("typeofshelter");
    String phoneno = request.getParameter("phoneno");

    
    int area = Integer.parseInt(request.getParameter("area"));
    int food = Integer.parseInt(request.getParameter("foodChoice"));
    int toddler = Integer.parseInt(request.getParameter("toddler"));
    int children = Integer.parseInt(request.getParameter("children"));
    int adolescent = Integer.parseInt(request.getParameter("adolescent"));
    int adult = Integer.parseInt(request.getParameter("adult"));
    int elderly = Integer.parseInt(request.getParameter("elderly"));
 
    try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into consumer(FoodID,AreaID,hname,type_of_shelter,mobno,toddler,children,adolescent,adult,elderly)values("+food+","+area+",'"+hname+"','"+typeofshelter+"','"+phoneno+"',"+toddler+","+children+","+adolescent+","+adult+","+elderly+")");
        out.println("Data inserted successfully..");
        %>
       <script>  
        setTimeout("document.location.href='index.jsp'",3000);//PROPER UI IS REQUIRED..
       </script>
        <%
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>
<html>
    <head>
        
    </head>
    <body bgcolor="#f86f2d">
        <div style="margin:0px auto;width: 200px;color:white;height: 100px;margin-top: 20%;"><h1>Thank You</h1></div>
    </body>
</html>