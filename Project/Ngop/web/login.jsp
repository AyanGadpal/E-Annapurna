<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null,A1,A2;
A1=A2=null;
A1 = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=1");
A1.next();
String C = A1.getString("count");
float A1C = Integer.parseInt(C);
A2 = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=2");
A2.next();
C = A2.getString("count");
float A2C = Integer.parseInt(C);

A1 = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=1");
A1.next();
C = A1.getString("count");
float V1C = Integer.parseInt(C);
A2 = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=2");
A2.next();
C = A2.getString("count");
float V2C = Integer.parseInt(C);


%>  
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      
        // Get the container element
        function ChangeActive(){
            var btns = document.getElementsByClassName("btn");
            btns[0].className += " active";
            
        }
         google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var food = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Katraj',     <%=A1C%>],
          ['Vakad',      <%=A2C%>]
        ]);
        
         var volunteers = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Katraj',     <%=V1C%>],
          ['Vakad',      <%=V2C%>]
        ]);

        var optionsV = {
          title: 'Volunteers',
          pieHole: 0.4
        };
        
        var optionsF = {
          title: 'Food Request',
           pieHole: 0.4
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(food, optionsF);
        chart2.draw(volunteers, optionsV);
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
                          <button type="submit" style="margin-left:700px;" class="au-btn au-btn-icon au-btn--blue au-btn--small">Download Report </button>
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
                                    <span>Volunteers</span>
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
     
                                   <h1>  Analysys Charts</h1>
                                   <br>                        
       <div id="piechart" style="margin: 10px;width: 550px; height: 400px;float: right;"></div>    
       <div id="piechart2" style="margin: 10px;width:550px; height: 400px;"></div>  
       
      
    </div>
    <!-- END MAIN CONTENT-->
    <!-- END PAGE CONTAINER-->
</div>  

</div>
</body>
</html>