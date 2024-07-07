


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Courses</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
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
							data-bs-toggle="dropdown" aria-expanded="false"> Course </a>
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
						<li class="nav-item">
							<button type="button"
								class="btn btn-bg-success text-dark bg-opacity-25"
								data-bs-toggle="modal" data-bs-target="#loginModal">
								<i class="fa-solid fa-right-to-bracket"></i> Login
							</button>
							<div class="modal fade" id="loginModal" tabindex="-1"
								aria-labelledby="loginModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<i class="fa fa-lock text-danger fa-2x"></i>
											<h5 class="modal-title text-danger m-3 fs-2"
												id="loginModalLabel">Login</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>

										<form id="myForm2" action="SaveLoginServlet" method="post"
											onsubmit="return validateForm2()">
											<div class="modal-body">
												<div class="mb-3">
													<i class="fa fa-mobile"></i> <label for="loginMobile"
														class="form-label fw-bold">Mobile:</label> <input
														type="text" name="mobile" class="form-control"
														id="mobile2" placeholder="Enter your Mobile No">
												</div>
												<div class="mb-3">
													<i class="fa fa-lock"></i> <label for="loginPassword"
														class="form-label fw-bold">Password:</label> <input
														type="password" name="password" class="form-control"
														id="password2" placeholder="Enter your Password">
												</div>
												<div class="d-grid">
													<button class="btn btn-success fw-bold" type="submit">
														<i class="fa-solid fa-right-to-bracket me-1"></i>Login
													</button>
												</div>

												<!-- Sign Up Button -->
												<div class="d-grid mt-2">
													<button type="button" class="btn btn-primary fw-bold"
														data-bs-toggle="modal" data-bs-target="#signUpModal">
														<i class="fa-solid fa-user-plus me-1"></i>Sign Up
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div> <!-- Sign Up Modal -->
							<div class="modal fade" id="signUpModal" tabindex="-1"
								aria-labelledby="signUpModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<i class="fa fa-user-plus text-primary fa-2x"></i>
											<h5 class="modal-title text-primary m-3 fs-2"
												id="signUpModalLabel">Sign Up</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>

										<form id="myForm2" action="SaveSignServlet" method="post"
											onsubmit="return validateForm3()">
											<div class="modal-body">
												<div class="mb-3">
													<i class="fa fa-user"></i> <label for="signUpName"
														class="form-label fw-bold">Name:</label> <input
														type="text" name="name" class="form-control" id="name3"
														placeholder="Enter your Name">
												</div>
												<div class="mb-3">
													<i class="fa fa-mobile"></i> <label for="signUpMobile"
														class="form-label fw-bold">Mobile:</label> <input
														type="text" name="mobile" class="form-control"
														id="mobile3" placeholder="Enter your Mobile No">
												</div>
												<div class="mb-3">
													<i class="fa fa-envelope"></i> <label for="signUpEmail"
														class="form-label fw-bold">Email:</label> <input
														type="email" name="email" class="form-control" id="email3"
														placeholder="Enter your Email">
												</div>
												<div class="mb-3">
													<i class="fa fa-lock"></i> <label for="signUpPassword"
														class="form-label fw-bold">Password:</label> <input
														type="password" name="password" class="form-control"
														id="password3" placeholder="Enter your Password">
												</div>
												<div class="d-grid">
													<button class="btn btn-primary fw-bold" type="submit">
														<i class="fa-solid fa-user-plus me-1"></i>Sign Up
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</li>

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

            <div class="justify-content-center p-4">
                <h1> COURSES</h1>
            </div>
            <div class="container-fluid"> <!-- or use "container" for a fixed-width container -->
                <div class="row">

                    <!-- This is your table -->
                    <div class="col-md-8">  <!-- Change "md" to any breakpoint as per your requirement -->
                        <table class="table text-white w-100" style="background-color: rgb(81, 23, 81);">
                            <!-- ... Your table content ... -->

                            <thead >
                                <tr>
                                    <td colspan="2" class="h3  border-bottom-0"> GRAPHIC DESIGNING</td>
                                </tr>

                                <tr>
                                    <th scope="col">Courses</th>
                                    <th scope="col">Content</th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <td>Corel Draw</td>
                                    <td>Tools, Corel Draw, Working with Curves, Working with Basic Shapes, Working with Shapes, Interactive Tools, Woning with Bitmaps. Arranging Object.</td>
                                </tr>

                                <tr>
                                    <td>Photoshop</td>              
                                    <td>Introduction to Photoshop, Flash, Interfaces & Operations, Layer, Brushes & Text Coloring, Exploring flash products, Basic of flash software, Flash Animation, Flashi Interactivity, Flash Multimedia, Planning and Producing a Flash Project.</td>
                                </tr>

                                <tr>
                                    <td>Animation and Visual Effects</td>              
                                    <td>Students who choose this specialisation are interested in animation and visual effects. After completing this specialised course, the students are empowered to utilise the emerging technologies of art and science.</td>
                                </tr>


                                <tr>
                                    <td class="  border-bottom-0">Page Maker</td>                               
                                    <td class="  border-bottom-0">Page Introduction to Publishing, introduction to Page Maker, Placing and Manipulating Text, Importing and Manipulating Graphics, Integrating Text and Graphics, Creating Makar Templates, Working with Graphics, Defining Colours, Graphics Formats, Contrast and Halftones Printing, Document Setup, Colour Management, Trapping. </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <!-- This is where your image will be -->
                    <div class="image-container col-md-4 d-flex justify-content-center align-items-center">
                        <img src="a3.jpg" alt="Your Image" class="img-fluid animate__animated animate__heartBeat">
                    </div>

                    <!--                    <div class="col-md-4 d-flex justify-content-center align-items-center"> 
                                            <img src="a3.jpg" alt="Your Image Description" class="img-fluid">  img-fluid makes the image responsive 
                                        </div>-->

                       </div>
            </div>
            <hr class="border border-success border-3 ">





            <div class="container-fluid" id="ad"> <!-- or use "container" for a fixed-width container -->
                <div class="row">

                    <!-- This is your table -->
                    <div class="col-md-8">  <!-- Change "md" to any breakpoint as per your requirement -->
                        <table class="table text-white w-100" style="background-color: rgb(81, 23, 81);">
                            <!-- ... Your table content ... -->
                            <thead >
                                <tr>
                                    <td colspan="2" class="h3  border-bottom-0">App Development</td>
                                </tr>

                                <tr>
                                    <th scope="col">Courses</th>
                                    <th scope="col">Content</th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <td>Basics of Android </td>
                                    <td>Basic understanding of Android development tools i.e. - Eclipse, DDMS etc. and you will have a clear vision about what Android manifest file does and the importance of the activity lifecycle.
                                        Topics - Eclipse, DDMS, Activity LifeCycle, Manifest File, Locales, Drawables, Listeners, Supporting Multiple Screens.</td>
                                </tr>

                                <tr>
                                    <td>Android Layouts
                                    </td>              
                                    <td>Use various layouts and widgets in your Android Applications. Furthermore, you can create list and grid views in your program and populate them with data sources.
                                        Topics - Linear Layout, Relative Layout, Table Layout, Grid View, List View, Toggle Buttons, Checkboxes, Radio Buttons, Radio Group, Spinner, Autocomplete TextView, Web Views</td>
                                </tr>

                                <tr>
                                    <td>Animation in Android
                                    </td>                               
                                    <td>Create applications which can make use of internal and external storage (SD Card). You will also learn how to use Animation in android and an interesting DrawingBrush Application will be explained in its very detail.
                                        Topics - Internal Storage, External Storage, Frame animation, Tween animation, Canvas, Paint and Path
                                    </td>
                                </tr>

                                <tr>
                                    <td class="  border-bottom-0">Advanced Android Concepts</td>
                                    <td class="  border-bottom-0">Android applications that can make use of SQLite database by the end of this week. Also you will publish your First App on Google Play.
                                        Topics - Starting Activity For Result, SQLite Database, SQLite Data Types, SQLiteOpenHelper Class, Content Values, Cursor, Content Providers, Publish your App on Google Play
                                    </td>
                                </tr>

                                        </tbody>


                        </table>
                    </div>

                    <!-- This is where your image will be -->

                    <div class="image-container col-md-4 d-flex justify-content-center align-items-center">
                        <img src="a4.jpg" alt="Your Image" class="img-fluid animate__animated animate__heartBeat">
                    </div>

                    <!--                    <div class="col-md-4 d-flex justify-content-center align-items-center"> 
                                            <img src="a4.jpg" alt="Your Image Description" class="img-fluid" >  img-fluid makes the image responsive 
                                        </div>-->

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
