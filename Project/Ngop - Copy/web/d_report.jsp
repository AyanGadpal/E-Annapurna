<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
ResultSet result = null,A;

A=null;
A = st.executeQuery("SELECT * from donor ORDER BY DonateAmt DESC LIMIT 10");
float arr[];
arr = new float[10];
String list[];
list = new String[10];
int i = 0;
while(A.next())
{
    arr[i] = A.getFloat("DonateAmt");
    list[i] = A.getString("DonorName");
    i++;    
}

A=null;
A = st.executeQuery("CALL `GET_MONTHWISEDONOR`();");
float arr2[];
arr2 = new float[4];
String list2[];
list2 = new String[4];
int j = 0;
while(A.next())
{
    arr2[j] = A.getFloat("total");
    list2[j] = A.getString("month");
    j++;    
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

            <h1 class="title-2 ">Donation Amount</h1>
            <canvas class="au-card-inner" id="myChart3"  style="width:5vw"> </canvas>

          </div>
        </div>
     
  </div>
        <div class="row">                            
         <div class="col-lg-10" style="margin: 0px auto;">
           <div class="au-card m-b-30">

            <h1 class="title-2 ">Donation Amount</h1>
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
        labels: ["<%=list[0]%>", "<%=list[1]%>", "<%=list[2]%>", "<%=list[3]%>", "<%=list[4]%>", "<%=list[5]%>", "<%=list[6]%>", "<%=list[7]%>", "<%=list[8]%>", "<%=list[9]%>"],

        datasets: [{

          label: '# Highest amount',
          data: [<%=arr[0]%>,<%=arr[1]%>,<%=arr[2]%>,<%=arr[3]%>,<%=arr[4]%>,<%=arr[5]%>,<%=arr[6]%>,<%=arr[7]%>,<%=arr[8]%>,<%=arr[9]%>],
          borderWidth: 2,     
          backgroundColor: ['#99DBF7', '#1988ff','#3AA4D8', '#93E1D8', '#4ca2ff','#7fbdff', '#DDFFF7']
        }]
      }
      
    });
    
    
    var ctx2 = document.getElementById('myChart3').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'line',
      data: {
      labels:[
        <%
        for(i=0;i< list2.length-1;i++)
        {
         %>"<%=list2[i]%>",<%
            
        }
        %>"<%=list2[i]%>"],
        
        datasets: [{
          label: '# Donation Per Month',
          data:[<%for(i=0;i< arr2.length-1;i++){%>"<%=arr2[i]%>",<%       
        }
        %>"<%=arr2[i]%>"],
          borderWidth: 2,     
          borderColor:'#3AA4D8',
          
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