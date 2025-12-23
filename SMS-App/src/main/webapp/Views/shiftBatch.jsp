<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shift Batch | EduManage Portal</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body { 
            background: #f0f2f5; 
            font-family: 'Poppins', sans-serif; 
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .main-card {
            border: none;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            background: #fff;
        }

        /* Left Side: Student Info Visual */
        .info-panel {
            background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
            color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .avatar-circle {
            width: 100px;
            height: 100px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            margin-bottom: 20px;
            border: 2px solid rgba(255,255,255,0.4);
        }

        /* Right Side: Form */
        .form-panel {
            padding: 50px;
        }

        .form-label {
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #6c757d;
            margin-bottom: 8px;
        }

        .readonly-box {
            background-color: #f8f9fc !important;
            border: 1px solid #eaecf4;
            color: #4e73df !important;
            font-weight: 600;
            padding: 12px 15px;
            border-radius: 12px;
        }

        .batch-select {
            border: 2px solid #eaecf4;
            border-radius: 12px;
            padding: 12px 15px;
            transition: all 0.3s;
        }

        .batch-select:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.1);
        }

        .btn-confirm {
            background: #4e73df;
            border: none;
            border-radius: 12px;
            padding: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-confirm:hover {
            background: #224abe;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 115, 223, 0.3);
        }

        .btn-cancel {
            border-radius: 12px;
            padding: 12px;
            font-weight: 500;
            color: #858796;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s;
        }

        .btn-cancel:hover {
            background: #f8f9fc;
            color: #3a3b45;
        }

        /* Animation */
        .fade-in-up {
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10 col-xl-8">
            <div class="main-card shadow-lg fade-in-up">
                <div class="row g-0">
                    <div class="col-md-5 info-panel">
                        <div class="avatar-circle">
                            <i class="fas fa-user-graduate"></i>
                        </div>
                        <h4 class="fw-bold mb-1">${student.studentFullName}</h4>
                        <p class="opacity-75 mb-4 small">${student.studentEmail}</p>
                        
                        <div class="w-100 mt-3 p-3 rounded-4" style="background: rgba(0,0,0,0.1);">
                            <div class="small opacity-75">ID Number</div>
                            <div class="fw-bold">#MS-${student.studentId}</div>
                        </div>
                        
                        <div class="mt-5 text-start w-100">
                            <p class="small mb-0"><i class="fas fa-info-circle me-2"></i> Batch shifting will update all academic schedules for this student.</p>
                        </div>
                    </div>

                    <div class="col-md-7 form-panel text-dark">
                        <h3 class="fw-bold mb-4">Batch Transition</h3>
                        
                        <form action="update_batch_process" method="get">
                            <input type="hidden" name="studentId" value="${student.studentId}">
                            
                            <div class="mb-4">
                                <label class="form-label fw-bold">Current Assignment</label>
                                <div class="readonly-box d-flex align-items-center">
                                    <i class="fas fa-layer-group me-3 text-primary"></i>
                                    ${student.batchNumber}
                                </div>
                            </div>

                            <div class="mb-5">
                                <label class="form-label fw-bold">Select Destination Batch</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0 border-2" style="border-radius: 12px 0 0 12px; border: 2px solid #eaecf4;">
                                        <i class="fas fa-share text-muted"></i>
                                    </span>
                                    <select class="form-select batch-select border-start-0" name="newBatch" required style="border-radius: 0 12px 12px 0;">
                                        <option value="" disabled selected>Choose target batch...</option>
                                        <option value="FDJ-185">FDJ-185 (Java Fullstack)</option>
                                        <option value="REG-185">REG-185 (Regular Python)</option>
                                        <option value="FDJ-161">FDJ-161 (Advanced Java)</option>
                                        <option value="REG-161">REG-161 (Advanced Data Science)</option>
                                    </select>
                                </div>
                            </div>

                            <div class="d-grid gap-3">
                                <button type="submit" class="btn btn-primary btn-confirm">
                                    <i class="fas fa-check-circle me-2"></i> Confirm Batch Shift
                                </button>
                                <a href="view" class="btn-cancel">
                                    <i class="fas fa-times me-1"></i> Discard and Go Back
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>