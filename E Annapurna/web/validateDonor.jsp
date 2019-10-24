<%-- 
    Document   : validateDonor
    Created on : Sep 7, 2019, 9:24:16 AM
    Author     : Janak
--%>

<%@page import="java.lang.System.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>

<%
    String amt = request.getParameter("DonateAmt");
    String DonorName = request.getParameter("DonorName");
    String DonorPan = request.getParameter("DonorPan");
    String DonateAddr = request.getParameter("DonateAddr");    
    int DonateAmt = Integer.parseInt(amt);  
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into donor(DonateAmt,DonorPan,DonorName,DonorAddress)values("+DonateAmt+",'"+DonorPan+"','"+DonorName+"','"+DonateAddr+"')");
               
        //PROPER UI IS REQUIRED..
        %>
       <script>  
        setTimeout("document.location.href='index.jsp'",3000);
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