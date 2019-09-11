<%-- 
    Document   : validateSponsours
    Created on : Sep 7, 2019, 9:42:01 AM
    Author     : Janak
--%>
<%@page import="java.lang.System.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>

<%
    String whatentry = request.getParameter("whatentry");
    String spn_nm = request.getParameter("spn_nm");
    int phnno = Integer.parseInt(request.getParameter("phnno"));
    String email = request.getParameter("email");
//    String designation = request.getParameter("designation");
    String state = request.getParameter("state");
    String city = request.getParameter("city"); 
    

    String excessfood = request.getParameter("excessfood"); 
    String freshfood = request.getParameter("freshfood"); 
    String rawgrain = request.getParameter("rawgrain"); 
    String fund = request.getParameter("fund"); 
    try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into sponsors(whatentry,spn_nm,phnno,email,state,city,excessfood,freshfood,rawgrain,fund)values('"+whatentry+"','"+spn_nm+"',"+phnno+",'"+email+"','"+state+"','"+city+"','"+excessfood+"','"+freshfood+"','"+rawgrain+"','"+fund+"')");
        out.println("Data inserted successfully..");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>