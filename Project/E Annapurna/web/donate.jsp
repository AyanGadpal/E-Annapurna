<jsp:include page="template.html"/>
<!DOCTYPE html>
<html>
<head>
    <script>

        // Get the container element
        function ChangeActive(){
          var btns = document.getElementsByClassName("nav-item");
          btns[3].className += " active";
      
          var qoute = document.getElementById("qoute").innerHTML="DONTAION";     
  	
        }
      </script>
	<title>DONATION</title>
</head>
<body>
  <section class="TopContain">
        <div class="container2">

             <form method="get" action="validateDonor.jsp">
                <label>Donation Amount</label>
                <input required type="number" name="DonateAmt">

                <label>Your Name</label>
                <input required type="text" name="DonorName">

                <label>PAN number</label>
                <input required type="text" name="DonorPan">

                <label>Residential Address</label>
                <input required type="text" name="DonateAddr">
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