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

/* --- PROFESSIONAL UPDATED FOOTER STYLES --- */
.main-footer {
    background-color: #1a1d23;
    color: #adb5bd;
    padding-top: 60px;
}

.footer-brand {
    font-size: 1.5rem;
    font-weight: 700;
    color: #fff;
    letter-spacing: -0.5px;
}

.footer-heading {
    color: #fff;
    font-size: 0.9rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 25px;
}

.footer-link {
    color: #adb5bd;
    text-decoration: none;
    display: block;
    margin-bottom: 12px;
    transition: 0.3s;
    font-size: 0.95rem;
}

.footer-link:hover {
    color: #4e73df;
    padding-left: 5px;
}

.social-icon {
    width: 36px;
    height: 36px;
    background: rgba(255,255,255,0.05);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    color: #fff;
    margin-right: 10px;
    transition: 0.3s;
    text-decoration: none;
}

.social-icon:hover {
    background: #4e73df;
    transform: translateY(-3px);
    color: white;
}

.system-status {
    background: rgba(28, 200, 138, 0.1);
    color: #1cc88a;
    padding: 5px 12px;
    border-radius: 50px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
}

.status-dot {
    height: 8px;
    width: 8px;
    background-color: #1cc88a;
    border-radius: 50%;
    display: inline-block;
    margin-right: 8px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { opacity: 1; }
    50% { opacity: 0.4; }
    100% { opacity: 1; }
}

