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
    int area = Integer.parseInt(request.getParameter("area"));
    String whytojoin = request.getParameter("whytojoin");
    String monday = request.getParameter("monday");
    String tuesday = request.getParameter("tuesday");
    String wednesday = request.getParameter("wednesday");
    String thursday = request.getParameter("thursday");
    String friday = request.getParameter("friday");
    String saturday = request.getParameter("saturday");
    String sunday = request.getParameter("sunday");
    String str = null;
    if(monday != null)
        str = "1";
    else 
        str = "0";
    
    if(tuesday != null)
       str = str +"1";
    else 
        str = str + "0";
    
    if(wednesday != null)
        str = str + "1";
    else 
        str = str + "0";
    
    if(thursday != null)
        str = str + "1";
    else 
        str = str + "0";
    
    if(friday != null)
        str = str + "1";
    else 
        str = str + "0";
    
    if(saturday != null)
        str = str + "1";
    else 
        str = str + "0";
    
    if(sunday != null)
        str = str + "1";
    else 
        str = str + "0";
    int aID = Integer.parseInt(request.getParameter("area")); 
    try{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into volunteer(AreaID,fname,lname,email,mobno,DOB,organization,education,why_to_join,duration)values("+aID+",'"+fname+"','"+lname+"','"+email+"',"+number+",'"+DOB+"','"+organization+"','"+education+"','"+whytojoin+"','"+str+"')");
               
        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>