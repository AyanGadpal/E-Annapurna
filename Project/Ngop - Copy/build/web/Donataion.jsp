
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
            btns[3].className += " active";
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
                              <h1>Donation </h1>
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
                   
                    <div class="col-lg-6">
                                <!-- TOP CAMPAIGN-->
                               <div class="top-campaign">
                                    <h3 class="title-3 m-b-30">top Donation</h3>
                                    <div class="table-responsive">
                                        <%
                                        ResultSet A = st.executeQuery("SELECT * from donor ORDER BY DonateAmt DESC LIMIT 10");
                                        %>
                                        <table class="table table-top-campaign">
                                            <tbody>
                                                <%while(A.next()){
                                                    %>
                                                    <tr>
                                                    <td><%=A.getString("DonorName")%></td>
                                                    <td><%=A.getString("DonateAmt")%></%></td>
                                                    </tr>
                                                <%
                                                    
                                                }%>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                            </div>  
                         <div class="col-lg-3">
                                <div class="au-card au-card--bg-blue au-card-top-countries m-b-30">
                                    <div class="au-card-inner">
                                        <h3 class="title-3 m-b-30" style="color:#fff;">Recent Donation</h3>
                                        <div class="table-responsive">
                                            <table class="table table-top-countries">
                                                <%
                                                A = st.executeQuery("SELECT * from donor ORDER BY d_id DESC LIMIT 10");
                                                %>
                                                <tbody>
                                                    <%while(A.next()){
                                                    %>
                                                    <tr>
                                                    <td><%=A.getString("DonorName")%></td>
                                                    <td><%=A.getString("DonateAmt")%></%></td>
                                                    </tr>
                                                <%
                                                    
                                                }%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                    <div class="row">
                            <div class="col-lg-9">
                                <div class="table-responsive table--no-card m-b-30">
                                    <table class="table table-borderless table-striped table-earning">
                                
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>PAN</th>
                                                <th>Address</th>
                                                <th class="text-right">Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                              ResultSet result = null;
                                              result = st.executeQuery("select * from donor");                                                
                                              while(result.next()){
                                            %>
                                                <tr>
                                                <th><%=result.getString("DonorName")%></th>
                                                <th><%=result.getString("DonorPan")%></th>
                                                <th><%=result.getString("DonorAddress")%></th>
                                                <th><%=result.getString("DonateAmt")%></th>
                                                <tr>
                                                <%}%>
                                           
                                        </tbody>
                                    </table>
                             
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