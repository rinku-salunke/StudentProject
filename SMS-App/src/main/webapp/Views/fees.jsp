<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Secure Payment Portal | ${st.studentFullName}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
    :root {
        --primary-blue: #2563eb;
        --success-green: #059669;
        --bg-slate: #f8fafc;
    }

    body {
        background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Inter', sans-serif;
        color: #1e293b;
        padding: 20px;
    }

    .payment-card {
        background: rgba(255, 255, 255, 0.98);
        border-radius: 24px;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        overflow: hidden;
        max-width: 950px;
        width: 100%;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .card-header-custom {
        background: white;
        padding: 30px;
        text-align: left;
        border-bottom: 1px solid #e2e8f0;
    }

    .card-header-custom h4 {
        font-weight: 700;
        color: #0f172a;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .info-label {
        color: #64748b;
        font-size: 0.75rem;
        text-transform: uppercase;
        font-weight: 700;
        letter-spacing: 0.05em;
        margin-bottom: 6px;
    }

    .info-value {
        color: #0f172a;
        font-weight: 600;
        font-size: 1.05rem;
        margin-bottom: 24px;
    }

    .summary-pane {
        background-color: #f1f5f9;
        border-radius: 16px;
        padding: 32px;
        height: 100%;
    }

    .paid-stat {
        background: white;
        padding: 20px;
        border-radius: 12px;
        border-left: 4px solid #ef4444;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
    }

    .amount-box {
        background: #ffffff;
        border: 2px solid #e2e8f0;
        border-radius: 16px;
        padding: 32px;
        transition: all 0.2s ease;
    }

    .amount-box:focus-within {
        border-color: var(--primary-blue);
        box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
    }

    .input-group-text {
        background: transparent;
        border: none;
        font-weight: 600;
        font-size: 1.5rem;
        color: var(--success-green);
    }

    .form-control {
        border: none;
        font-weight: 700;
        font-size: 1.75rem;
        padding: 0;
    }

    .form-control:focus {
        box-shadow: none;
    }

    .btn-pay {
        background: var(--primary-blue);
        border: none;
        padding: 16px;
        border-radius: 12px;
        font-weight: 600;
        font-size: 1rem;
        transition: transform 0.2s, background 0.2s;
        box-shadow: 0 10px 15px -3px rgba(37, 99, 235, 0.3);
    }

    .btn-pay:hover {
        background: #1d4ed8;
        transform: translateY(-2px);
    }

    .badge-custom {
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.85rem;
    }
</style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="payment-card">
        <div class="card-header-custom">
            <h4><i class="bi bi-shield-check text-primary"></i> Payment Gateway</h4>
        </div>
        
        <div class="p-4 p-md-5">
            <div class="row g-5">
                <div class="col-md-5">
                    <div class="summary-pane">
                        <h6 class="fw-bold mb-4 text-dark">Enrollment Summary</h6>
                        
                        <div class="info-label">Student Reference</div>
                        <div class="info-value">#${st.studentId}</div>
                        
                        <div class="info-label">Full Legal Name</div>
                        <div class="info-value text-capitalize">${st.studentFullName}</div>
                        
                        <div class="info-label">Active Course</div>
                        <div class="mb-4">
                            <span class="badge bg-primary badge-custom me-2">${st.studentCourse}</span>
                            <span class="badge bg-dark badge-custom">${st.batchNumber}</span>
                        </div>

                        <div class="paid-stat">
                            <div class="info-label text-danger mb-1">Accumulated Payments</div>
                            <div class="h3 fw-bold mb-0">₹${st.feesPaid}</div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <h6 class="fw-bold mb-4 text-dark">Transaction Portal</h6>
                    
                    <c:set var="target" value="${st.studentCourse == 'Java' ? 30000 : 40000}" />
                    
                    <c:choose>
                        <c:when test="${st.feesPaid >= target || st.feesStatus == 'Paid'}">
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <i class="bi bi-patch-check-fill text-success" style="font-size: 4rem;"></i>
                                </div>
                                <h4 class="fw-bold">Account Fully Settled</h4>
                                <p class="text-muted small px-lg-5">Your payment obligations for the ${st.studentCourse} curriculum have been met.</p>
                                <div class="mt-4">
                                    <a href="view" class="btn btn-outline-dark px-4 py-2 rounded-pill fw-bold">
                                        <i class="bi bi-arrow-left me-2"></i>Dashboard
                                    </a>
                                </div>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <form action="payFees">
                                <input type="hidden" name="studentid" value="${st.studentId}">
                                
                                <div class="amount-box mb-4">
                                    <label for="amount" class="info-label d-block mb-3">Installment Amount</label>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <input type="number" name="amount" id="amount" 
                                               class="form-control" placeholder="0.00" 
                                               max="${target - st.feesPaid}" required min="1">
                                    </div>
                                    <div class="mt-3 pt-3 border-top d-flex justify-content-between align-items-center">
                                        <span class="text-muted small fw-medium">Remaining Liability:</span>
                                        <span class="fw-bold text-danger">₹${target - st.feesPaid}</span>
                                    </div>
                                </div>

                                <div class="d-grid gap-3">
                                    <button type="submit" class="btn btn-primary btn-pay text-white">
                                        Confirm & Authorize Payment
                                    </button>
                                    <a href="view" class="btn btn-link text-muted text-decoration-none small text-center fw-medium">
                                        Cancel Transaction
                                    </a>
                                </div>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        
        <div class="bg-light p-3 text-center border-top">
            <small class="text-muted fw-medium"><i class="bi bi-lock-fill me-1"></i> End-to-end encrypted transaction for account holder <strong>${st.studentFullName}</strong></small>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>