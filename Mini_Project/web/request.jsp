
<!DOCTYPE html>
<html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*"%>
<head>
    <meta charset="UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
    <link href="extra.css" rel="stylesheet" type="text/css">
    <title>
            E Annapurna
    </title>
    <script>
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

</head>

<body>
    <header style="background-image: url('Images/bg_1.jpg')">
        <div id="navContain">
            <nav>
                <div id="logo"></div>
                <ul>
                    <li><a href="index.jsp"><b>Why Us?</b></a> </li>
                    <li><a href="Donate.jsp">Donate</a>

                    </li>
                    <li><a href="Sponsours.jsp">Contributors</a>


                    </li>
                    <li><a href="Volunteers.jsp">Join Us</a>

                    </li>
                    <li><a href="contact.jsp">Contact Us</a> </li>
                    <li><a id="Active" href="request.jsp">Request Food</a> </li>
                </ul>

            </nav>
        </div>

        <div id="qouteArea">
            <div id="qoute">
                <h1>Doing Nothing is Not An Option of Our Life</h1>
            </div>
            <div>
                <h1 id="watchVideo">Watch Video</h1>
            </div>

        </div>

    </header>

    <section>
        <div class="container">
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

 
       <br><br> <label>Do you accept Non-Vegetarian food?</label>
                <br><input name="nonvegfood" id="R2" value="1" type="radio"><label>YES</label>
                <br><input name="nonvegfood" id="R2" value="0" type="radio"><label>NO</label><br><br>

                <br><label><h1>Food Timing</h1></label><br><br>

                <label>Breakfast</label>
                <input type="text" name="breakfast" placeholder="Your Answer"><br><br>

                <label>Lunch</label>
                <input type="text" name="lunch" placeholder="Your Answer"><br><br>

                <label>Dinner</label>
                <input type="text" name="dinner" placeholder="Your Answer"><br><br>

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
    <footer>
    </footer>


</body>

</html>