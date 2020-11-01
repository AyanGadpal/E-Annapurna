<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();
Statement st2=conn.createStatement();
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
                    <h1>Assign Report</h1>
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
             // Get the Consumer
             ResultSet consumer = null;
             String cid =(String)session.getAttribute("cid");
             consumer = st.executeQuery("select * from consumer where C_id = '"+cid+"'");    
             consumer.next();
             
             // Their Area and food and hname
             String hname = consumer.getString("hname");
             String area = consumer.getString("AreaID");
             String food = consumer.getString("FoodID");
             int areaid = Integer.parseInt(area);
             
             // Get the count of Total Volunteers
             result = st.executeQuery("select * from volunteer where AreaID = "+areaid+" and status = 0");
             result.last();
             int total_vol = result.getRow();
             int cidi = Integer.parseInt(cid);
             int foodid = Integer.parseInt(food);
             
             
             // Create the Entery in the Allocation Table
             st2.executeUpdate("INSERT INTO `allocation` (`AllID`, `C_ID`, `FoodID`) VALUES (NULL, '"+cidi+"', '"+foodid+"');");
             
             // Allocation ID 
             consumer = st.executeQuery("SELECT * FROM `allocation`");
             consumer.last();
             String AL = consumer.getString("AllID");
             int ALID = Integer.parseInt(AL);
             int cnt = 0;
             // Put Entry into Volunteer Allocation Table
             for(int k=0;k<total_vol;k++)
               {
                   
                 // Checking The Checkbox Value
                 String val = request.getParameter(String.valueOf(k));
                 
                 // Take Only Selected Volunteers
                 if(val != null)
                 {
                   int vid = Integer.parseInt(val);
                   cnt++;
                   // Mapping the AiiID with VID 
                   st.executeUpdate("INSERT INTO `vol_allocation` (`AllID`, `v_id`) VALUES ('"+ALID+"', '"+vid+"'); ");
                                 
                   // Updateing Status of Volunteers
                   st.executeUpdate("UPDATE `volunteer` SET `status` = '1' WHERE `volunteer`.`v_id` = "+vid+"");
                 }
               }
               
               if(cnt == 0)
               {     
                   response.sendRedirect("Assign.jsp");
               }
               else
               {
               
               %>
               

               <div class="sufee-alert alert with-close alert-success alert-dismissible fade show">
                 <span class="badge badge-pill badge-success">Success</span>
                 The Volunteers successfully got Assigned to the Consumer.
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
                 <!--               INDICATING USER TO GO BACK-->
              <a style="margin-left:10%;"class="btn btn-outline-primary" href="Assign.jsp" role="button">Select Another Consumer</a>
              </div>
               <h1>Report</h1>
               <%
                result = st.executeQuery("select * from vol_allocation where AllID = "+ALID+"");
               %>
               <br>
               
               <h3>Consumer Name : <%=hname%></h3>
               <br><br>
               <h4>Volunteer Assigned</h4>
              
               <ol>
               <%while(result.next())
               {
                   String vid = result.getString("v_id");
                   consumer = st2.executeQuery("select * from volunteer where v_id = "+Integer.parseInt(vid)+"");
                   consumer.next();
                   String fname = consumer.getString("fname");
                   String lname = consumer.getString("lname");
                   %>
                  <h5> <li><%=" "+fname+" "+lname%></li></h5>
               <%
               

}}%> </ol>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
          </div>  

        </div>
      </body>
      </html>