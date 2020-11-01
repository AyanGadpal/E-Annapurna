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
            String c = request.getParameter("cid");
            result = st.executeQuery("select * from consumer where C_ID = '"+c+"'");
            result.next();
            String name = result.getString("hname");
            String qty = result.getString("quantity");
            String type =  result.getString("type_of_shelter");
            String mob = result.getString("mobno");
            String toddler = result.getString("toddler");
            String date = result.getString("date_tran");
            String children = result.getString("children");
            String adolescent = result.getString("adolescent");
            String adult = result.getString("adult");
            String elderly = result.getString("elderly"); 
            int foodId = result.getInt("FoodID");
            int areaId = result.getInt("AreaID");
            result = st.executeQuery("select areaName from area where AreaID = "+areaId+"");
            result.next();
            String Area = result.getString(1);
            
            result = st.executeQuery("select food_type from total_food where FoodID = "+foodId+"");
            result.next();
            String food = result.getString(1);
            result = st.executeQuery("CALL `consumer_count`("+areaId+")");
             result.next();
            String served = result.getString(1);
       %>
       <div class="page-wrapper">
    		<!-- PAGE CONTAINER-->
    		<div class="page-container">
    			<!-- HEADER DESKTOP-->
    			<header class="header-desktop">
    				<div class="section__content section__content--p30">
    					<div class="container-fluid">
    						<div class="header-wrap">
    							<div class="header-button">
    								<h1><%=name+" "%> Details</h1>
    							</div>
    						</div>
    					</div>
    				</div>
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
                                             <h4 class="text-sm-center mt-2 mb-1"><%=type%></h4>
                                            <div class="location text-sm-center">
                                                <i class="fa fa-map-marker"></i> <%=Area%>, Pune</div>
                                        </div>
                                        <hr>
                                      
                                        <div class="row">
                                            <div class="col-md-2 ">
                                        <div class="statistic__item">
                                    <h2 class="number"><%=toddler%></h2>
                                    <span class="desc">Toddler</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                                            </div>
                                             <div class="col-md-2 ">
                                        <div class="statistic__item">
                                    <h2 class="number"><%=children%></h2>
                                    <span class="desc">Children</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                                            </div>
                                                 <div class="col-md-2 ">
                                        <div class="statistic__item">
                                    <h2 class="number"><%=adolescent%></h2>
                                    <span class="desc">Adolescent</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                                            </div>
                                                 <div class="col-md-2 ">
                                        <div class="statistic__item">
                                    <h2 class="number"><%=adult%></h2>
                                    <span class="desc">Adult</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                                            </div>
                                                 <div class="col-md-2 ">
                                        <div class="statistic__item">
                                    <h2 class="number"><%=elderly%></h2>
                                    <span class="desc">Elderly</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                        </div></div>
                                    <div class="col-md-2 ">
                                        <div class="statistic__item statistic__item--blue">
                                <h2 class="number" style="color:white;"><%=qty%> Kg</h2>
                                <span class="desc" style="color:white;"><%=food%> Quantity Required</span>
                                <div class="icon">
                                    <i class="zmdi zmdi-shopping-cart"></i>
                                </div>
                            </div></div>
                                             </div>
                                        <div class="row">
                                            <div class="col-md-6 ">
                                                   <p><b>Join Date</b> : <%=date%></p>
                                                      <p><b>Contact</b> <%=mob%></p>                          
                                            </div>
                                            <div class="col-md-6 ">
                                                <h3>Served Count <%=served%></h3>
                                            </div>
                                        </div>
                                    </div></div></div></div>
    					</div>
    				</div>
    				
    			</div>
    </body>
</html>
