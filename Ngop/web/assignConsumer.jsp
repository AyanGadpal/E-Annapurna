<jsp:include page="template.html"/>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<%@page import="java.sql.*,java.util.*"%>
<%  
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
Statement st=conn.createStatement();

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
					<div class="container-fluid"><form action="CVmapping.jsp" method="POST">
						<div class="header-wrap">
							<div class="header-button">
								<h1>Assign Volunteers</h1>
								<button type="submit" style="margin-left:600px;" class="au-btn au-btn-icon au-btn--blue au-btn--small">ASSIGN VOLUNTEERS</button>
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
					String cid = request.getParameter("cid");
					ResultSet result = null,consumer = null;
					consumer = st.executeQuery("select * from consumer where C_id = '"+cid+"'");
					consumer.next();
					String cname = consumer.getString("hname");
					String area = consumer.getString("AreaID");
					int areaid = Integer.parseInt(area);
					result = st.executeQuery("select * from volunteer where AreaID = "+areaid+" and status = 0");
					session.setAttribute("cid", cid);
					%>
					<h1>Consumer Name : <%=cname%></h1>
					
					
					<dv class="col-md-12">
						<!-- DATA TABLE -->
						<h3 class="title-5 m-b-35">Select Volunteers</h3>
						
						<div class="table-responsive table-responsive-data2">
							
							<table class="table table-data2">
								<thead>
									<tr>
										<th class="text-left">Select</th>
										<th>Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Area</th>
										<th class="text-right">Organization</th>
										<th class="text-right">Education</th>
										
										
										
									</tr>
								</thead>
								<tbody>
									<%int k =0;
									while(result.next()){
									
									
									%>
									<tr class="tr-shadow">
										
										<th class="text-left"><input name="<%=String.valueOf(k)%>"
											value="<%=result.getString("v_id")%>"
											type="checkbox"></th> 
											<th><%=result.getString("fname")%></th>
											<th><%=result.getString("email")%></th>
											<th><%=result.getString("mobno")%></th>
											<th><%=result.getString("AreaId")%></th>
											<th class="text-right"><%=result.getString("organization")%></th>
											<th class="text-right"><%=result.getString("education")%></th>
										
									</tr>
									<tr class="spacer"></tr>
									
									
									
									
									<%k++;}%>
									
								</tbody>
							</table>
						</form>
					</div>
					<!-- END DATA TABLE -->
				</div>
				
			</div>
		</div>
		<!-- END MAIN CONTENT-->
		<!-- END PAGE CONTAINER-->
	</div>  

</div>
</body>
</html>