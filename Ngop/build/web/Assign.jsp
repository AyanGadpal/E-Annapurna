<jsp:include page="template.html"/>
<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();
    Statement st2=conn.createStatement();
    ResultSet result2,areaVise;
    result2 = st.executeQuery("select * from total_food where foodid=1");
    result2.next();
    String raw = result2.getString("Quantity");
    result2 = st.executeQuery("select * from total_food where foodid=2");
    result2.next();
    String cook = result2.getString("Quantity");
 %>
<html>
    <head>
        <script> 
            
        function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[5].className += " active";
        }
    
     
    </script>
       <%      
        String cho = request.getParameter("qwerty");
        ResultSet result = null;
                                            
       if(cho == null)
       {
           result = st.executeQuery("select * from consumer where C_ID not in(SELECT C_ID FROM allocation where date_tran = curdate())");
       }
       else 
       {
           if(cho.equals("area")) { 
            result = st.executeQuery("select * from consumer order by AreaId");
           }
           else if(cho.equals("shelter")){
               result = st.executeQuery("select * from consumer order by type_of_shelter");
           }
           else {
            result = st.executeQuery("select * from consumer order by Quantity desc");
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
                              <h1>Select Consumers</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                 <%
                 Integer eflag =(Integer)session.getAttribute("ERROR_FOOD");
                 Integer eflag2 =(Integer)session.getAttribute("ERROR_VOL");
                 if(eflag != null || eflag2 != null)
                 {
                     if(eflag == 0)
                     {
                         %>
                 <div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                 <span class="badge badge-pill badge-danger">ERROR</span>
                  Not Enough Food for this area
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                         <%
                     }
                     if(eflag2 == 0)
                     {
                         %>
                 <div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                 <span class="badge badge-pill badge-danger">ERROR</span>
                  No Volunteers for this area
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                         <%
                     }
                 }
                    %>
                
                    
                    <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">Choose Consumer</h3>
<!--                                <h3>Raw Food : <%=raw%> Kg and Cooked Food : <%=cook%>Kg</h3>-->
                                <div class="table-responsive table-responsive-data2">
                                    
                                    
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Consumer Name</th>
                                                <th>Contact</th>
                                                <th>Type of Shelter</th>
                                                <th>Area</th>
<!--                                            <th>date</th>
                                                <th>status</th>-->
                                                <th class="text-right">Type of food</th>
                                                <th class="text-right"  >Quantity</th>
                                                <th></th>
                                                    
                                            </tr>
                                        </thead>
                                        
                                        <tbody> 
                                             <%
                                                while(result.next()){
                                                    
                                                     int areaId = result.getInt("AreaID");
                                                int foodId = result.getInt("FoodID");
                                                areaVise = st2.executeQuery("select areaName from area where AreaID = "+areaId+"");
                                                areaVise.next();
                                                String Area = areaVise.getString(1);
                                                areaVise = st2.executeQuery("select food_type from total_food where FoodID = "+foodId+"");
                                                areaVise.next();
                                                String food = areaVise.getString(1);
                                             %>
                                            <tr class="tr-shadow">
                                             
                                                <th><%=result.getString("hname")%></th>
                                                <th><%=result.getString("mobno")%></th>
                                                <th><%=result.getString("type_of_shelter")%></th>
                                                <th><%=Area%></th>
<!--                                                <th class="text-right"><%//=result.getString("date")%></th>-->
<!--                                                <th class="text-right"><%//=result.getString("Status")%></th>-->
                                                <th class="text-right"><%=food%></th>
                                                <th class="text-right"><%=result.getString("Quantity")%> Kg</th>
                                                <form action="assignConsumer.jsp">
                                                <th class="text-right"><button class="au-btn au-btn-icon au-btn--green au-btn--small" type="submit" name="cid" value="<%=result.getString("C_ID")%>">Assign Volunteers</button></th>
                                               </form>
                                                
                                            </tr>
                                            <tr class="spacer">
                                                
                                            </tr><%}%> 
                                            
                                        </tbody>
                                    </table>
                                            </form>
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