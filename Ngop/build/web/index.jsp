<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null,A;

A=null;
A = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=1");
A.next();
String C = A.getString("count");
float A1C = Integer.parseInt(C);
A = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=2");
A.next();
C = A.getString("count");
float A2C = Integer.parseInt(C);
A = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=3");
A.next();
C = A.getString("count");
float A3C = Integer.parseInt(C);
A = st.executeQuery("select count(C_ID) as 'count' from `consumer` where AreaID=4");
A.next();
C = A.getString("count");
float A4C = Integer.parseInt(C);

A = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=1");
A.next();
C = A.getString("count");
float V1C = Integer.parseInt(C);
A = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=2");
A.next();
C = A.getString("count");
float V2C = Integer.parseInt(C);
A = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=3");
A.next();
C = A.getString("count");
float V3C = Integer.parseInt(C);
A = st.executeQuery("select count(v_id) as 'count' from `volunteer` where AreaID=4");
A.next();
C = A.getString("count");
float V4C = Integer.parseInt(C);

%>  
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="./Chart.js"></script>
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
                            <canvas  id="myChart3"></canvas>
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
<div class="row">                                  
<div class="col-lg-6">
 <div class="au-card m-b-30">

    <h1 class="title-2 ">Volunteers</h1>
<canvas style="width:40vw;;height:50vh;"  class="au-card-inner" id="myChart2"  style="width=5vw"> </canvas>

     </div>
    </div>
   
 <div class="col-lg-6">
 <div class="au-card m-b-30">                                  

    <h1 class="title-2 ">Food Requiest</h1>
<canvas style="width:40vw;;height:50vh;"  class="au-card-inner" id="myChart"  style="width=5vw"> </canvas>


   </div> 
 </div>
    
    <div class="col-lg-6">
 <div class="au-card m-b-40">                                  
<div  >
    <h1 class="title-2 ">Some Graph</h1>
<canvas style="width:35vw;;height:70vh;"  class="au-card-inner"  style="width=5vw"> </canvas>
</div>

   </div> 
 </div>
    </div>
   

<script src="./Chart.js"></script>

<script>



var ctx2 = document.getElementById('myChart2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ['Katraj', 'Vakad', 'Swargate', 'Shivaji Nagar'],

        datasets: [{

            label: '# of Votes',
            data: [<%=V1C%>,<%=V2C%>,<%=V3C%>,<%=V4C%>],
            borderWidth: 2,
           
            
            
           backgroundColor: ['#ededed', '#1988ff', '#4ca2ff', '#7fbdff']
        }]
    }
   
});

var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Katraj', 'Vakad', 'Swargate', 'Shivaji Nagar'],

        datasets: [{

            label: '# of Votes',
            data: [<%=A1C%>,<%=A2C%>,<%=A3C%>,<%=A4C%>],
            borderWidth: 2,

            backgroundColor: ['#ededed', '#1988ff', '#4ca2ff', '#7fbdff']
        }]
    }
   
});

var ctx3 = document.getElementById('myChart3').getContext('2d');
var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: false,
            data: [1, 2, 5, 4, 5, 2.5],
          
        }]
    },
    options: {
    	elements: {
            line: {
                tension: 0 // disables bezier curves
            }
        }
        
    }
});

</script>
      
    </div>
    <!-- END MAIN CONTENT-->
    <!-- END PAGE CONTAINER-->
</div>  

</div>
</body>
</html>