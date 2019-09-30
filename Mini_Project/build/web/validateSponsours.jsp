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
    int area = Integer.parseInt(request.getParameter("area"));
        
    String fod = request.getParameter("foodQ");
    String r = request.getParameter("rawQ"); 
    String f = request.getParameter("fundQ");

    float food = 0;
    float rawgrain = 0;
    float fund = 0;
    if(fod == null || fod == "")
    {
        fod = "0";
    }
    else
        food = Float.parseFloat(fod);
    
    if(r == null || r == "")
    {
        r = "0";
    }
    else
        rawgrain = Float.parseFloat(r);
    
    if(f == null || f == "")
    {
        f = "0";
    }
    else
        fund = Float.parseFloat(f);
        
    
    try{ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
        Statement st=conn.createStatement();
         
        st.executeUpdate("insert into sponsors(whatentry,spn_nm,mobno,email,AreaID,food,rawgrain,fund)values('"+whatentry+"','"+spn_nm+"',"+phnno+",'"+email+"',"+area+","+food+","+rawgrain+","+fund+")");
        out.println("Data inserted successfully..");
    }
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>