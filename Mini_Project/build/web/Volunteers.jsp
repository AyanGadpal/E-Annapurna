    <!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

<%@page import="java.sql.*,java.util.*"%>
 <%  
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo", "root", "");
    Statement st=conn.createStatement();%>
<head>
    <meta charset="UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
    <link href="extra.css" rel="stylesheet" type="text/css">
    <title>
        Feeding Hand
    </title>
    <style>
       
    </style>
    <script>
        var slider = document.getElementById("myRange");
        var output = document.getElementById("demo");
        output.innerHTML = slider.value; // Display the default slider value

        // Update the current slider value (each time you drag the slider handle)
        function sli() {
            output.innerHTML = this.value;
            alert("Hoydiii");
        }
    </script>

</head>

<body>
    <header style="background-image: url('Images/bg_2.jpg')">
        <div id="navContain">
            <nav>
                <div id="logo"></div>
                <ul>
                    <li><a href="index.jsp"><b>Why Us?</b></a> </li>
                    <li><a href="Donate.jsp">Donate</a>

                    </li>
                    <li><a href="Sponsours.jsp">Contributors</a>


                    </li>
                    <li><a id="Active" href="Volunteers.jsp">Join Us</a>

                    </li>
                    <li><a href="contact.jsp">Contact Us</a> </li>
                    <li><a href="request.jsp">Request Food</a> </li>
                </ul>

            </nav>
        </div>

        <div id="qouteArea">
            <div id="qoute">
                <h1>The smallest act of kindness is worth more than the grandest intention</h1>
            </div>
            <div>
                <h1 id="watchVideo">Watch Video</h1>
            </div>

        </div>

    </header>

    <section>
        <div class="container">
            <form action="validateVolunteer.jsp">

                <label>First Name</label>
                <input type="text" id="fname" name="fname" placeholder="Your name.."><br><br>

                <label>Last Name</label>
                <input type="text" id="lname" name="lname" placeholder="Your last name.."><br><br>

                <label>Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email"><br><br>

                <label>Contact No</label>
                <input type="number" id="contact" name="number" placeholder="Your Contact no."><br><br>

                <label>Birth Date</label>
                <input type="date" id="contact" name="DOB"><br><br>

                <label>School / College / Company / Organization</label>
                <input type="text" id="contact" name="organization" placeholder="Your Answer"><br><br>

                <label>Highest Education</label>
                <input type="text" id="contact" name="education" placeholder="Your Answer"><br><br>

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
   
%><br><br>

                <label>Why do you want to Join us?</label>
                <textarea id="subject" name="whytojoin" placeholder="Write something.."
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
                
                <!--<div class="slidecontainer">

                    <div id="week"> <output id="range_weight_disp" style="color:#ff6f0f;font-size: 20px; "></output>
                    </div><br><br>
                    <input type="range" name="duration" id="range_weight" class="slider" value="3" min="3" max="15"
                        oninput="range_weight_disp.value =( range_weight.value + ' Hours/week') ">

                </div>-->
                
                <br><br><br>
   
                <input type="submit" value="Submit">

            </form>
        </div>


    </section>
    <footer>
    </footer>


</body>

</html>