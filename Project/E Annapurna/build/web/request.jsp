<jsp:include page="template.html"/>
<!DOCTYPE html>
<html>
<head>
    <script>

        // Get the container element
        function ChangeActive(){
          var btns = document.getElementsByClassName("nav-item");
          btns[4].className += " active";
      var qoute = document.getElementById("qoute").innerHTML="REQUEST FOOD";     
  	
          
        }
        
         function toddlerF() {
            toddler = document.getElementById("Toddler");
            Toddler_disp = document.getElementById("Toddler_disp");
            if (toddler.value != 300) {
                Toddler_disp.value = toddler.value;
            }
            else
                Toddler_disp.value = "300 +";
        }
        function adultF() {
            toddler = document.getElementById("adult");
            Toddler_disp = document.getElementById("adult_disp");
            if (toddler.value != 300) {
                Toddler_disp.value = toddler.value;
            }
            else
                Toddler_disp.value = "300 +";
        }
        function elderF() {
            toddler = document.getElementById("elder");
            Toddler_disp = document.getElementById("elder_disp");
            if (toddler.value != 300) {
                Toddler_disp.value = toddler.value;
            }
            else
                Toddler_disp.value = "300 +";
        }

        function childrenF() {
            toddler = document.getElementById("children");
            Toddler_disp = document.getElementById("children_disp");
            if (toddler.value != 300) {
                Toddler_disp.value = toddler.value;
            }
            else
                Toddler_disp.value = "300 +";
        }

        function AdolescentF() {
            toddler = document.getElementById("Adolescent");
            Toddler_disp = document.getElementById("Adolescent_disp");
            if (toddler.value != 300) {
                Toddler_disp.value = toddler.value;
            }
            else
                Toddler_disp.value = "300 +";
        }

      </script>
	<title>Request Food</title>
</head>
<body>
  <section class="TopContain">
        <div class="container2">
            <%@page import="java.sql.*,java.util.*"%>
 
            
             <form action="validateConsumer.jsp">
                <label><h1>Request Food</h1></label><br><br>
                <label>Name of Hunger Area</label>
                <input type="text" id="nameHunger" name="hname" placeholder="Your name.."><br><br>
                <%  
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
                    Statement st=conn.createStatement();
                %>
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
        %>
                </select><br><br>

                <label>Type of shelter</label>
                <select id="shelter" name="typeofshelter">
                        <option value="Orphanage">Orphanage</option>
                        <option value="OldAgeHome">Old Age Home</option>
                        <option value="EducationInstitude">Education Institude</option>
                        <option value="NightShelter">Night Shelter Home</option>
                        <option value="Creche">Creche/ Nursery</option>
                        <option value="Slum">Slum/ Jhuggi/ Basti</option>
                        <option value="Other">Other</option>
                    </select><br><br>

                <label>Contact No</label>
                <input type="number" id="contact" name="phoneno" placeholder="Your Contact no."><br><br>

                <label>What type food you accept ?</label>
                 <%  
 
        result = null;
        result = st.executeQuery("select * from total_food");
        while(result.next())
        {
        %>
       <br><input name="foodChoice" id="R1" value="<%=result.getString("FoodID")%>" type="radio"><label><%=result.getString("food_type")%></label>
        <%
        }
   
%>

 
      

               

                <br><label><h1>Beneficiaries Number</h1></label><br><br>

                <label>Toddler (Below 5 years old) </label>
                <br>
                <div class="slidecontainer">

                    <div id="week"> <output id="Toddler_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="toddler" id="Toddler" class="slider" value="1"  min="1" max="300"
                        oninput="toddlerF()">

                </div><br><br>

                <label>Children (5-12 years old) </label>
                <br>
                <div class="slidecontainer">

                    <div id="week"> <output id="children_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="children" id="children" class="slider" value="1" min="1" max="300"
                        oninput="childrenF()">

                </div><br><br>

                <label>Adolescent (12- 20 years old) </label>
                <br>
                <div class="slidecontainer">

                    <div id="week"> <output id="Adolescent_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="adolescent" id="Adolescent" class="slider" value="1" min="1" max="300"
                        oninput="AdolescentF()">

                </div><br><br>

                <label>Adult (20- 50 years old)</label>
                <br>
                <div class="slidecontainer">

                    <div id="week"> <output id="adult_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="adult" id="adult" class="slider" value="1" min="1" max="300"
                        oninput="adultF()">

                </div><br><br>

                <label>Elderly (50 and above)</label>
                <br>
                <div class="slidecontainer">

                    <div id="week"> <output id="elder_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="elderly" id="elder" class="slider" value="1" min="1" max="300"
                        oninput="elderF()">

                </div><br><br>




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

            <p>
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
  </p>
          </div>
        </div>
      </div>
    </footer>
</body>
</html>