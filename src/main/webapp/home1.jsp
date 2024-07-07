

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playwrite+ES+Deco:wght@100..400&display=swap" rel="stylesheet">

<title>Home</title>

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

.footer-link:hover {
	color: red !important;
	text-decoration: underline;
}

 

             

            .abt-link {
	text-decoration: none;
	
}

.abt-link:hover {
	color: #4FD28A !important;
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

    //sign up
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



		<div id="carouselExampleAutoplaying" class="carousel slide"
			data-bs-ride="carousel">
			<marquee width="100%" behavior="alternate" style="color: red" ><B> Login To Fill
						The Exam Form   </B></marquee>
			<div class="carousel-inner">
			
				<div class="carousel-item active">
				
					<img src="g1.jpg" class="d-block w-100 " style="height: 37em;">
					
				</div>
				<div class="carousel-item">
					<img src="g2.jpg" class="d-block w-100 " style="height: 37em;">
				</div>
				<div class="carousel-item">
					<img src="g6.jpg" class="d-block w-100 " style="height: 37em;">
				</div>

			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

	</div>





	<div class="bg-success p-2 text-dark bg-opacity-25">

		<div class="align-items-center">
			<h3 align="center">Welcome To</h3>

			<h2 align="center">ADVANCE COMPUTER</h2>
		</div>
		<div class="  d-flex justify-content-center align-items-center">
			<div class="card mb-3" style="max-width: 1000px;">
				<div class="row  g-0">
					<div class="col-md-4 ">
						<img src="com.jpg" class="img-fluid rounded-start  " width="750"
							style="height: 400px;">
					</div>
					<div class="col-md-8">

						<div class="card-body">

							<p class="card-text " style="font-size: 15px;">Advance
								Computer Center aims at empowering individuals and organization
								in enquiring, enhancing and upgrading the work efficiency by
								enhancing the overall problem solving approach via use of
								technology and computers. It makes sure that the programmes
								undertaken are recognized globally, high on quality and in
								coherence with the demand of the Advance Computer Center aims at
								empowering individuals and organization in enquiring, enhancing
								and upgrading the work efficiency by enhancinchanging times. We
								are research based organization who believe in continuous
								development of our own self as well as those associate with us.
							</p>

							<p class="card-text " style="font-size: 15px;">Advance
								Computer Center has been one of the very few computers training
								institute which can proudly boast of ISO 9001:2008 certification
								which is one of the parameter to gauge our quality
								consciousness. With a vision to train and mould the best IT
								professionals, Advance Computer Center has established itself as
								a leading training institute. Advance Computer Center has a
								strong focus on quality training and has pioneered a unique way
								to groom students with its Smartlab Plus training methodology.
								We teach a range of classes that start with the very basic
								computer user and extends to the very advanced technical
								student.</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="bg-success p-2 text-dark bg-opacity-25">

		<div class="align-items-center">

			<h2 align="center">ABOUT US</h2>
		</div>

		<!--            <div class="image-container col-md-4 d-flex justify-content-center align-items-center">
                                    <img src="a3.jpg" alt="Your Image" class="img-fluid animate__animated animate__heartBeat">
                                </div>-->

		<div
			class=" row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4 justify-content-center">
			<div class="col custom-col">

				<div
					class="card text-bg-dark rounded-circle d-flex align-items-center justify-content-center m-2"
					style="aspect-ratio: 1/1;">

					<div class="w-100 h-100 position-relative">

						<img src="goal.jpg"
							class="card-img rounded-circle opacity-75 img-fluid animate__animated animate__heartBeat"
							style="aspect-ratio: 1/1;">
						<div
							class="card-img-overlay d-flex align-items-center justify-content-center">
							<p class="card-text text-center  text-dark ">
								<a href="about.jsp#goals" class="text-dark abt-link"
									style="font-size: 43px;">Goals</a>
							</p>
						</div>

					</div>

				</div>
			</div>

			<div class="col custom-col">

				<div
					class="card text-bg-dark rounded-circle d-flex align-items-center justify-content-center m-2"
					style="aspect-ratio: 1/1;">
					<div class="w-100 h-100 position-relative">

						<img src="mis.jpg"
							class="card-img rounded-circle opacity-75 img-fluid animate__animated animate__heartBeat"
							style="aspect-ratio: 1/1;">
						<div
							class="card-img-overlay d-flex align-items-center justify-content-center">
							<!--                                <i class="fa fa-rocket" aria-hidden="true"></i>-->


							<p class="card-text text-center  text-dark fs-1">
								<a href="about.jsp#mission" class="text-dark abt-link">Mission</a>
							</p>


						</div>
					</div>
				</div>
			</div>

			   
		</div>
	</div>











	<div class="bg-success p-2 text-dark bg-opacity-25" id="course">
		<div class="align-items-center">
			<h2 align="center" class="pt-4">OUR COURSES</h2>
		</div>
		<div
			class="card-group d-flex justify-content-center align-items-center">
			<div class="row row-cols-2 row-cols-md-4 g-3">

				<div class="col">
					<div class="card" style="max-width: 350px;">
						<img src="pro.jpg" class="img-fluid rounded-start card-img-top "
							width="400" style="height: 250px;">
						<div class="card-body">
							<h5 class="card-title">Programming</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<a href="course1.jsp" class="btn btn-primary">Read More</a>
						</div>
					</div>
				</div>


				<div class="col">
					<div class="card" style="max-width: 350px;">
						<img src="bas.jpg" class="img-fluid rounded-start card-img-top"
							width="400" style="height: 250px;">
						<div class="card-body">
							<h5 class="card-title">Basic Courses</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<a href="course1.jsp#bc" class="btn btn-primary">Read More </a>
						</div>
					</div>
				</div>


				<div class="col">
					<div class="card" style="max-width: 350px;">
						<img src="gra.jpeg" class="img-fluid rounded-start card-img-top"
							width="400" style="height: 250px;">
						<div class="card-body">
							<h5 class="card-title">Graphic Designing</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<a href="course2.jsp" class="btn btn-primary">Read More</a>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card" style="max-width: 350px;">
						<img src="app.jpg" class="img-fluid rounded-start card-img-top"
							width="400" style="height: 250px;">
						<div class="card-body">
							<h5 class="card-title">App Development</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<a href="course2.jsp#ad" class="btn btn-primary">Read More</a>
						</div>
					</div>
				</div>


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



