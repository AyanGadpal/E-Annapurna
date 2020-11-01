<jsp:include page="template.html"/>
<!DOCTYPE html>
<html>
<head>
    <script>

        // Get the container element
        function ChangeActive(){
          var btns = document.getElementsByClassName("nav-item");
          btns[2].className += " active";
      var qoute = document.getElementById("qoute").innerHTML="BECOME A VOUNTEER";     
  	
          
        }
      </script>
	<title>Volunteers</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();%>
    
    <section class="TopContain">
        <div class="container2">
    <form action="validateVolunteer.jsp">

                <label>First Name</label>
                <input required type="text" id="fname" name="fname" placeholder="Your name.."><br><br>

                <label>Last Name</label>
                <input required type="text" id="lname" name="lname" placeholder="Your last name.."><br><br>

                <label>Email</label>
                <input required type="email" id="email" name="email" placeholder="Your Email"><br><br>

                <label>Contact No</label>
                <input required type="number" id="contact" name="number" placeholder="Your Contact no."><br><br>

                <label>Birth Date</label>
                <input required type="date" id="contact" name="DOB"><br><br>

                <label>School / College / Company / Organization</label>
                <input required type="text" id="contact" name="organization" placeholder="Your Answer"><br><br>

                <label>Highest Education</label>
                <input required type="text" id="contact" name="education" placeholder="Your Answer"><br><br>

                <label>Area</label>
                <select id="Area" name="area">
                    <%  
 
        ResultSet result = null;
        result = st.executeQuery("select * from area");
        while(result.next())
        {
        %>
        <option value="<%=result.getString("AreaID")%>"><%=result.getString("areaName") %></option>    
        <%
        }
   
        %></select><br><br>

                <label>Why do you want to Join us?</label>
                <textarea required id="subject" name="whytojoin" placeholder="Write something.."
                    style="height:200px"></textarea><br><br>


               <label>How much Time could you spend a Week ?</label>
               <br><br>
               <input name="Monday" value="1" type="checkbox"><label>Monday</label>&nbsp;&nbsp;&nbsp;
               <input name="tuesday" value="1" type="checkbox"><label>Tuesday</label>&nbsp;&nbsp;&nbsp;
               <input name="wednesday" value="1" type="checkbox"><label>Wednesday</label>&nbsp;&nbsp;&nbsp;
               <input name="thursday" value="1" type="checkbox"><label>Thursday</label>&nbsp;&nbsp;&nbsp;
               <input name="friday" value="1" type="checkbox"><label>Friday</label>&nbsp;&nbsp;&nbsp;
               <input name="saturday" value="1" type="checkbox"><label>Saturday</label>&nbsp;&nbsp;&nbsp;
               <input name="sunday" value="1" type="checkbox"><label>Sunday</label>
                
                <br><br><br>
   
                <input type="submit" value="Submit">

                </form></div></section>
        <footer class="ftco-footer ftco-section img">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-5">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About Us</h2>
              <p>"If you can't feed a hundred people, then feed just one." -    Mother Teresa</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
            
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Site Links</h2>
              <ul class="list-unstyled">
               <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="Sponsors.jsp" class="nav-link">Sponsor</a></li>
          <li class="nav-item"><a href="Volunteers.jsp" class="nav-link">Join us</a></li>
          <li class="nav-item"><a href="donate.jsp" class="nav-link">Donate</a></li>
          <li class="nav-item"><a href="request.jsp" class="nav-link">Request Food</a></li>
          <li class="nav-item"><a href="Gallery.jsp" class="nav-link">Gallery</a></li>
          <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">Survey No. 27, Near, Trimurti Chowk, Bharati Vidyapeeth Campus, Dhankawadi, Pune, Maharashtra 411043</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+91 77570 25466</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@EAnnapurna.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p>
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
</p>
          </div>
        </div>
      </div>
    </footer>
    
    
    
    
</body>
</html>