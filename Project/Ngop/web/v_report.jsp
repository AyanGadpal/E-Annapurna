<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null,A;

A=null;
A = st.executeQuery("call volunteers_per_week()");
A.next();
int mon = A.getInt("mon");
int tue = A.getInt("tue");
int wed = A.getInt("wed");
int thu = A.getInt("thu");
int fri = A.getInt("fri");
int sat = A.getInt("sat");
int sun = A.getInt("sun");
%>  
<html lang="en">
<head>
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
                        result = st.executeQuery("select count(v_id) as count from volunteer where status = 0");
                        result.next();
                        int a = result.getInt("count");
                         
                        result = st.executeQuery("select count(v_id) as count from volunteer where status = 1");
                        result.next();
                        int b = result.getInt("count");
                        
                        result = st.executeQuery("select count(v_id) as count from volunteer where status = -1");
                        result.next();
                        int p = result.getInt("count");
                        
                        result = st.executeQuery("select count(v_id) as count from volunteer where status = 2");
                        result.next();
                        int n = result.getInt("count");
                        
                                    // GET COUNT
                        %>
                        <!-- SET COUNT TO BOX-->
                        <h2><%=a%></h2>
                        <span>Available Volunteers</span>
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
                      <div class="text">
                                
                      
                      <h2><%=b%></h2>
                      <span>Busy Volunteers</span>
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
                    <div class="text">
                               
                    <h2> <%=p%></h2>
                    <span>Passive Volunteers</span>
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
                  <div class="text">
                  <h2> <%=n%></h2>
                  <span>Not Available</span>
                </div>
              </div>
              <div class="overview-chart">
                <canvas id="widgetChart3"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <h1>  Analysis Charts</h1>
      <br>   
      <div class="row">                                  
        <div class="col-lg-10">
         <div class="au-card m-b-30">

          <h1 class="title-2 ">Volunteers</h1>
          <canvas class="au-card-inner" id="myChart2"  style="width:5vw"> </canvas>

        </div>
      </div>
     
  </div>
  

  <script src="./Chart.js"></script>

  <script>



    var ctx2 = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ['Sunday', 'Monday', 'Thuesday', 'Wednesday', 'Thurday', 'Friday', 'Saturday'],

        datasets: [{

          label: '# of Volunteers',
          data: [<%=sun%>,<%=mon%>,<%=tue%>,<%=wed%>,<%=thu%>,<%=fri%>,<%=sat%>],
          borderWidth: 2,     
          backgroundColor: ['#99DBF7', '#1988ff','#3AA4D8', '#93E1D8', '#4ca2ff','#7fbdff', '#DDFFF7']
        }]
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