.footer-bottom {
    border-top: 1px solid rgba(255,255,255,0.05);
    padding: 25px 0;
    margin-top: 50px;
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
			if (actionPath === '/batch') {
				window.location.href = "batch?id=" + selectedValue;
				return;
			}
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
	    for (let i = 0; i < radios.length; i++) {
	        if (radios[i].checked) {
	            selectedValue = radios[i].value;
	            break;
	        }
	    }
	    if (selectedValue) {
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
	        
	        if (lowerMsg.includes("success") || lowerMsg.includes("shifted") || 
	            lowerMsg.includes("deleted") || lowerMsg.includes("payment")) {
	            
	            if (lowerMsg.includes("payment")) {
	                modalTitle.innerText = "Fee Updated!";
	            } else if (lowerMsg.includes("deleted")) {
	                modalTitle.innerText = "Student Deleted Successfully!";
	            } else if (lowerMsg.includes("shifted")) {
	                modalTitle.innerText = "Batch Shifted!";
	            } else {
	                modalTitle.innerText = "Enrolled Successfully!";
	            }
	            modalTitle.className = "fw-bold mb-3 text-success";
	            successIcon.classList.remove('d-none');
	            errorIcon.classList.add('d-none');
	            modalBtn.style.backgroundColor = "#28a745"; 
	            modalBtn.classList.add('btn-success');
	        } else {
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
        			<i class="fas fa-file-invoice-dollar"></i> Fee Status
    			</button>
				 <a href="/" class="btn btn-sm btn-danger btn-modern"><i class="fas fa-sign-out-alt"></i></a>
			</div>
		</div>
	</nav>

	<section class="hero-section" id="enroll">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-10">
					<div class="glass-card shadow-lg">
						<h2 class="text-center fw-bold mb-4 text-dark">Enroll New Student</h2>
						<form action="enroll_student" id="enroll-form">
							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label small fw-bold">Full Name</label> 
									<input type="text" class="form-control" name="studentFullName" placeholder="Enter Full Name" required>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Email Address</label> 
									<input type="email" class="form-control" name="studentEmail" placeholder="Enter Email" required>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Age</label> 
									<input type="number" class="form-control" name="StudentAge" placeholder="Age">
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">College</label> 
									<input type="text" class="form-control" name="studentCollageName" placeholder="University Name">
								</div>
								<div class="col-12">
									<label class="form-label small fw-bold">Course Selection</label>
									<div class="p-2 border rounded bg-light text-center">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="StudentCourse" value="Java" id="java" checked>
											<label class="form-check-label" for="java">Java Development</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="StudentCourse" value="Python" id="python"> 
											<label class="form-check-label" for="python">Python Data Science</label>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Mode</label> 
									<select class="form-select" name="batchMode">
										<option value="Online">🌐 Online</option>
										<option value="Offline">🏫 Offline</option>
									</select>
								</div>
								<div class="col-md-6">
									<label class="form-label small fw-bold">Batch ID</label> 
									<select class="form-select" name="batchNumber">
										<option value="FDJ-185">FDJ-185</option>
										<option value="REG-185">REG-185</option>
										<option value="FDJ-161">FDJ-161</option>
										<option value="REG-161">REG-161</option>
									</select>
								</div>
								<div class="col-12">
									<label class="form-label small fw-bold">Fees Paid (INR)</label>
									<input type="number" class="form-control" name="feesPaid" placeholder="Amount">
								</div>
							</div>
							<button class="btn btn-enroll btn-modern w-100 mt-4 py-3" type="submit">Complete Enrollment</button>
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
				<p class="text-muted">Manage records, process payments, and update schedules.</p>
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
			                <button type="button" id="modalBtn" class="btn w-100 py-3 fw-bold shadow-sm" data-bs-dismiss="modal" style="border-radius: 50px; border: none; font-size: 1.1rem; transition: 0.3s;">
			                    OK
			                </button>
			            </div>
			        </div>
			    </div>
			</div>

			<div class="table-container shadow bg-white rounded">
			    <c:choose>
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
			                                            <button type="button" class="btn btn-sm btn-outline-warning" onclick="handleAction('/edit')">
			                                                <i class="fas fa-edit"></i>
			                                            </button>
			                                            <button type="button" class="btn btn-sm btn-outline-success" onclick="handleAction('/fees')">
			                                                <i class="fas fa-file-invoice-dollar"></i>
			                                            </button>
			                                            <button type="button" class="btn btn-sm btn-outline-primary" onclick="handleAction('/batch')">
			                                                <i class="fas fa-exchange-alt"></i>
			                                            </button>
			                                            <button type="button" class="btn btn-sm btn-outline-danger" onclick="handleAction('/remove')">
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
		        <c:otherwise>
		            <div class="text-center py-5">
		                <i class="fas fa-search-minus text-muted mb-3" style="font-size: 5rem; opacity: 0.2;"></i>
		                <h4 class="fw-bold text-dark">No records available</h4>
		                <a href="view" class="btn btn-primary btn-modern mt-3 px-4">View All Students</a>
		            </div>
		        </c:otherwise>
		    </c:choose>
			</div>
		</div>
	</section>

	<footer class="main-footer">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-4 mb-4">
	                <div class="footer-brand mb-3">
	                    <i class="fas fa-graduation-cap text-primary me-2"></i>Student Management<span class="text-primary">.</span>
	                </div>
	                <p class="mb-4 pe-lg-5">
	                    A comprehensive administrative solution for managing student lifecycles, financial records, and academic scheduling in real-time.
	                </p>
	                <div class="d-flex">
	                    <a href="https://linkedin.com" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
	                    <a href="https://facebook.com" class="social-icon"><i class="fab fa-facebook-f"></i></a>
	                    <a href="https://twitter.com" class="social-icon"><i class="fab fa-twitter"></i></a>
	                    <a href="https://youtube.com" class="social-icon"><i class="fab fa-youtube"></i></a>
	                </div>
	            </div>
	
	            <div class="col-6 col-md-3 col-lg-2 mb-4">
	                <h6 class="footer-heading">Management</h6>
	                <a href="#view" class="footer-link">Dashboard</a>
	                <a href="#enroll" class="footer-link">Enrollment</a>
	                <a href="#" class="footer-link">Fee Analytics</a>
	                <a href="#" class="footer-link">Batch Scheduling</a>
	            </div>
	
	            <div class="col-6 col-md-3 col-lg-2 mb-4">
	                <h6 class="footer-heading">Support</h6>
	                <a href="#" class="footer-link">Help Center</a>
	                <a href="#" class="footer-link">System Logs</a>
	                <a href="#" class="footer-link">Privacy Policy</a>
	                <a href="#" class="footer-link">Terms of Service</a>
	            </div>
	
	            <div class="col-lg-4 mb-4 text-lg-end">
	                <h6 class="footer-heading">Service Status</h6>
	                <div class="system-status mb-3">
	                    <span class="status-dot"></span>System Operational
	                </div>
	                <p class="small mb-1">Office: 1010 Avenue, Chandigarh</p>
	                <p class="small text-white-50">Email: admin@edumanage.com</p>
	            </div>
	        </div>
	
	        <div class="footer-bottom">
	            <div class="row align-items-center">
	                <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
	                    <p class="mb-0 small">&copy; 2025 EduManage Systems. Built with <i class="fas fa-heart text-danger"></i> for Education.</p>
	                </div>
	                <div class="col-md-6 text-center text-md-end">
	                    <img src="Images/logo.jpeg" height="30" style="filter: grayscale(1) brightness(2); opacity: 0.5; border-radius: 4px;" alt="Logo">
	                </div>
	            </div>
	        </div>
	    </div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>