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
    String breakfast = request.getParameter("breakfast");
    String lunch = request.getParameter("lunch");
    String dinner = request.getParameter("dinner");
    
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
        
        st.executeUpdate("insert into consumer(FoodID,AreaID,hname,type_of_shelter,mobno,breakfast,lunch,dinner,toddler,children,adolescent,adult,elderly)values("+food+","+area+",'"+hname+"','"+typeofshelter+"','"+phoneno+"','"+breakfast+"','"+lunch+"','"+dinner+"',"+toddler+","+children+","+adolescent+","+adult+","+elderly+")");
        out.println("Data inserted successfully..");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>