<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fee Statement | ${student.studentFullName}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style type="text/css">
body {
	background-color: #f4f7f6;
	font-family: 'Poppins', sans-serif;
}

.receipt-card {
	background: white;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	padding: 40px;
	margin-top: 50px;
}

.status-badge {
	font-size: 1.1rem;
	padding: 8px 20px;
	border-radius: 50px;
}

.progress {
	height: 15px;
	border-radius: 10px;
}

@media print {
	.no-print {
		display: none;
	}
	.receipt-card {
		box-shadow: none;
		border: 1px solid #ddd;
	}
}
</style>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">

				<div class="no-print mb-3 mt-4 d-flex justify-content-between">
					<a href="javascript:history.back()" class="btn btn-outline-primary">
						<i class="fas fa-arrow-left"></i> Back to Portal
					</a>
					<button onclick="window.print()" class="btn btn-success">
						<i class="fas fa-print"></i> Print Statement
					</button>
				</div>

				<div class="receipt-card">
					<div class="text-center mb-5">
						<h2 class="fw-bold text-primary">EDUMANAGE</h2>
						<h5 class="text-muted">Official Fee Statement</h5>
					</div>

					<div class="row mb-4">
						<div class="col-md-6">
							<p class="mb-1 text-muted small">STUDENT NAME</p>
							<h4 class="fw-bold">${student.studentFullName}</h4>
							<p class="mb-0 text-muted small">
								STUDENT ID: <strong>#${student.studentId}</strong>
							</p>
						</div>
						<div class="col-md-6 text-md-end">
							<p class="mb-1 text-muted small">STATUS</p>
							<span
								class="badge status-badge ${student.feesStatus == 'Paid' ? 'bg-success' : 'bg-warning text-dark'}">
								${student.feesStatus} </span>
						</div>
					</div>

					<hr>

					<div class="row py-3">
						<div class="col-4">
							<p class="mb-1 text-muted small text-uppercase">Course</p>
							<p class="fw-bold">${student.studentCourse}</p>
						</div>
						<div class="col-4 text-center">
							<p class="mb-1 text-muted small text-uppercase">Batch</p>
							<p class="fw-bold">${student.batchNumber}</p>
						</div>
						<div class="col-4 text-end">
							<p class="mb-1 text-muted small text-uppercase">Mode</p>
							<p class="fw-bold text-primary">${student.batchMode}</p>
						</div>
					</div>

					<c:set var="totalFee"
						value="${student.studentCourse == 'Java' ? 30000 : 40000}" />
					<c:set var="percent" value="${(student.feesPaid / totalFee) * 100}" />

					<div class="mt-4">
						<div class="d-flex justify-content-between mb-2">
							<span class="fw-bold">Payment Progress</span> <span
								class="fw-bold text-primary">${percent}%</span>
						</div>
						<div class="progress mb-4">
    <div class="progress-bar progress-bar-striped progress-bar-animated 
         ${student.feesStatus == 'Paid' ? 'bg-success' : 'bg-primary'}"
         role="progressbar" 
         style="width: ${percent}%"> </div>
</div>
					</div>

					<div class="table-responsive mt-4">
						<table class="table table-bordered align-middle">
							<thead class="bg-light">
								<tr>
									<th>Description</th>
									<th class="text-end">Amount</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Tuition Fee (${student.studentCourse})</td>
									<td class="text-end fw-bold">₹${totalFee}</td>
								</tr>
								<tr>
									<td class="text-success">Total Amount Paid</td>
									<td class="text-end text-success fw-bold">(-)
										₹${student.feesPaid}</td>
								</tr>
								<tr class="table-danger">
									<td class="fw-bold">Outstanding Balance Due</td>
									<td class="text-end fw-bold text-danger">₹${totalFee - student.feesPaid}</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="mt-5 p-3 bg-light rounded text-center small text-muted">
						<p class="mb-1">This is a computer-generated document and does
							not require a signature.</p>
						<p class="mb-0">University: ${student.studentCollageName}</p>
					</div>
				</div>

				<div class="text-center mt-4 text-muted small">
					<p>&copy; 2025 EduManage Administration Portal</p>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
</body>
</html>