<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null;

%>  
<html>
<head>
    <script>
      
        // Get the container element
        function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[0].className += " active";
            
        }
    </script>
    
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
                          <h1>Analysis</h1>
                      </div>
                  </div>
              </div>
          </div>
      </header>
      <!-- HEADER DESKTOP-->

      <!-- MAIN CONTENT-->
      <div class="main-content">
        <div class="section__content section__content--p30">
           <div class="row m-t-25"> 
               <!-- VOLUNTEERS -->
               <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c1">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-account-o"></i>
                            </div>
                            <div class="text">
                                
                                <h2><%
                                    // GET ACTIVE VOLUNTEERS
                                    result = st.executeQuery("select * from volunteer where status = 0");
                                    result.next();
                                    result.last();
                                    // GET COUNT
                                    int count = result.getRow();%>
                                    <!-- SET COUNT TO BOX-->
                                    <h2><%=count%></h2>
                                    <span>Total Active Volunteers</span>
                                </div>
                            </div>
                            <div class="overview-chart">
                                <canvas id="widgetChart1"></canvas>
                            </div>  
                        </div>
                    </div>
                </div>
                                    
<!--                                    FUND-->
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c4">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-money"></i>
                                </div>
                                <div class="text"><%
                                   // GET TOTAL FUND
                                   result = st.executeQuery("select * from total_fund");
                                   if(result.next())%>
                                    <!--SHOW TOTAL FUND-->
                                   <h2>$ <%=result.getString("Fund")%></h2>
                                   <span>total Fund</span>
                               </div>
                           </div>
                           <div class="overview-chart">
                            <canvas id="widgetChart4"></canvas>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            <!-- RAW GRAIN -->
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c2">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                            <div class="text"><%
                                   // GET TOTAL FUND
                                   result = st.executeQuery("select * from total_food where foodid=1");
                                   if(result.next())%>
                                    <!--SHOW TOTAL FUND-->
                                   <h2> <%=result.getString("Quantity")%> Kg</h2>
                                   <span>Raw Grain</span>
                            </div>
                        </div>
                        <div class="overview-chart">
                            <canvas id="widgetChart2"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3">
                <div class="overview-item overview-item--c3">
                    <div class="overview__inner">
                        <div class="overview-box clearfix">
                            <div class="icon">
                                <i class="zmdi zmdi-grain"></i>
                            </div>
                            <div class="text"><%
                                   // GET TOTAL FUND
                                   result = st.executeQuery("select * from total_food where foodid=2");
                                   if(result.next())%>
                                    <!--SHOW TOTAL FUND-->
                                   <h2> <%=result.getString("Quantity")%> Kg</h2>
                                   <span>Cooked Food</span>
                            </div>
                        </div>
                        <div class="overview-chart">
                            <canvas id="widgetChart3"></canvas>
                        </div>
                    </div>
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