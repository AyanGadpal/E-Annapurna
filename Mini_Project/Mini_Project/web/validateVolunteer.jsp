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
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String number = request.getParameter("number");
    String DOB = request.getParameter("DOB");
    String organization  = request.getParameter("organization");
    String education = request.getParameter("education");
    String area = request.getParameter("area");
    String whytojoin = request.getParameter("whytojoin");
    String duration = request.getParameter("duration");
    
    int d = Integer.parseInt(duration);    
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into volunteer(fname,lname,email,number,DOB,organization,education,area,whytojoin,duration)values('"+fname+"','"+lname+"','"+email+"','"+number+"','"+DOB+"','"+organization+"','"+education+"','"+area+"','"+whytojoin+"',"+duration+")");
               
        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>