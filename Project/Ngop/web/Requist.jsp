
<jsp:include page="template.html"/>

<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();
 Statement st2=conn.createStatement();%>
<html>
    <head>
     
    <script> 
            
        function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[4].className += " active";
        }
    
     
     </script>
       <%      
        String cho = request.getParameter("qwerty");
        ResultSet result = null,areaVise;
                                            
       if(cho == null)
       {
           result = st.executeQuery("select * from consumer");
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
                              <h1>Assign Volunteers to Consumers</h1>
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
                                                <select name="qwerty" id="qwerty">
                                                <option value="area">Area</option>
                                                <option value="quantity">Quantity</option>
                                                <option value="shelter">Shelter</option>
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
                                                <th class="text-right"><%=food%></th>
                                                <th class="text-right"><%=result.getString("Quantity")%> Kg</th>
                                                <form action="consumerData.jsp">
                                                <th class="text-right"><button class="au-btn au-btn-icon au-btn--green au-btn--small" type="submit" name="cid" value="<%=result.getString("C_ID")%>">View Data</button></th>
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