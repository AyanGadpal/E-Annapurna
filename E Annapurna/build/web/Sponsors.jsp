    <jsp:include page="template.html"/>
<!DOCTYPE html>
<html>
<head>
    <%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();%>
    <script>

        // Get the container element
        function ChangeActive(){
          var btns = document.getElementsByClassName("nav-item");
          btns[1].className += " active";
      var qoute = document.getElementById("qoute").innerHTML="SPONSORS";     
  	
          
        }
        
          function  call1() {
                    if( document.getElementById("food").checked)
                    {
                        document.getElementById("foodQ").style.display = "block";
                    }
                    else
                    {
                        document.getElementById("foodQ").style.display = "none";
                    }
                }
                function  call2() {
                    if( document.getElementById("rawgrain").checked)
                    {
                        document.getElementById("rawQ").style.display = "block";
                    }
                    else
                    {
                        document.getElementById("rawQ").style.display = "none";
                    }
                }
                function  call3() {
                    if( document.getElementById("fund").checked)
                    {
                        document.getElementById("fundQ").style.display = "block";
                    }
                    else
                    {
                        document.getElementById("fundQ").style.display = "none";
                    }
                }
      </script>
	<title>Sponours</title>
</head>
<body>
    <section class="TopContain">
        <div class="container2">
            
            
            <form action="validateSponsours.jsp">
                  <label>Individual / Organization Name</label>
                  <input type="text" id="fname" required name="spn_nm" placeholder="Organization/Individual"><br><br>


                  <label>What is the Partnering entity?</label>
                  <select id="PartneringEntity" required name="whatentry">
                    <option value="Restaurant">Restaurant</option>
                    <option value="Hospital">Hospital</option>
                    <option value="RWA">RWA</option>
                    <option value="EventCaterer">Event Caterer</option>
                    <option value="Factory">Factory</option>
                    <option value="Hotel">Hotel</option>
                    <option value="Individual">Individual</option>
                    <option value="College_School">College/ School</option>
                    <option value="SocialGroup">SocialGroup</option>
                    <option value="Mess">Cooked Food supplier/ Mess/ Canteen</option>

                </select><br><br>

                <label>How do you want to Partner? </label><br>
                <script type="text/javascript">

                    function  call1() {
                        if( document.getElementById("food").checked)
                        {
                            document.getElementById("foodQ").style.display = "block";
                        }
                        else
                        {
                            document.getElementById("foodQ").style.display = "none";
                        }
                    }
                    function  call2() {
                        if( document.getElementById("rawgrain").checked)
                        {
                            document.getElementById("rawQ").style.display = "block";
                        }
                        else
                        {
                            document.getElementById("rawQ").style.display = "none";
                        }
                    }
                    function  call3() {
                        if( document.getElementById("fund").checked)
                        {
                            document.getElementById("fundQ").style.display = "block";
                        }
                        else
                        {
                            document.getElementById("fundQ").style.display = "none";
                        }
                    }
                </script>
                <input name="food" id="food" type="checkbox" onchange="call1()"><label>Donate Food</label><br>
                <input style="display: none;" type="number" placeholder="Food Amount (Kg)"  id="foodQ" name="foodQ">

                <input name="rawgrain"  id="rawgrain" type="checkbox" onchange="call2()"><label>Donate Raw Grains</label><br>
                <input style="display: none;" type="number" placeholder="Raw Amount (Kg)" id="rawQ" name="rawQ">

                <input name="fund" id="fund" type="checkbox" onchange="call3()"><label>Donate Funds to support the Project </label>
                <input style="display: none;" type="number" placeholder="Fund ($)" id="fundQ" name="fundQ">

                <br><br>


                <label>Contact No</label>
                <input required type="number" id="contact" name="phnno" placeholder="Your Contact no."><br><br>

                <label>Email</label>
                <input required type="email" id="email" name="email" placeholder="Your Email"><br><br>

               <!--  <label>Designation/ Your Role</label>
                <input type="text" id="lname" name="designation" placeholder="Your Designation/ Your Role.."><br><br -->

                <label>Area</label>
                <select required id="Area" name="area">
                 <%  

                 ResultSet result = null;
                 result = st.executeQuery("select * from area");
                 while(result.next())
                    {
                    %>
                        <option value="<%=result.getString("AreaID")%>"><%=result.getString("areaName") %></option>    
                  <%}%>
                    </select>
                    <br><br>
                    <input type="submit" value="Submit">

                </form>
            
        </div>
    </section>
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

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
</body>
</html>