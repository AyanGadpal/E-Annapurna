<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();
    Statement st2=conn.createStatement();

%>  
<html>
    <head>
        <script> 
            
            function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[1].className += " active";
            var mainPage = document.getElementById("mainPage");
            mainPage.innerHtml = "<h1>Hello World</h1>";
        }	
    </script>
       <%
       		String cho = request.getParameter("data");
        	ResultSet result = null,areaVise = null;
        	if(cho == null)
        	{
        		result = st.executeQuery("select * from volunteer");
        	}
        	else
        	{
        		if(cho.equals("name")){
        			result = st.executeQuery("select * from volunteer order by fname");
        		}
        		else if(cho.equals("email")){
        			result = st.executeQuery("select * from volunteer order by email");
        		}
        		else if(cho.equals("phone")){
        			result = st.executeQuery("select * from volunteer order by mobno desc");
        		}
        		else if(cho.equals("area")){
        			result = st.executeQuery("select * from volunteer order by AreaId");
        		}
        		else if(cho.equals("status")){
   				result = st.executeQuery("select * from volunteer order by status");     		
        		}
        	}
       %>
    </head>
    <body>
           <div class="page-wrapper">
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <div class="header-button">
                              <h1>Volunteer Details</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">data table</h3>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        <div class="rs-select2--light rs-select2--md">
                                            <form action="#">
                                                <select name="data" id="data">
                                                <option value="name">Name</option>
                                                <option value="email">Email</option>
                                                <option value="phone">Phone</option>
                                                <option value="area">Area</option>
                                                <option value="status">Status</option>
                                            </select>
                                                  <div class="dropDownSelect2"></div>
                                        </div>
                                    </div>
                                            <button type="submit" class="au-btn au-btn-icon au-btn--green au-btn--small">
                                            <i class="zmdi zmdi-plus"></i>Submit</button>
                                            </form>   
                                        
                                          
                                  </div>   
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Gender</th>
                                                <th>Phone</th>
                                                <th>Area</th>
                                                <th class="text-right">Organization</th>
                                                <th class="text-right">Education</th>
                                                <th class="text-right">Status</th>
                                                <th></th>
                                                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <%
                                                while(result.next()){
                                                String s = null;
                                                String color = null;
                                                String gen = null;
                                                int state = Integer.parseInt(result.getString("Status"));
                                                int g = result.getInt("gender");
                                                
                                                if(g == 1)
                                                    gen = "Male";
                                                else
                                                    gen = "Female";
                                                if(state == 1)
                                                {
                                                	s = "BUSY";
                                                        color= "green";
                                                }
                                                else if(state == 0){
                                                	s = "AVAILABE";
                                                        color= "blue";
                                                }
                                                else if(state == -1)
                                                {
                                                    s = "PASSIVE";
                                                    color= "grey";
                                                }
                                                else
                                                {
                                                    s = "NOT AVAILABE";
                                                    color= "red";
                                                }
                                                int areaId = result.getInt("AreaID");
                                                 areaVise = st2.executeQuery("select areaName from area where AreaID = "+areaId+"");
                                                areaVise.next();
                                                String Area = areaVise.getString(1);
                                                
                                             %>
                                            <tr class="tr-shadow">
                                                <th><%=result.getString("fname")%></th>
                                                <th><%=result.getString("email")%>@mail.com</th>
                                                <th><%=gen%></th>
                                                <th><%=result.getString("mobno")%></th>
                                                <th><%=Area%></th>
                                                <th class="text-right"><%=result.getString("organization")%></th>
                                                <th class="text-right"><%=result.getString("education")%></th>
                                                <th class="text-right" style="color:<%=color%>"><%=s%></th>
                                                <form action="volunteerData.jsp">
                                                <th class="text-right"><button class="au-btn au-btn-icon au-btn--green au-btn--small" type="submit" name="vid" value="<%=result.getString("v_id")%>">View Data</button></th>
                                               </form>
                                            </tr>
                                            <tr class="spacer">
                                                
                                            </tr><%}%>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>  

    </div>
        
    </body>
    
</html>