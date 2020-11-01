<%-- 
    Document   : volunteerData
    Created on : Oct 11, 2019, 3:08:11 PM
    Author     : Janak
    --%>
    <jsp:include page="template.html"/>
    <!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
    <%@page import="java.sql.*,java.util.*"%>
    <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();
    ResultSet result;
    %> 

    <!DOCTYPE html>
    <html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>JSP Page</title>
        <script src="./Chart.js"></script>


    </head>
    <body>
    	<%
    	String v = request.getParameter("vid");
    	result = st.executeQuery("select * from volunteer where v_id = '"+v+"'");
    	result.next();
    	String name = result.getString("fname");
    	String lname = result.getString("lname");
    	int gender = Integer.parseInt((result.getString("gender")));
    	String mail =  result.getString("email");
    	String mob = result.getString("mobno");
    	String dob = result.getString("DOB");
    	String org = result.getString("organization");
    	String edu = result.getString("education");
    	String join = result.getString("why_to_join");
    	String duration = result.getString("duration");  
    	String status = result.getString("status");
        String date = result.getString("date_tran");
        int areaId = result.getInt("AreaID");
        result = st.executeQuery("select areaName from area where AreaID = "+areaId+"");
    	result.next();
        String Area = result.getString(1);
        result = st.executeQuery("call vol_served_count("+v+")");
        result.next();
        String served = result.getString(1);
        
    	%>
    	<div class="page-wrapper">
    		<!-- PAGE CONTAINER-->
    		<div class="page-container">
    			<!-- HEADER DESKTOP-->
    			<header class="header-desktop">
    				<div class="section__content section__content--p30">
    					<div class="container-fluid">
    						<div class="header-wrap">
    							<div class="header-button">
    								<h1><%=name+" "+lname%> Details</h1>
    							</div>
    						</div>
    					</div>
    				</div>
    			</header>
    			<!-- HEADER DESKTOP-->

    			<!-- MAIN CONTENT-->
    			<div class="main-content">
<div class="section__content section__content--p30">
                    <div class="container-fluid">
                            <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong class="card-title mb-3">Volunteer Detail</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            
                                            <h2 class="text-sm-center mt-2 mb-1"><%=name+" "+lname%></h2>
                                            <div class="location text-sm-center">
                                                <i class="fa fa-map-marker"></i> <%=Area%>, Pune</div>
                                        </div>
                                        <hr>
                                        <%
                                            String Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday;
                                            Sunday = duration.substring(0,1).equals("1") ? "success":"secondary" ;
                                            Monday = duration.substring(1,2).equals("1") ? "success":"secondary" ;
                                            Tuesday = duration.substring(2,3).equals("1") ? "success":"secondary" ;
                                            Wednesday = duration.substring(3,4).equals("1") ? "success":"secondary" ;
                                            Thursday = duration.substring(4,5).equals("1") ? "success":"secondary" ;
                                            Friday = duration.substring(5,6).equals("1") ? "success":"secondary" ;
                                            Saturday = duration.substring(6,7).equals("1") ? "success":"secondary" ;
                                            String CS=null,color=null;
                                            if(status.equals("0"))
                                            {
                                                CS = "AVAILABLE";
                                                color = "blue";
                                            }
                                            if(status.equals("1"))
                                            {
                                                CS = "BUSY";
                                                color = "green";
                                            }
                                            if(status.equals("2"))
                                            {
                                                CS = "NOT AVAILABLE";
                                                color = "red";
                                            }
                                        %>
                                        <button type="button" class="btn btn-<%=Sunday%> btn-sm">Sunday</button>
                                        <button type="button" class="btn btn-<%=Monday%> btn-sm">Monday</button>
                                        <button type="button" class="btn btn-<%=Tuesday%> btn-sm">Tuesday</button>
                                        <button type="button" class="btn btn-<%=Wednesday%> btn-sm">Wednesday</button>
                                        <button type="button" class="btn btn-<%=Thursday%> btn-sm">Thursday</button>
                                        <button type="button" class="btn btn-<%=Friday%> btn-sm">Friday</button>
                                        <button type="button" class="btn btn-<%=Saturday%> btn-sm">Saturday</button>
                                        
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-6 ">
                                                                               <p><b>Join Date</b> : <%=date%></p>
                                                                                       
                                                                                <p><b>Email </b><%=mail%>@mail.com </p>   
                                                                      
                                                                                <p><b>Contact</b> <%=mob%></p>   
                                                                       
                                                                                <p><b>Birthday</b>  <%=dob%></p>   
                                                                                
                                                                                <p><b>Organization</b>  <%=org%></p>   
                                                                                
                                                                                <p><b>Education </b> <%=edu%></p> 
                                                                               
                                                                                <p ><b>Current status</b> <font style="color:<%=color%>"> <%=CS%> </font></p>
                                                                           
                                                                                <p><b>Motive</b>  <%=join%> </p>
                                                                                 <p><b>Total Consumer Served</b>  <%=served%> </p>
                                                                                
                                        </div>
                                           
                                        <div class="col-md-6">
                                        <p class="card-text text-sm-center mt-2 mb-1">Service</p>
            <canvas style="width:40vw;;height:50vh;"  class="au-card-inner" id="myChart2"  style="width:5vw"> </canvas>
            <hr><p><b>Note</b> The Formula to calculate the "Service" of Volunteer is Total days he/she worked upon Total days they were Available</p>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
 <%
                                                                        ResultSet K = st.executeQuery("call percentOf("+v+")");
                                                                        K.next();
                                                                        float per = K.getFloat("per");
                                                                        per *= 100;
                                                                        float antiPer = 100 - per;
                                                                        String perS = String.format("%.1f", per) ;
