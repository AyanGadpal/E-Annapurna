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
    String area = request.getParameter("area");
    String typeofshelter = request.getParameter("typeofshelter");
    String phoneno = request.getParameter("phoneno");
    int f = Integer.parseInt(request.getParameter("foodgrain"));
    int c  = Integer.parseInt(request.getParameter("cookedfood"));
    int n = Integer.parseInt(request.getParameter("nonvegfood"));
    String breakfast = request.getParameter("breakfast");
    String lunch = request.getParameter("lunch");
    String dinner = request.getParameter("dinner");
    String toddler = request.getParameter("toddler");
    String children = request.getParameter("children");
    String adolescent = request.getParameter("adolescent");
    String adult = request.getParameter("adult");
    String elderly = request.getParameter("elderly");
 
    try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject", "root", "");
        Statement st=conn.createStatement();
        
        st.executeUpdate("insert into consumer(hname,area,typeofshelter,phoneno,foodgrains,cookedfood,nonvegfood,breakfast,lunch,dinner,toddler,children,adolescent,adult,elderly)values('"+hname+"','"+area+"','"+typeofshelter+"','"+phoneno+"','"+f+"','"+c+"','"+n+"','"+breakfast+"','"+lunch+"',"+dinner+","+toddler+","+children+","+adolescent+","+adult+","+elderly+")");
        out.println("Data inserted successfully..");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>