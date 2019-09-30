<jsp:include page="template.html"/>
<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();%>
<html>
    <head>
        <script> 
            
        function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[2].className += " active";
        }
    
     
    </script>
       <%      
        String cho = request.getParameter("data");
        ResultSet result = null;
                                            
       if(cho == null)
       {
           result = st.executeQuery("select * from sponsors");
       }
       else 
       {
           if(cho.equals("name")) { 
            result = st.executeQuery("select * from sponsors order by spn_nm");
           }
           else if(cho.equals("phone")){
               result = st.executeQuery("select * from sponsors order by mobno");
           }
           else if(cho.equals("entity")){
               result = st.executeQuery("select * from sponsors order by whatentry");
           }
           else if(cho.equals("area")){
               result = st.executeQuery("select * from sponsors order by AreaId");
           }
           else if(cho.equals("fund")){
               result = st.executeQuery("select * from sponsors order by fund desc");
           }
           else if(cho.equals("food")){
               result = st.executeQuery("select * from sponsors order by food desc");
           }
           else if(cho.equals("raw")){
               result = st.executeQuery("select * from sponsors order by rawgrain desc");
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
                              <h1>Sponsours</h1>
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
                                                <option value="phone">Phone</option>
                                                <option value="entity">Entity</option>
                                                <option value="area">Area</option>
                                                <option value="fund">Fund</option>
                                                <option value="food">Food</option>
                                                <option value="raw">Raw Grain</option>
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
                                                <th>Phone</th>
                                                <th>Entity Type</th>
<!--                                            <th>date</th>
                                                <th>status</th>-->
                                                <th>Area</th>
                                                <th class="text-right">Fund</th>
                                                <th class="text-right">Food</th>
                                                <th class="text-right">Row Grain</th>
                                                <th></th>
                                                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                             <%
                                                while(result.next()){
                                             %>
                                            <tr class="tr-shadow">
                                             
                                                <th><%=result.getString("spn_nm")%></th>
                                                <th><%=result.getString("email")%></th>
                                                <th><%=result.getString("mobno")%></th>
                                                <th><%=result.getString("whatentry")%></th>
<!--                                                <th class="text-right"><%//=result.getString("date")%></th>-->
<!--                                                <th class="text-right"><%//=result.getString("Status")%></th>-->
                                                <th><%=result.getString("AreaId")%></th>
                                                <th class="text-right"><%=result.getString("fund")%></th>
                                                <th class="text-right"><%=result.getString("food")%></th>
                                                <th class="text-right"><%=result.getString("rawgrain")%></th>
                                                
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