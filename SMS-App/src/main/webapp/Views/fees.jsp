<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fee Payment | Student Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
    body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .payment-card {
        background: white;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        overflow: hidden;
        max-width: 800px;
        width: 100%;
    }

    .card-header-custom {
        background: #0d6efd;
        color: white;
        padding: 20px;
        text-align: center;
    }

    .info-label {
        color: #6c757d;
        font-size: 0.85rem;
        text-transform: uppercase;
        font-weight: 600;
        margin-bottom: 2px;
    }

    .info-value {
        color: #212529;
        font-weight: 500;
        font-size: 1.1rem;
        margin-bottom: 15px;
    }

    .amount-box {
        background: #f8f9fa;
        border: 2px dashed #dee2e6;
        border-radius: 15px;
        padding: 25px;
    }

    .btn-pay {
        padding: 12px 30px;
        border-radius: 10px;
        font-weight: 600;
        transition: all 0.3s;
    }

    .btn-pay:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(25, 135, 84, 0.3);
    }
</style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="payment-card border-0">
        <div class="card-header-custom">
            <h4 class="mb-0"><i class="bi bi-wallet2 me-2"></i>Fee Installment Portal</h4>
        </div>
        
        <div class="p-4 p-md-5">
            <div class="row">
                <div class="col-md-6 border-end">
                    <h6 class="text-primary mb-4 fw-bold text-uppercase border-bottom pb-2">Student Summary</h6>
                    
                    <div class="info-label">Student ID</div>
                    <div class="info-value">#${st.studentId}</div>
                    
                    <div class="info-label">Full Name</div>
                    <div class="info-value">${st.studentFullName}</div>
                    
                    <div class="info-label">Course & Batch</div>
                    <div class="info-value">
                        <span class="badge bg-primary-subtle text-primary">${st.studentCourse}</span>
                        <span class="badge bg-secondary-subtle text-secondary">${st.batchNumber}</span>
                    </div>

                    <div class="mt-4 p-3 bg-danger-subtle rounded-3">
                        <div class="info-label text-danger">Total Fees Paid to Date</div>
                        <div class="h4 text-danger mb-0">$${st.feesPaid}</div>
                    </div>
                </div>

                <div class="col-md-6 ps-md-5 mt-4 mt-md-0">
                    <h6 class="text-primary mb-4 fw-bold text-uppercase border-bottom pb-2">New Payment</h6>
                    
                    <form action="payfees">
                        <input type="hidden" name="studentid" value="${st.studentId}">
                        
                        <div class="amount-box text-center mb-4">
                            <label for="amount" class="form-label fw-bold text-dark">Installment Amount</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text bg-white border-end-0 text-success">$</span>
                                <input type="number" 
                                       name="amount" 
                                       id="amount" 
                                       class="form-control border-start-0 ps-0" 
                                       placeholder="0.00" 
                                       max="30000" 
                                       required>
                            </div>
                            <div class="form-text mt-2">Maximum limit: $30,000 per transaction</div>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-pay">
                                <i class="bi bi-shield-check me-2"></i>Authorize Payment
                            </button>
                            <a href="login?username=admin&password=admin" class="btn btn-link text-muted btn-sm mt-2 text-decoration-none">
                                <i class="bi bi-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="bg-light p-3 text-center border-top">
            <small class="text-muted">A secure payment transaction for <strong>${st.studentFullName}</strong></small>
        </div>
    </div>
</div>

</body>
</html>