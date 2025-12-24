<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student Profile | EduManage</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root { 
            --primary-gradient: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);
            --success-bg: #ecfdf5;
            --success-text: #059669;
            --disabled-gray: #cbd5e1;
        }
        body { font-family: 'Poppins', sans-serif; background: #f1f5f9; min-height: 100vh; display: flex; align-items: center; padding: 40px 0; }
        .edit-card { background: white; border-radius: 30px; box-shadow: 0 25px 50px -12px rgba(0,0,0,0.1); overflow: hidden; max-width: 1150px; width: 95%; margin: auto; }
        .sidebar-brand { background: var(--primary-gradient); color: white; padding: 50px 30px; text-align: center; }
        .profile-avatar { width: 130px; height: 130px; background: rgba(255,255,255,0.2); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; border: 4px solid rgba(255,255,255,0.4); font-size: 3.5rem; }
        .form-container { padding: 45px; background: #ffffff; }
        
        /* Attractive Fee Completion Message */
        .fee-completion-card {
            background: var(--success-bg);
            border: 1px dashed var(--success-text);
            border-radius: 15px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 15px;
            animation: fadeIn 0.5s ease-out;
        }
        .fee-completion-card i { font-size: 2rem; color: var(--success-text); }
        .fee-title { font-weight: 700; color: var(--success-text); margin-bottom: 0; }
        .fee-desc { font-size: 0.85rem; color: #065f46; margin-bottom: 0; opacity: 0.8; }

        .section-header { font-size: 0.8rem; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1.5px; margin: 30px 0 20px; display: flex; align-items: center; }
        .section-header::after { content: ""; flex: 1; height: 1px; background: #e2e8f0; margin-left: 15px; }
        
        .btn-update { 
            background: var(--primary-gradient); border: none; border-radius: 12px; padding: 14px; 
            color: white; font-weight: 600; transition: all 0.3s;
        }
        .btn-update:disabled { background: var(--disabled-gray); cursor: not-allowed; }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>
    <div class="edit-card">
        <div class="row g-0">
            <div class="col-lg-3 sidebar-brand">
                <div class="profile-avatar"><i class="fas fa-user-edit"></i></div>
                <h4 class="fw-bold">${student.studentFullName}</h4>
                <p class="opacity-75 small">ID: #${student.studentId}</p>
                <div class="mt-auto"><a href="view" class="btn btn-outline-light btn-sm rounded-pill px-4">Discard</a></div>
            </div>

            <div class="col-lg-9 form-container">
                <form id="editForm">
                    <input type="hidden" name="studentId" value="${student.studentId}">
                    
                    <div class="section-header">Identity & Schedule</div>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">Full Name</label>
                            <input type="text" name="studentFullName" class="form-control" value="${student.studentFullName}" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">Batch</label>
                            <select name="batchNumber" class="form-select">
                                <option value="B-101" ${student.batchNumber == 'B-101' ? 'selected' : ''}>B-101 (Morning)</option>
                                <option value="B-102" ${student.batchNumber == 'B-102' ? 'selected' : ''}>B-102 (Noon)</option>
                                <option value="B-103" ${student.batchNumber == 'B-103' ? 'selected' : ''}>B-103 (Evening)</option>
                                <option value="B-104" ${student.batchNumber == 'B-104' ? 'selected' : ''}>B-104 (Weekend)</option>
                            </select>
                        </div>
                    </div>

                    <div class="section-header">Academic & Financials</div>
                    <div class="row g-3">
                        <div class="col-12 mb-3">
                            <label class="form-label small fw-bold text-muted">Course Program</label>
                            <div class="p-3 border rounded bg-light d-flex justify-content-around">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="studentCourse" value="Java" id="j" ${student.studentCourse == 'Java' ? 'checked' : ''}>
                                    <label class="form-check-label fw-bold" for="j">Java Foundation (30k)</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="studentCourse" value="Python" id="p" ${student.studentCourse == 'Python' ? 'checked' : ''}>
                                    <label class="form-check-label fw-bold" for="p">Python Advanced (40k)</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted">Payment Progress</label>
                            <div class="input-group">
                                <c:set var="isLocked" value="${(student.studentCourse == 'Java' && student.feesPaid >= 30000) || (student.studentCourse == 'Python' && student.feesPaid >= 40000) || student.feesStatus == 'Paid'}" />
                                <span class="input-group-text"><i class="fas ${isLocked ? 'fa-shield-check text-success' : 'fa-wallet'}"></i></span>
                                <input type="number" id="feesPaid" name="feesPaid" class="form-control fw-bold" value="${student.feesPaid}" ${isLocked ? 'readonly' : ''}>
                                <span class="input-group-text bg-white"><i class="fas ${isLocked ? 'fa-lock text-danger' : 'fa-pen'}"></i></span>
                            </div>

                            <c:if test="${isLocked}">
                                <div class="fee-completion-card">
                                    <i class="fas fa-medal"></i>
                                    <div>
                                        <p class="fee-title">Account Fully Settled</p>
                                        <p class="fee-desc">The student has successfully completed the full fee requirement. No further action is needed.</p>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="mt-5 d-flex justify-content-between align-items-center">
                        <div id="statusMsg" class="small text-muted fw-bold">
                            <i class="fas fa-search me-1"></i> Waiting for changes...
                        </div>
                        <button type="button" id="saveBtn" onclick="handleUpdate()" class="btn btn-update px-5" disabled>
                            Update Profile
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const form = document.getElementById('editForm');
        const saveBtn = document.getElementById('saveBtn');
        const statusMsg = document.getElementById('statusMsg');
        const initialState = new FormData(form);
        const initialData = JSON.stringify(Object.fromEntries(initialState));

        form.addEventListener('input', () => {
            const currentData = JSON.stringify(Object.fromEntries(new FormData(form)));
            const isChanged = initialData !== currentData;
            saveBtn.disabled = !isChanged;
            statusMsg.innerHTML = isChanged ? 
                '<i class="fas fa-edit text-primary me-1"></i> Changes detected' : 
                '<i class="fas fa-search me-1"></i> Waiting for changes...';
            statusMsg.className = isChanged ? 'small text-primary fw-bold' : 'small text-muted fw-bold';
        });

        function handleUpdate() {
            const formData = new FormData(form);
            saveBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Saving...';
            saveBtn.disabled = true;
            fetch('update_student_process', { method: 'POST', body: new URLSearchParams(formData) })
            .then(() => { window.location.href = 'view'; });
        }
    </script>
</body>
</html>