%>

                                        <script>
                                            Chart.pluginService.register({
		beforeDraw: function (chart) {
			if (chart.config.options.elements.center) {
        //Get ctx from string
        var ctx = chart.chart.ctx;
        
				//Get options from the center object in options
        var centerConfig = chart.config.options.elements.center;
      	var fontStyle = centerConfig.fontStyle || 'Arial';
				var txt = centerConfig.text;
        var color = centerConfig.color || '#000';
        var sidePadding = centerConfig.sidePadding || 20;
        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
        //Start with a base font of 30px
        ctx.font = "30px " + fontStyle;
        
				//Get the width of the string and also the width of the element minus 10 to give it 5px side padding
        var stringWidth = ctx.measureText(txt).width;
        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

        // Find out how much the font can grow in width.
        var widthRatio = elementWidth / stringWidth;
        var newFontSize = Math.floor(30 * widthRatio);
        var elementHeight = (chart.innerRadius * 2);

        // Pick a new font size so it will not be larger than the height of label.
        var fontSizeToUse = Math.min(newFontSize, elementHeight);

				//Set font settings to draw it correctly.
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
        ctx.font = fontSizeToUse+"px " + fontStyle;
        ctx.fillStyle = color;
        
        //Draw text in center
        ctx.fillText(txt, centerX, centerY);
			}
		}
	});
                                            
                                             var ctx2 = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx2, {
      type: 'doughnut',
      data: {
        labels: ['Busy', 'Idea'],

        datasets: [{

          label: '# of Votes',
          data: [<%=per%>,<%=antiPer%>],
          borderWidth: 4,
          
          
          
          backgroundColor: ['#0077ff','#ededed']
        }]
      },
      options: {
			elements: {
				center: {
                                   
					text: '<%=perS%>%',
          color: '#0077ff', // Default is #000000
          fontStyle: 'Arial', // Default is Arial
          sidePadding: 20 // Defualt is 20 (as a percentage)
				}
			}
		}
      
    });
                                        </script>
                            
                        </div>  
                    </div>  
</div>
    				
    			</div>
    		</body>
    		</html>
