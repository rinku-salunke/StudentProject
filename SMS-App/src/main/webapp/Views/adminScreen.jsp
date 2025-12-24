<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Management | Admin Portal</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&amp;display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
body {
	font-family: 'Poppins', sans-serif;
	background-color: #f4f7f6;
	scroll-behavior: smooth;
}

.instagram-bg {
	background: #f09433;
	background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%
		, #bc1888 100%);
}
/* Modern Navbar */
.navbar {
	backdrop-filter: blur(10px);
	background: rgba(255, 255, 255, 0.8) !important;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Section Styling */
.hero-section {
	min-height: 100vh;
	display: flex;
	align-items: center;
	background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
		url("Images/addstudent.jpg");
	background-size: cover;
	background-position: center;
}

/* Glassmorphism Card */
.glass-card {
	background: rgba(255, 255, 255, 0.9);
	backdrop-filter: blur(5px);
	border-radius: 20px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	padding: 2rem;
	transition: transform 0.3s ease;
}

.glass-card:hover {
	transform: translateY(-5px);
}

/* Table Styling */
.view-section {
	padding: 80px 0;
	background-color: #ffffff;
}

.table-container {
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
}

.table thead {
	background: #4e73df;
	color: white;
}

.youtube-bg {
	background: #FF0000;
}
/* Custom Buttons */
.btn-modern {
	border-radius: 10px;
	padding: 10px 25px;
	font-weight: 600;
	transition: all 0.3s;
}

.btn-enroll {
	background-color: #4e73df;
	color: white;
}

.btn-enroll:hover {
	background-color: #2e59d9;
	color: white;
	box-shadow: 0 4px 15px rgba(78, 115, 223, 0.4);
}

/* Form Controls */
.form-control, .form-select {
	border-radius: 8px;
	padding: 12px;
	border: 1px solid #dee2e6;
}

.form-control:focus {
	box-shadow: 0 0 0 3px rgba(78, 115, 223, 0.2);
	border-color: #4e73df;
}

/* --- ATTRACTIVE FOOTER STYLES --- */
.footer-cta {
	border-bottom: 1px solid #373636;
	padding-bottom: 30px;
}

.single-cta i {
	color: #4e73df;
	font-size: 30px;
	float: left;
	margin-top: 8px;
}

.cta-text {
	padding-left: 15px;
	display: inline-block;
}

.cta-text h4 {
	color: #fff;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 2px;
}

.cta-text span {
	color: #757575;
	font-size: 15px;
}

.footer-section {
	background: #151414;
	position: relative;
	padding-top: 50px;
}

.footer-content {
	position: relative;
	z-index: 2;
}

.footer-logo img {
	max-width: 150px;
	border-radius: 5px;
}

.footer-text p {
	margin-bottom: 14px;
	font-size: 14px;
	color: #7e7e7e;
	line-height: 28px;
}

.footer-social-icon span {
	color: #fff;
	display: block;
	font-size: 20px;
	font-weight: 700;
	font-family: 'Poppins', sans-serif;
	margin-bottom: 20px;
}

.footer-social-icon a {
	color: #fff;
	font-size: 16px;
	margin-right: 15px;
}

.footer-social-icon i {
	height: 40px;
	width: 40px;
	text-align: center;
	line-height: 38px;
	border-radius: 50%;
}

.facebook-bg {
	background: #3B5998;
}

.twitter-bg {
	background: #55ACEE;
}

.google-bg {
	background: #DD4B39;
}

.footer-widget-heading h3 {
	color: #fff;
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 40px;
	position: relative;
}

.footer-widget-heading h3::before {
	content: "";
	position: absolute;
	left: 0;
	bottom: -15px;
	height: 2px;
	width: 50px;
	background: #4e73df;
}

.footer-widget ul li {
	display: inline-block;
	width: 50%;
	margin-bottom: 12px;
}

.footer-widget ul li a:hover {
	color: #4e73df;
}

.footer-widget ul li a {
	color: #878787;
	text-transform: capitalize;
	text-decoration: none;
}

.copyright-area {
	background: #202020;
	padding: 25px 0;
	margin-top: 30px;
}

.copyright-text p {
	margin: 0;
	font-size: 14px;
	color: #878787;
}

.footer-menu li {
	display: inline-block;
	margin-left: 20px;
}

.footer-menu li a {
	font-size: 14px;
	color: #878787;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function handleAction(actionPath) {
		const radios = document.getElementsByName('id');
		let selectedValue = null;

		for (let i = 0; i < radios.length; i++) {
			if (radios[i].checked) {
				selectedValue = radios[i].value;
				break;
			}
		}

		if (selectedValue) {
			// If clicking 'Shift', redirect to the dedicated batch page
			if (actionPath === '/batch') {
				window.location.href = "batch?id=" + selectedValue;
				return;
			}

			// Handle deletion with confirmation
			if (actionPath.includes('/remove')) {
				if (!confirm("Are you sure you want to delete this student record?"))
					return;
			}

			const form = document.forms['fn'];
			form.action = actionPath;
			form.submit();
		} else {
			alert("Please select a student record first!");
		}
	}
	function handleFeeStatus() {
	    const radios = document.getElementsByName('id');
	    let selectedValue = null;

	    // Look for the selected radio button
	    for (let i = 0; i < radios.length; i++) {
	        if (radios[i].checked) {
	            selectedValue = radios[i].value;
	            break;
	        }
	    }

	    if (selectedValue) {
	        // Redirect to the feeStatus mapping with the selected ID
	        window.location.href = "feeStatus?studentid=" + selectedValue;
	    } else {
	        alert("Please select a student from the database table first to view their fee status!");
	    }
	}
	document.addEventListener("DOMContentLoaded", function() {
	    var msg = "${message}";
	    
	    if (msg && msg.trim() !== "") {
	        var modalTitle = document.getElementById('modalTitle');
	        var successIcon = document.getElementById('successIcon');
	        var errorIcon = document.getElementById('errorIcon');
	        var modalBtn = document.getElementById('modalBtn');
	        var lowerMsg = msg.toLowerCase();
	        
	        // 1. DETERMINE SUCCESS OR ERROR
	        // We include 'deleted', 'payment', and 'shifted' as success triggers
	        if (lowerMsg.includes("success") || lowerMsg.includes("shifted") || 
	            lowerMsg.includes("deleted") || lowerMsg.includes("payment")) {
	            
	            // 2. SET SPECIFIC HEADINGS
	            if (lowerMsg.includes("payment")) {
	                modalTitle.innerText = "Fee Updated!"; // Your requested change
	            } else if (lowerMsg.includes("deleted")) {
	                modalTitle.innerText = "Student Deleted Successfully!";
	            } else if (lowerMsg.includes("shifted")) {
	                modalTitle.innerText = "Batch Shifted!";
	            } else {
	                modalTitle.innerText = "Enrolled Successfully!";
	            }

	            // 3. APPLY SUCCESS STYLING (GREEN)
	            modalTitle.className = "fw-bold mb-3 text-success";
	            successIcon.classList.remove('d-none');
	            errorIcon.classList.add('d-none');
	            modalBtn.style.backgroundColor = "#28a745"; 
	            modalBtn.classList.add('btn-success');
	        } else {
	            // 4. APPLY ERROR STYLING (RED)
	            modalTitle.innerText = "Action Failed";
	            modalTitle.className = "fw-bold mb-3 text-danger";
	            errorIcon.classList.remove('d-none');
	            successIcon.classList.add('d-none');
	            modalBtn.style.backgroundColor = "#ff3b5c";
	            modalBtn.classList.add('btn-danger');
	        }
	        
	        var myModal = new bootstrap.Modal(document.getElementById('notificationModal'));
	        myModal.show();
	    }
	});
</script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light sticky-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img src="Images/logo.jpeg"
				alt="Logo" height="40" class="d-inline-block align-text-top">
				<span class="ms-2 fw-bold text-primary">EduManage</span>
			</a>
			<div class="d-flex gap-2">
				<a href="#enroll" class="btn btn-sm btn-outline-primary btn-modern">Enroll</a>
				<a href="#view" class="btn btn-sm btn-outline-primary btn-modern">Database</a>
				<button type="button" onclick="handleFeeStatus()" class="btn btn-sm btn-info btn-modern">
        <i class="fas fa-file-invoice-dollar"></i>Fee Status
    </button>
				 <a href="/" class="btn btn-sm btn-danger btn-modern"><i
					class="fas fa-sign-out-alt"></i></a>
			</div>
		</div>
	</nav>

	<section class="hero-section" id="enroll">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-10">
					<div class="glass-card shadow-lg">
						<h2 class="text-center fw-bold mb-4 text-dark">Enroll New
							Student</h2>
						<form action="enroll_student" id="enroll-form">
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label small fw-bold">Full Name</label> <input
										type="text" class="form-control" name="studentFullName"
										placeholder="Enter Full Name" required>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Email Address</label> <input
										type="email" class="form-control" name="studentEmail"
										placeholder="Enter Student Email Address" required>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Age</label> <input
										type="number" class="form-control" name="StudentAge"
										placeholder="Enter Student age">
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">College</label> <input
										type="text" class="form-control" name="studentCollageName"
										placeholder="Enter University Name">
								</div>
								<div class="col-12">
									<label class="form-label small fw-bold">Course
										Selection</label>
									<div class="p-2 border rounded bg-light text-center">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												name="StudentCourse" value="Java" id="java" checked>
											<label class="form-check-label" for="java">Java
												Development</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"
												name="StudentCourse" value="Python" id="python"> <label
												class="form-check-label" for="python">Python Data
												Science</label>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Mode</label> <select
										class="form-select" name="batchMode">
										<option value="Online">🌐 Online</option>
										<option value="Offline">🏫 Offline</option>
									</select>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Batch ID</label> <select
										class="form-select" name="batchNumber">
										<option value="FDJ-185">FDJ-185</option>
										<option value="REG-185">REG-185</option>
										<option value="FDJ-161">FDJ-161</option>
										<option value="REG-161">REG-161</option>
									</select>
								</div>
								<div class="col-12">
									<label class="form-label small fw-bold">Fees Paid (USD)</label>
									<input type="number" class="form-control" name="feesPaid"
										placeholder="Amount">
								</div>
							</div>
							<button class="btn btn-enroll btn-modern w-100 mt-4 py-3"
								type="submit">Complete Enrollment</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="view-section" id="view">
		<div class="container">
			<div class="text-center mb-5">
				<h2 class="fw-bold">Student Database</h2>
				<p class="text-muted">Manage records, process payments, and
					update schedules.</p>
			</div>

			<div class="row justify-content-center mb-4">
				<div class="col-md-6">
					<form action="search" class="input-group">
						<select class="form-select" name="batchNumber">
							<option selected disabled>Filter by Batch...</option>
							<option value="FDJ-185">FDJ-185</option>
							<option value="REG-185">REG-185</option>
							<option value="FDJ-161">FDJ-161</option>
							<option value="REG-161">REG-161</option>
						</select>
						<button class="btn btn-primary px-4" type="submit">
							<i class="fas fa-search"></i> Search
						</button>
					</form>
				</div>
			</div>

			<div class="modal fade" id="notificationModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content text-center border-0 shadow-lg" style="border-radius: 25px; padding: 2.5rem;">
            <div class="modal-body">
                <div id="successIcon" class="mb-3 d-none">
                    <i class="fas fa-check-circle text-success" style="font-size: 5rem;"></i>
                </div>
                
                <div id="errorIcon" class="mb-3 d-none">
                    <i class="fas fa-exclamation-circle text-danger" style="font-size: 5rem;"></i>
                </div>
                
                <h3 id="modalTitle" class="fw-bold mb-3"></h3>
                
                <p id="modalMessage" class="text-muted mb-4 fs-5">${message}</p>
                
                <button type="button" id="modalBtn" class="btn w-100 py-3 fw-bold shadow-sm" 
                        data-bs-dismiss="modal" 
                        style="border-radius: 50px; border: none; font-size: 1.1rem; transition: 0.3s;">
                    OK
                </button>
            </div>
        </div>
    </div>
</div>

			<div class="table-container shadow bg-white rounded">
    <c:choose>
        <%-- Case 1: Data exists, show the table --%>
        <c:when test="${not empty data}">
            <form name="fn" method="get" action="">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4">ID</th>
                                <th>Student Name</th>
                                <th>Email</th>
                                <th>Age</th>
                                <th>College</th>
                                <th>Course</th>
                                <th>Batch</th>
                                <th>Fees</th>
                                <th class="text-center">Select</th>
                                <th class="text-center">Quick Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${data}" var="s">
                                <tr>
                                    <td class="ps-4 fw-bold text-primary">${s.studentId}</td>
                                    <td class="fw-semibold">${s.studentFullName}</td>
                                    <td class="text-muted small">${s.studentEmail}</td>
                                    <td>${s.studentAge}</td>
                                    <td>${s.studentCollageName}</td>
                                    <td><span class="badge bg-info">${s.studentCourse}</span></td>
                                    <td><span class="badge bg-secondary">${s.batchNumber}</span></td>
                                    <td class="text-success fw-bold">₹${s.feesPaid}</td>
                                    <td class="text-center">
                                        <input type="radio" class="form-check-input" name="id" value="${s.studentId}">
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group shadow-sm">
                                            <%-- Edit Button --%>
                                            <button type="button" class="btn btn-sm btn-outline-warning"
                                                onclick="handleAction('/edit')" title="Edit Student">
                                                <i class="fas fa-edit"></i>
                                            </button>

                                            <%-- Pay Fees Button --%>
                                            <button type="button" class="btn btn-sm btn-outline-success"
                                                onclick="handleAction('/fees')" title="Pay Fee">
                                                <i class="fas fa-file-invoice-dollar"></i>
                                            </button>

                                            <%-- Shift Batch Button --%>
                                            <button type="button" class="btn btn-sm btn-outline-primary"
                                                onclick="handleAction('/batch')" title="Shift Batch">
                                                <i class="fas fa-exchange-alt"></i>
                                            </button>

                                            <%-- Remove Button --%>
                                            <button type="button" class="btn btn-sm btn-outline-danger"
                                                onclick="handleAction('/remove')" title="Delete Student">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form>
        </c:when>

        <%-- Case 2: No data, show the empty state message --%>
        <c:otherwise>
            <div class="text-center py-5">
                <i class="fas fa-search-minus text-muted mb-3" style="font-size: 5rem; opacity: 0.2;"></i>
                <h4 class="fw-bold text-dark">No records available for this batch</h4>
                <p class="text-muted">Please try selecting a different batch or click below to reset.</p>
                <a href="view" class="btn btn-primary btn-modern mt-3 px-4">
                    <i class="fas fa-sync-alt me-2"></i>View All Students
                </a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
				<nav aria-label="...">
					<ul class="pagination pagination-sm">
						<li class="page-item"><a class="page-link"
							href="paging?pageNo=0" tabindex="-1">1</a></li>
						<li class="page-item"><a class="page-link"
							href="paging?pageNo=2">2</a></li>
						<li class="page-item"><a class="page-link"
							href="paging?pageNo=3">3</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</section>

	<footer class="footer-section">
		<div class="container">
			<div class="footer-cta">
				<div class="row">
					<div class="col-xl-4 col-md-4 mb-30">
						<div class="single-cta">
							<i class="fas fa-map-marker-alt"></i>
							<div class="cta-text">
								<h4>Find us</h4>
								<span>1010 Avenue, sw 54321, Chandigarh</span>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-md-4 mb-30">
						<div class="single-cta">
							<i class="fas fa-phone"></i>
							<div class="cta-text">
								<h4>Call us</h4>
								<span>9876543210 0</span>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-md-4 mb-30">
						<div class="single-cta">
							<i class="far fa-envelope-open"></i>
							<div class="cta-text">
								<h4>Mail us</h4>
								<span>mail@info.com</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-content pt-5 pb-5">
				<div class="row">
					<div class="col-xl-4 col-lg-4 mb-50">
						<div class="footer-widget">
							<div class="footer-logo">
								<a href="#"><img src="Images/logo.jpeg" class="img-fluid"
									alt="logo"></a>
							</div>
							<div class="footer-text mt-3">
								<p>EduManage is a complete student record management
									solution designed to simplify administration and academic
									tracking for modern institutions.</p>
							</div>
							<div class="footer-social-icon">
								<span>Follow us</span> <a
									href="https://www.facebook.com/completejavaclasses/"><i
									class="fab fa-facebook-f facebook-bg"></i></a> <a
									href="https://www.youtube.com/redirect?event=channel_header&amp;redir_token=QUFFLUhqbGZPeXZtd3RGMG4zOGZNSERtSWk5alROUF94Z3xBQ3Jtc0ttdExPMTVUbEZpaVFWX2V2emNBb0dUdXpybmZqQmdqeXpQUHBSTVZpVVZFWklqRHhERlpuakIyYmI5dXpXdTIxRGd1bXgydUNEalZfRS1PdW9ZeGl3dHd1bjVXczI1T3Z1dFc1WThkQXJDS3dtamdFRQ&amp;q=https%3A%2F%2Fcompletejavaclasses.com%2Findex.html">
									<i class="fab fa-youtube youtube-bg"></i>
								</a> <a href="https://www.instagram.com/cjc_pune/"> <i
									class="fab fa-instagram instagram-bg"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6 mb-30">
						<div class="footer-widget ps-lg-5">
							<div class="footer-widget-heading">
								<h3>Useful Links</h3>
							</div>
							<ul class="list-unstyled">
								<li><a href="#enroll">Enroll Student</a></li>
								<li><a href="#view">Database</a></li>
								<li><a href="#">About us</a></li>
								<li><a href="#">Our Services</a></li>
								<li><a href="#">Expert Team</a></li>
								<li><a href="#">Contact us</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6 mb-50">
						<div class="footer-widget">
							<div class="footer-widget-heading">
								<h3>Newsletter</h3>
							</div>
							<div class="footer-text mb-25">
								<p>Don't miss to subscribe to our new feeds, kindly fill the
									form below.</p>
							</div>
							<div class="subscribe-form input-group mt-3">
								<input type="text" class="form-control"
									placeholder="Email Address">
								<button class="btn btn-primary">
									<i class="fab fa-telegram-plane"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-area">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6 text-center text-lg-left">
						<div class="copyright-text">
							<p>
								Copyright &copy; 2025, All Right Reserved <a href="#">EduManage</a>
							</p>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
						<div class="footer-menu">
							<ul class="list-unstyled mb-0">
								<li><a href="#">Home</a></li>
								<li><a href="#">Terms</a></li>
								<li><a href="#">Privacy</a></li>
								<li><a href="#">Policy</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
</body>
</html>