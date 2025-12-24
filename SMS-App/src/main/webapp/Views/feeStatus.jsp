<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fee Statement | ${student.studentFullName}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style type="text/css">
    :root {
        --primary-blue: #4e73df;
        --success-green: #1cc88a;
        --warning-yellow: #f6c23e;
        --dark-slate: #2e3759;
    }

    body {
        background: linear-gradient(135deg, #f8f9fc 0%, #e2e8f0 100%);
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        color: #444;
    }

    /* Main Card Styling */
    .receipt-card {
        background: #ffffff;
        border-radius: 25px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.12);
        padding: 50px;
        margin-top: 50px;
        position: relative;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.7);
    }

    /* Subtle University Watermark */
    .receipt-card::after {
        content: '\f19c'; 
        font-family: 'Font Awesome 6 Free';
        font-weight: 900;
        position: absolute;
        bottom: -30px;
        right: -30px;
        font-size: 18rem;
        color: rgba(78, 115, 223, 0.04);
        transform: rotate(-15deg);
        pointer-events: none;
    }

    .brand-title {
        color: var(--primary-blue);
        letter-spacing: 4px;
        font-weight: 800;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.05);
    }

    /* Header Summary Boxes */
    .info-summary {
        background: #f8f9fc;
        border-radius: 15px;
        padding: 20px;
        border-left: 5px solid var(--primary-blue);
    }

    .status-badge {
        font-size: 0.85rem;
        font-weight: 700;
        padding: 10px 25px;
        border-radius: 50px;
        text-transform: uppercase;
        letter-spacing: 1px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    /* Modern Progress Bar */
    .progress {
        height: 20px;
        background-color: #edf2f7;
        border-radius: 50px;
        box-shadow: inset 0 2px 4px rgba(0,0,0,0.05);
    }

    .progress-bar {
        border-radius: 50px;
        background-image: linear-gradient(45deg, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);
        background-size: 1rem 1rem;
        transition: width 1.5s ease-in-out;
    }

    /* Professional Table */
    .table thead th {
        background-color: var(--dark-slate);
        color: #fff;
        border: none;
        padding: 18px;
        font-weight: 500;
    }

    .table tbody td {
        padding: 18px;
        vertical-align: middle;
        border-bottom: 1px solid #f1f4f8;
    }

    .balance-row {
        background-color: #fff5f5 !important;
        font-size: 1.1rem;
    }

    /* Buttons */
    .btn-action {
        border-radius: 12px;
        padding: 10px 24px;
        font-weight: 600;
        transition: all 0.3s;
    }

    @media print {
        .no-print { display: none; }
        body { background: white; }
        .receipt-card { box-shadow: none; border: 1px solid #eee; margin: 0; padding: 30px; }
    }
</style>
</head>
<body>

<div class="container pb-5">
    <div class="row justify-content-center">
        <div class="col-lg-9 col-md-11">

            <div class="no-print mb-3 mt-4 d-flex justify-content-between">
                <a href="javascript:history.back()" class="btn btn-outline-primary btn-action">
                    <i class="fas fa-chevron-left me-2"></i> Back to Database
                </a>
                <button onclick="window.print()" class="btn btn-success btn-action">
                    <i class="fas fa-print me-2"></i> Download PDF
                </button>
            </div>

            <div class="receipt-card">
                <div class="text-center mb-5">
                    <h1 class="brand-title m-0">EDUMANAGE</h1>
                    <p class="text-muted text-uppercase fw-bold" style="font-size: 0.8rem;">Institution Administration & Financial Record</p>
                </div>

                <div class="row align-items-center mb-5">
                    <div class="col-md-7">
                        <label class="text-muted small fw-bold text-uppercase">Student Account</label>
                        <h2 class="fw-bold mb-1">${student.studentFullName}</h2>
                        <p class="text-primary fw-bold mb-0">Reg ID: #${student.studentId}</p>
                    </div>
                    <div class="col-md-5 text-md-end mt-3 mt-md-0">
                        <label class="text-muted small fw-bold text-uppercase d-block mb-2">Account Status</label>
                        <span class="badge status-badge ${student.feesStatus == 'Paid' ? 'bg-success' : 'bg-warning text-dark'}">
                            <i class="fas ${student.feesStatus == 'Paid' ? 'fa-check-circle' : 'fa-clock'} me-1"></i> 
                            ${student.feesStatus}
                        </span>
                    </div>
                </div>

                <div class="row info-summary mb-5">
                    <div class="col-4">
                        <small class="text-muted text-uppercase fw-bold d-block">Course Selection</small>
                        <span class="fw-bold text-dark">${student.studentCourse}</span>
                    </div>
                    <div class="col-4 border-start">
                        <small class="text-muted text-uppercase fw-bold d-block">Assigned Batch</small>
                        <span class="fw-bold text-dark">${student.batchNumber}</span>
                    </div>
                    <div class="col-4 border-start">
                        <small class="text-muted text-uppercase fw-bold d-block">Instruction Mode</small>
                        <span class="fw-bold text-primary"><i class="fas fa-globe me-1"></i> ${student.batchMode}</span>
                    </div>
                </div>

                <c:set var="totalFee" value="${student.studentCourse == 'Java' ? 30000 : 40000}" />
                <c:set var="percent" value="${(student.feesPaid / totalFee) * 100}" />

                <div class="mb-5">
                    <div class="d-flex justify-content-between align-items-end mb-2">
                        <h6 class="fw-bold m-0"><i class="fas fa-chart-line text-primary me-2"></i>Payment Progress</h6>
                        <span class="h4 fw-bold text-primary mb-0">${percent}%</span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated 
                             ${student.feesStatus == 'Paid' ? 'bg-success' : 'bg-primary'}"
                             role="progressbar" 
                             style="width: ${percent}%"> 
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th class="ps-4">Transaction Description</th>
                                <th class="text-end pe-4">Amount (INR)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold">Course Tuition Fee</div>
                                    <small class="text-muted">Standard enrollment for ${student.studentCourse} curriculum</small>
                                </td>
                                <td class="text-end pe-4 fw-bold">₹${totalFee}</td>
                            </tr>
                            <tr>
                                <td class="ps-4 text-success">
                                    <div class="fw-bold">Total Credits Applied</div>
                                    <small class="text-muted">Aggregate payments received to date</small>
                                </td>
                                <td class="text-end pe-4 text-success fw-bold">(-) ₹${student.feesPaid}</td>
                            </tr>
                            <tr class="balance-row">
                                <td class="ps-4 fw-bold text-danger">Remaining Financial Liability</td>
                                <td class="text-end pe-4 fw-bold text-danger">₹${totalFee - student.feesPaid}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-5 p-4 border-top text-center">
                    <p class="text-muted small mb-2">
                        <i class="fas fa-info-circle me-1"></i> 
                        This statement reflects the current ledger status as per the <strong>${student.studentCollageName}</strong> administration records.
                    </p>
                    <div class="d-flex justify-content-center gap-4 mt-3">
                        <img src="Images/logo.jpeg" height="30" style="opacity: 0.5;" alt="EduManage">
                        <div class="border-start ps-4 text-start">
                            <small class="d-block text-muted">Verified Document</small>
                            <small class="fw-bold">Digital ID: SEC-${student.studentId}X99</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4 mb-5 text-muted small">
                <p>&copy; 2025 EduManage Cloud Systems. All transactions are end-to-end encrypted.</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>