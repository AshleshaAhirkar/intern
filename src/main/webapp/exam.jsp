
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <title>Exam</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        
       
       
        <style>
         .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
             .form-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }
           .form-label {
            font-weight: bold;
        }
            .form-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }
        
        
        
            nav-link {
                color: white;
            }

            .nav-link:hover {
                color: black;
            }

            .embed-responsive {
                position: relative;
                display: block;
                width: 100%;
                padding: 0;
                overflow: hidden;
            }

            .embed-responsive::before {
                content: "";
                display: block;
                padding-top: 56.25%; /* 16:9 ratio */
            }

            .embed-responsive iframe {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                height: 100%;
                width: 100%;
                border: none;
            }


            .footer-link {
                text-decoration: none;
            }

            .footer-link:hover {color:red  !important;
                                text-decoration: underline;
            }

            .fa-xl {
                font-size: 1.5em;
                line-height: 1.04167em;
                vertical-align: -0.125em;
            }
        </style>

 <script>
    //enq
	function validateForm() {
		var name = document.getElementById("name").value;
		var mobile = document.getElementById("mobile").value;
		var email = document.getElementById("email").value;

		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		var phoneRegex = /^\d{10}$/;

		if (name.trim() === '' || mobile.trim() === '' || email.trim() === '') {
			alert("All fields must be filled out");
			return false;
		}

		if (!phoneRegex.test(mobile)) {
			alert("Invalid phone number");
			return false;
		}

		if (!emailRegex.test(email)) {
			alert("Invalid email address");
			return false;
		}

		alert("Submitted successfully");
		return true;
	}

    //login
	function validateForm2() {
		var mobile2 = document.getElementById("mobile2").value;
		var password2 = document.getElementById("password2").value;
		var phoneRegex = /^\d{10}$/;
		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

		if (mobile2.trim() === '' || password2.trim() === '') {
			alert("All fields must be filled out");
			return false;
		}

		if (!phoneRegex.test(mobile2)) {
			alert("Invalid phone number");
			return false;
		}

		if (!passwordRegex.test(password2)) {
			alert("Password must be at least 8 characters long, include uppercase, lowercase, number, and special character");
			return false;
		}

		// Perform AJAX request to validate login
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "SaveLoginServlet", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var response = xhr.responseText;
				if (response === "success") {
					alert("Login successful");
					window.location.href = "exam.jsp"; // Redirect to home page
				} else if (response === "invalid_password") {
					alert("Invalid password. Please try again.");
				} else if (response === "user_not_found") {
					alert("User not found. Please sign up.");
					window.location.href = "home1.jsp"; // Redirect to sign-up page
				} else {
					alert("Error processing login. Please try again later.");
				}
			}
		};
		xhr.send("mobile=" + encodeURIComponent(mobile2) + "&password="
				+ encodeURIComponent(password2));
		return false;
	}

    //signup
	function validateForm3() {

		var name3 = document.getElementById("name3").value;
		var mobile3 = document.getElementById("mobile3").value;
		var email3 = document.getElementById("email3").value;
		var password3 = document.getElementById("password3").value;

		var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		var phoneRegex = /^\d{10}$/;
		var passwordRegex = /^(?=.[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

		if (name3.trim() === '' || mobile3.trim() === ''
				|| email3.trim() === '' || password3.trim() === '') {
			alert("All fields must be filled out");
			return false;
		}

		if (!phoneRegex.test(mobile3)) {
			alert("Invalid phone number");
			return false;
		}

		if (!passwordRegex.test(password3)) {
			alert("Password must be at least 8 characters long, include uppercase, lowercase, number, and special character");
			return false;
		}
		if (!emailRegex.test(email3)) {
			alert("Invalid email address");
			return false;
		}
		alert("Sign In successful");
		return true;
	}

	document.querySelector('[data-bs-target="#signUpModal"]').addEventListener(
			'click', function() {
				var loginModal = document.getElementById('loginModal');
				var bootstrapModal = bootstrap.Modal.getInstance(loginModal);
				bootstrapModal.hide();
			});
        
	//exam
        function validateForm4() {
            var name4 = document.getElementById("name4").value;
            var mobile4 = document.getElementById("mobile4").value;
            var dob4 = document.getElementById("dob4").value;
            var email4 = document.getElementById("email4").value;
            var address4 = document.getElementById("address4").value;
            var city4 = document.getElementById("city4").value;
            var state4 = document.getElementById("state4").value;
            var aadhar4 = document.getElementById("aadhar4").value;

            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var phoneRegex = /^\d{10}$/;
            var aadharRegex = /^\d{12}$/;

            
            if (name4.trim() === '' || address4.trim() === '' || mobile4.trim() === '' 
            	|| dob4.trim() === '' || email4.trim() === '' || city4.trim() === '' || state4.trim() === '' || aadhar4.trim() === '') {
                alert("All fields must be filled out");
                return false;
            }
            
            if (!phoneRegex.test(mobile4)) {
                alert("Invalid phone number");
                return false;
            }

            if (!emailRegex.test(email4)) {
                alert("Invalid email address");
                return false;
            }
            
            if (!aadharRegex.test(aadhar4)) {
                // If validation fails, show error message
                alert("Please enter a valid 12-digit Aadhar card number");
                return false; // Prevent form submission
            }
            
            alert("Submitted successfully");
            return true;
        }
        

        


        

        
  
    </script>







    </head>

    <body class="p-1 m-0 border-0 bd-example ">
    
    
        <div class="bg-success p-2 text-dark bg-opacity-25">
        
        
        
        
            <nav class="navbar navbar-expand-lg bg-body-primary ">
			<div class="container-fluid border border-success border-2">
				<a class="navbar-brand" href="#"><img
					src="logo1.png"
					style="width: 9em; height: 3em;"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="home1.jsp">Home</a></li>

						<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								Course </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="home1.jsp#course">Programming</a></li>
								<li><a class="dropdown-item" href="home1.jsp#course">Basic
										Courses</a></li>
								<li><a class="dropdown-item" href="home1.jsp#course">Graphic
										Designing</a></li>
								<li><a class="dropdown-item" href="home1.jsp#course">App
										Development</a></li>
							</ul></li>

						<li class="nav-item"><a class="nav-link" href="add.jsp">Admission</a>
						</li>

						<li class="nav-item"><a class="nav-link" href="gall.jsp">Gallery</a>
						</li>

						<li class="nav-item"><a class="nav-link" href="vid.jsp">Videos</a>
						</li>

						<li class="nav-item"><a class="nav-link" href="Cont.jsp">Contact
								Us</a></li>

					</ul>


					<ul class="navbar-nav me-3 mb-2 mb-lg-0">


						<li>
							<button type="button"
								class="btn btn-danger rounded-circle ms-2 animate_animated animate__heartBeat animate_infinite"
								data-bs-toggle="modal" data-bs-target="#enquiryModal">
								Enquiry</button> <!--Modal -->
							<div class="modal fade" id="enquiryModal" tabindex="-1"
								aria-labelledby="enquiryModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content bg-dark text-light">
										<div class="modal-header ">
											<!--                        <i class="fa fa-lock  text-danger fa-2x"></i>-->
											<h5 class="modal-title text-light m-3 fs-2 "
												id="enquiryModalLabel ">Enquiry Form</h5>

											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>


										<form id="myForm" action="SaveEnquiryServlet" method="post"
											onsubmit="return validateForm()">
											<div class="modal-body">


												<div class="mb-3">
													<!--                            <i class="fa fa-mobile"></i>-->
													<label for="enquiryFormControlInput1"
														class="form-label fw-bold ">Name:</label> <input
														type="text" name="name" class="form-control" id="name"
														placeholder="Enter your Name">
												</div>


												<div class="mb-3">
													<!--                            <i class="fa fa-lock"></i>-->
													<label for="exampleFormControlInput1"
														class="form-label fw-bold">Mobile No:</label> <input
														type="text" name="mobile" class="form-control" id="mobile"
														placeholder="Enter your Mobile">
												</div>

												<div class="mb-3">
													<!--                            <i class="fa fa-lock"></i>-->
													<label for="enquiryFormControlInput1"
														class="form-label fw-bold">Email:</label> <input
														type="text" name="email" class="form-control" id="email"
														placeholder="Enter your Email">
												</div>


												<div class="mb-3 ">
													<label for="Qualification"
														class="col-sm-1 col-form-label text-light fw-bold">Course:</label>
													<div class="col-sm-12" >
														<select class="form-select" name="course"
															aria-label="Default select example">

															<option value="1">C/C++</option>
															<option value="2">Java</option>
															<option value="3">WebD</option>
														</select>
													</div>
													          
												</div>

												<div class="d-grid">
													<button class="btn btn-success fw-bold" type="submit">
														</i>Submit
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

						</li>

					</ul>
				</div>
			</div>
		</nav>
                        
            
            <div class="container-fluid  p-3" >
              <div class="form-container border border-dark rounded">
                <div class=" form-header fs-2 fw-bold text-center text-success" >
                    Exam Form
                </div>
                <hr class=" border border-dark border-2 ">
                


                <form id="myForm"  action="SaveExamServlet" method="post" onsubmit="return validateForm4()">
                    <div class="mb-3 row mt-2 d-flex justify-content-center ">

                        <label for="Name" class="col-sm-2 col-form-label text-dark fw-bold ">Name:</label>
                        <div class="col-sm-5">
                            <input type="text" name="name" class="form-control" id="name4" placeholder="Enter your name" >
                        </div>

                    </div>
                    
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="Date of Birth" class="col-sm-2 col-form-label text-dark fw-bold">DOB:</label>
                        <div class="col-sm-5">
                            <input type="text" name="dob" class="form-control" id="dob4" placeholder="Choose DOB" readonly>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
                    <script>
                    flatpickr("#dob4",{
        	enableTime:true,
        	dateFormat:"d-m-Y ",
        
        });
                    </script>
                    
                     <div class="mb-3 row d-flex justify-content-center">
                        <label for="Mobile" class="col-sm-2 col-form-label text-dark fw-bold">Mobile:</label>
                        <div class="col-sm-5">
                            <input type="text" name="mobile" class="form-control" id="mobile4"  placeholder="Enter your mobile no">
                        </div>
                    </div>
                    
                       <div class="mb-3 row d-flex justify-content-center">
                        <label for="staticEmail" class="col-sm-2 col-form-label text-dark fw-bold">Email:</label>
                        <div class="col-sm-5">
                            <input type="text"  name="email" class="form-control" id="email4" placeholder="Enter your email" >
                        </div>
                    </div>
                    
                   
                    
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="Aadhar-Card" class="col-sm-2 col-form-label text-dark fw-bold">Aadhar Card No:</label>
                        <div class="col-sm-5">
                            <input type="text" name="aadhar" class="form-control" id="aadhar4" placeholder="Enter your Aadhar No">
                        </div>
                    </div>
                    
                     <div class="mb-3 row d-flex justify-content-center">
                        <label for="Address" class="col-sm-2 col-form-label text-dark fw-bold">Address:</label>
                        <div class="col-sm-5">
                            <input type="text" name="address" class="form-control" id="address4" placeholder="Enter your address">
                        </div>
                    </div>
                   
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="City" class="col-sm-2 col-form-label text-dark fw-bold">City:</label>
                        <div class="col-sm-5">
                            <input type="text" name="city" class="form-control" id="city4" placeholder="Enter your city">
                        </div>
                    </div>
                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="State" class="col-sm-2 col-form-label text-dark fw-bold">State:</label>
                        <div class="col-sm-5">
                            <input type="text" name="state" class="form-control" id="state4" placeholder="Enter your state">
                        </div>
                    </div>

                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="Course" class="col-sm-2 col-form-label text-dark fw-bold">Course:</label>
                        <div class="col-sm-5">
                            <select class="form-select" name="course" aria-label="Default select example">

                                <option value="1">C</option>
                                <option value="2">C++</option>
                                <option value="3">Java</option>
                            </select>
                        </div>
                    </div>


                    <div class="mb-3 row d-flex justify-content-center">
                        <label for="button" class="col-sm-1 col-form-label"></label>
                        <div class="d-grid gap-2 col-sm-5">
                            <button class="btn btn-success"  type="submit">Submit</button>
                        </div>
                    </div>
                </form>
</div>
            </div>
        </div>
        
        
<footer class="text-dark py-4" style="background-color: #cccccc;">
		<div class="container">
			<div class="row">
				<div class="col-6 col-md-2 mb-3">
					<h5>QUICK LINKS</h5>
					<ul class="nav flex-column ">
						<li class="nav-item mb-2"><a href="home1.jsp"
							class="footer-link p-0 text-body-secondary">Home</a></li>
						<li class="nav-item mb-2"><a href="about.jsp"
							class="footer-link p-0 text-body-secondary">About Us</a></li>
						<li class="nav-item mb-2"><a href="about.jsp#mission"
							class="footer-link p-0 text-body-secondary">Goals/Mission</a></li>
						<li class="nav-item mb-2"><a href="gall.jsp"
							class="footer-link p-0 text-body-secondary">Gallery</a></li>
						<li class="nav-item mb-2"><a href="vid.jsp"
							class="footer-link p-0 text-body-secondary">Video</a></li>
					</ul>
				</div>

				<div class="col-6 col-md-2 mb-3">
					<h5>Our Courses</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="course1.jsp"
							class="footer-link p-0 text-body-secondary">Programming</a></li>
						<li class="nav-item mb-2"><a href="course1.jsp#bc"
							class="footer-link p-0 text-body-secondary">Basic Courses</a></li>
						<li class="nav-item mb-2"><a href="course2.jsp"
							class="footer-link p-0 text-body-secondary">Graphic Designing</a></li>
						<li class="nav-item mb-2"><a href="course2.jsp#ad"
							class="footer-link p-0 text-body-secondary">App Development</a></li>

					</ul>
				</div>

				<div class="col-6 col-md-2 mb-3">
					<h5>Imp Links</h5>
					<ul class="nav flex-column">
						<li class="nav-item mb-2"><a href="add.jsp"
							class="footer-link p-0 text-body-secondary">Admission</a></li>
						
						
						<li class="nav-item mb-2"><a href="Cont.jsp"
							class="footer-link p-0 text-body-secondary">Contact Us</a></li>
							
				
					</ul>
								<ul class="list-inline">
                
               <li class="list-inline-item"><a class="text-muted text-primary-hover" href="https://www.facebook.com/profile.php?id=61561569907313&mibextid=ZbWKwL" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="https://www.instagram.com/techc_ampus?igsh=aGszNTBua2h1bXcx" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="https://youtube.com/@techcampus-m5j?si=sr9ZjCJWBwq63UHH" target="_blank" title="youtube"><i class="fab fa-youtube"></i></a></li>
                
              </ul>
				</div>



				<div class="col-md-6">
					<div class="embed-responsive">
						<iframe src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3721.384407998023!2d79.11414727525958!3d21.137094980539477!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjHCsDA4JzEzLjUiTiA3OcKwMDcnMDAuMiJF!5e0!3m2!1sen!2sin!4v1719763871751!5m2!1sen!2sin"
						 width="400" height="400" 
						 style="border:0;" 
						 allowfullscreen="" loading="lazy" 
						 referrerpolicy="no-referrer-when-downgrade">
						 </iframe>
					</div>
				</div>
			</div>
		</div>
		
	
      
		       
	</footer>

        

         </body>
</html>