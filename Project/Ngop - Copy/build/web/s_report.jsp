<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null,A;

A=null;
A = st.executeQuery("SELECT * from sponsors ORDER BY fund DESC LIMIT 10");

float arr[], food[], raw[];
String list_raw[], list_food[], list_fund[];

arr = new float[10];
food = new float[10];
raw = new float[10];

list_raw = new String[10];
list_food = new String[10];
list_fund = new String[10];
int i = 0;

while(A.next())
{
    arr[i] = A.getFloat("fund");
    list_fund[i] = A.getString("spn_nm");
    i++;    
}

i = 0; 
A = st.executeQuery("SELECT * from sponsors ORDER BY food DESC LIMIT 10");
while(A.next())
{
    food[i] = A.getInt("food");
    list_food[i] = A.getString("spn_nm");
    i++;    
}

i = 0;
A = st.executeQuery("SELECT * from sponsors ORDER BY rawgrain DESC LIMIT 10");
while(A.next())
{
    raw[i] = A.getInt("rawgrain");
    list_raw[i] = A.getString("spn_nm");
    i++;    
}
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
        <h1>Analysis Charts</h1>
        <br>    
        <div class="row">                            
         <div class="col-lg-10" style="margin: 0px auto;">
           <div class="au-card m-b-30">

            <h1 class="title-2 ">Donated Fund</h1>
            <canvas class="au-card-inner" id="myChart2"  style="width:5vw"> </canvas>

          </div>
         </div> 
        </div>
        
        <div class="row">                            
         <div class="col-lg-10" style="margin: 0px auto;">
           <div class="au-card m-b-30">

            <h1 class="title-2 ">Donated Food</h1>
            <canvas class="au-card-inner" id="myChart3"  style="width:5vw"> </canvas>

          </div>
         </div> 
        </div>
        
        <div class="row">                            
         <div class="col-lg-10" style="margin: 0px auto;">
           <div class="au-card m-b-30">

            <h1 class="title-2 ">Donated Raw Grain</h1>
            <canvas class="au-card-inner" id="myChart4"  style="width:5vw"> </canvas>

          </div>
         </div> 
        </div>
  

  <script src="./Chart.js"></script>

  <script>



    var ctx2 = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'pie',
      data: {
        labels: ["<%=list_fund[0]%>", "<%=list_fund[1]%>", "<%=list_fund[2]%>", "<%=list_fund[3]%>", "<%=list_fund[4]%>", "<%=list_fund[5]%>", "<%=list_fund[6]%>", "<%=list_fund[7]%>", "<%=list_fund[8]%>", "<%=list_fund[9]%>"],

        datasets: [{

          label: '# Highest Amount',
          data: [<%=arr[0]%>,<%=arr[1]%>,<%=arr[2]%>,<%=arr[3]%>,<%=arr[4]%>,<%=arr[5]%>,<%=arr[6]%>,<%=arr[7]%>,<%=arr[8]%>,<%=arr[9]%>],
          borderWidth: 2, 
          backgroundColor: ['#99DBF7', '#1988ff','#3AA4D8', '#93E1D8', '#4ca2ff','#7fbdff', '#DDFFF7']
        }]
      }      
    });
    
    var ctx2 = document.getElementById('myChart3').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ["<%=list_food[0]%>", "<%=list_food[1]%>", "<%=list_food[2]%>", "<%=list_food[3]%>", "<%=list_food[4]%>", "<%=list_food[5]%>", "<%=list_food[6]%>", "<%=list_food[7]%>", "<%=list_food[8]%>", "<%=list_food[9]%>"],

        datasets: [{

          label: '# Highest Donated Food',
          data: [<%=food[0]%>,<%=food[1]%>,<%=food[2]%>,<%=food[3]%>,<%=food[4]%>,<%=food[5]%>,<%=food[6]%>,<%=food[7]%>,<%=food[8]%>,<%=food[9]%>],
          borderWidth: 2, 
          backgroundColor: ['#99DBF7', '#1988ff','#3AA4D8', '#93E1D8', '#4ca2ff','#7fbdff', '#DDFFF7']
        }]
      }      
    });
    
    var ctx2 = document.getElementById('myChart4').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ["<%=list_raw[0]%>", "<%=list_raw[1]%>", "<%=list_raw[2]%>", "<%=list_raw[3]%>", "<%=list_raw[4]%>", "<%=list_raw[5]%>", "<%=list_raw[6]%>", "<%=list_raw[7]%>", "<%=list_raw[8]%>", "<%=list_raw[9]%>"],

        datasets: [{

          label: '# Highest Donnted Raw-Grain',
          data: [<%=raw[0]%>,<%=raw[1]%>,<%=raw[2]%>,<%=raw[3]%>,<%=raw[4]%>,<%=raw[5]%>,<%=raw[6]%>,<%=raw[7]%>,<%=raw[8]%>,<%=raw[9]%>],
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