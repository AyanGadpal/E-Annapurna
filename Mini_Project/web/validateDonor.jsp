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
               
        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>