<%-- 
    Document   : volunteerData
    Created on : Oct 11, 2019, 3:08:11 PM
    Author     : Janak
--%>
<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
 ResultSet result;
%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String s = request.getParameter("sid");
            result = st.executeQuery("select * from sponsors where s_id = '"+s+"'");
            result.next();
            String name = result.getString("spn_nm");
             String date = result.getString("date_tran");
            String entry = result.getString("whatentry");
            String mob = result.getString("mobno");
            String mail = result.getString("email");
            String fund = result.getString("fund");
            String food = result.getString("food");
            String rawgrain = result.getString("rawgrain");
            int areaId = result.getInt("AreaID");
            result = st.executeQuery("select areaName from area where AreaID = "+areaId+"");
            result.next();
            String Area = result.getString(1);
       %>
        <div class="page-wrapper">
    		<!-- PAGE CONTAINER-->
    		<div class="page-container">
    			<!-- HEADER DESKTOP-->
    			<header class="header-desktop">
    				<div class="section__content section__content--p30">
    					<div class="container-fluid">
    						
    			</header>
    			<!-- HEADER DESKTOP-->

    			<!-- MAIN CONTENT-->
    			<div class="main-content">
    				<div class="section__content section__content--p30">
    					<div class="container-fluid">
    						 <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong class="card-title mb-3">Sponsors Detail</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            
                                            <h2 class="text-sm-center mt-2 mb-1"><%=name%></h2>
                                             <h4 class="text-sm-center mt-2 mb-1"><%=entry%></h4>
                                            <div class="location text-sm-center">
                                                <i class="fa fa-map-marker"></i> <%=Area%>, Pune</div>
                                        </div>
                                        <hr>
                                        
                                        
                                        <div class="row">
                                            <div class="col-md-6 ">
                                                   <p><b>Join Date</b> : <%=date%></p>
                                                                                       
                                                    <p><b>Email </b><%=mail%>@mail.com </p>   
                                                                      
                                                      <p><b>Contact</b> <%=mob%></p>   
                                                                       
                                                       <p><b>FUND</b> Rs.<%=fund%></p>   
                                                                                
                                                         <p><b>RAW GRAIN</b>  <%=food%> Kg</p>  
                                                         <p><b>COOKED FOOD</b>  <%=rawgrain%> Kg</p>  

                                                                                
                                            </div>
                                            <div class="col-md-6 ">
                                                
                                            </div>
                                        </div>
                                    </div></div></div></div>
    				</div>
    					</div>
    				</div>
    				
    			</div>
    </body>
</html>
