<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Judges | CodeVerse Admin</title>
   
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* ========== DASHBOARD LAYOUT STYLES (fixed header & sidebar) ========== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
            color: #1e293b;
            overflow-x: hidden;
        }
        .app-wrapper {
            display: flex;
            min-height: 100vh;
            height: 100vh;
            overflow: hidden;
        }
        /* Sidebar */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
            color: #e2e8f0;
            transition: width 0.3s ease;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0 20px rgba(0,0,0,0.08);
            height: 100vh;
        }
        .sidebar.collapsed {
            width: 80px;
        }
        .sidebar-header {
            padding: 24px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .logo-area {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .logo-icon {
            background: #3b82f6;
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 700;
            color: white;
        }
        .logo-text {
            font-size: 1.25rem;
            font-weight: 600;
            color: white;
            white-space: nowrap;
        }
        .sidebar.collapsed .logo-text {
            display: none;
        }
        .toggle-btn {
            background: rgba(255,255,255,0.1);
            border: none;
            color: #cbd5e1;
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
        }
        .toggle-btn:hover {
            background: rgba(255,255,255,0.2);
            color: white;
        }
        .sidebar.collapsed .toggle-btn i {
            transform: rotate(180deg);
        }
        .sidebar-menu {
            flex: 1;
            padding: 20px 0;
            overflow-y: auto;
        }
        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 24px;
            margin: 4px 8px;
            border-radius: 12px;
            color: #cbd5e1;
            transition: 0.2s;
            white-space: nowrap;
        }
        .menu-item i {
            font-size: 1.25rem;
            min-width: 36px;
        }
        .menu-item span {
            margin-left: 8px;
            font-weight: 500;
        }
        .menu-item:hover, .menu-item.active {
            background: rgba(59, 130, 246, 0.2);
            color: white;
        }
        .sidebar.collapsed .menu-item span {
            display: none;
        }
        .sidebar.collapsed .menu-item {
            justify-content: center;
            padding: 12px 0;
        }
        /* Main content */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
            height: 100vh;
            overflow: hidden;
        }
        /* Header (fixed) */
        .top-header {
            background: white;
            padding: 16px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            border-bottom: 1px solid #e9eef2;
        }
        .header-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #475569;
            cursor: pointer;
        }
        .page-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #0f172a;
        }
        .header-right {
            display: flex;
            align-items: center;
            gap: 25px;
        }
        .notification-icon {
            position: relative;
            font-size: 1.25rem;
            color: #475569;
            cursor: pointer;
        }
        .notification-badge {
            position: absolute;
            top: -6px;
            right: -6px;
            background: #ef4444;
            color: white;
            font-size: 0.6rem;
            padding: 2px 5px;
            border-radius: 20px;
        }
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        .user-avatar {
            width: 40px;
            height: 40px;
            background: #3b82f6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }
        .user-info {
            display: none;
        }
        @media (min-width: 768px) {
            .user-info {
                display: block;
            }
            .user-info .name {
                font-weight: 600;
                font-size: 0.95rem;
                color: #1e293b;
            }
            .user-info .role {
                font-size: 0.75rem;
                color: #64748b;
            }
        }
        /* Scrollable content area */
        .content-area {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
        }
        /* Footer */
        .footer {
            background: white;
            padding: 20px 30px;
            border-top: 1px solid #e9eef2;
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
        }
        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                position: fixed;
                left: -260px;
                height: 100vh;
                z-index: 1000;
                transition: left 0.3s ease;
            }
            .sidebar.mobile-open {
                left: 0;
            }
            .main-content {
                width: 100%;
            }
            .mobile-menu-btn {
                display: block;
            }
            .top-header {
                padding: 16px 20px;
            }
            .content-area {
                padding: 20px;
            }
        }

        /* ========== CUSTOM FORM STYLES ========== */
        .form-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }
        .table-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }
        .card-header-custom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f1f5f9;
        }
        .card-header-custom h3 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .card-header-custom i { color: #3b82f6; }
        .input-group {
            display: flex;
            align-items: center;
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            transition: all 0.3s ease;
        }
        .input-group:focus-within {
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        }
        .input-group-icon {
            padding: 0 15px;
            color: #3b82f6;
            font-size: 1rem;
        }
        .input-group select {
            width: 100%;
            padding: 12px 15px 12px 0;
            border: none;
            outline: none;
            font-size: 0.95rem;
            color: #1e293b;
            background: transparent;
            font-family: inherit;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%233b82f6' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><polyline points='6 9 12 15 18 9'/></svg>");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            border: none;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.3);
        }
        .btn-danger {
            background: #ef4444;
            color: white;
        }
        .btn-danger:hover {
            background: #dc2626;
        }
        .table {
            margin-top: 20px;
            border-collapse: separate;
            border-spacing: 0;
        }
        .table thead th {
            background: #f8fafc;
            border-bottom: 2px solid #e2e8f0;
            color: #475569;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
            padding: 15px;
        }
        .table tbody td {
            padding: 12px 15px;
            vertical-align: middle;
            border-bottom: 1px solid #edf2f7;
        }
        .alert-custom {
            border-radius: 16px;
            border: none;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="app-wrapper">
    <jsp:include page="AdminSidebar.jsp" />
    <div class="main-content">
        <jsp:include page="AdminHeader.jsp" />
        <div class="content-area">
            <!-- Breadcrumb -->
            <div class="page-header-section" style="margin-bottom: 24px;">
                <h1 class="page-title" style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Manage Judges</h1>
               
            </div>

            <!-- Messages -->
            <c:if test="${success == 'added'}">
                <div class="alert alert-success alert-custom alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i> Judge assigned successfully.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${success == 'removed'}">
                <div class="alert alert-success alert-custom alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i> Judge removed from hackathon.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${error == 'alreadyAssigned'}">
                <div class="alert alert-warning alert-custom alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i> Judge already assigned.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${error == 'invalidJudge'}">
                <div class="alert alert-danger alert-custom alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i> Invalid judge selection.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <!-- Assign Judge Card -->
            <div class="form-card">
                <div class="card-header-custom">
                    <h3><i class="fas fa-user-plus"></i> Assign New Judge</h3>
                    <a href="listHackathon" class="btn btn-secondary" style="padding: 8px 15px; font-size: 0.8rem;">
                        <i class="fas fa-arrow-left"></i> Back to Hackathons
                    </a>
                </div>
                <form action="saveHackathonJudge" method="post">
                    <input type="hidden" name="hackathonId" value="${hackathon.hackathonId}">
                    <div class="row g-3">
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-gavel"></i></span>
                                <select name="userId" required>
                                    <option value="">-- Select judge to assign --</option>
                                    <c:forEach items="${availableJudges}" var="j">
                                        <option value="${j.userId}">${j.firstName} ${j.lastName} - ${j.email}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div><br>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-plus-circle"></i> Assign Judge
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Assigned Judges Table -->
            <div class="table-card">
                <div class="card-header-custom">
                    <h3><i class="fas fa-users"></i> Assigned Judges</h3>
                    <span class="badge bg-primary">${assignedJudges.size()} Judges</span>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty assignedJudges}">
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-4">
                                        <i class="fas fa-user-slash me-2"></i> No judges assigned for this hackathon.
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach items="${assignedJudges}" var="a" varStatus="i">
                                <tr>
                                    <td>${i.count}</td>
                                    <td><strong>${judgeMap[a.userId].firstName} ${judgeMap[a.userId].lastName}</strong></td>
                                    <td>${judgeMap[a.userId].email}</td>
                                    <td>${judgeMap[a.userId].contactNum}</td>
                                    <td>
                                        <a class="btn btn-danger btn-sm"
                                           href="deleteHackathonJudge?hackathonJudgeId=${a.hackathonJudgeId}&hackathonId=${hackathon.hackathonId}"
                                           onclick="return confirm('Remove this judge from hackathon?')">
                                            <i class="fas fa-trash-alt"></i> Remove
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </div>
</div>

<!-- Sidebar toggle script -->
<script>
    const sidebar = document.getElementById('sidebar');
    const toggleBtn = document.getElementById('toggleSidebar');
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');

    if (toggleBtn) {
        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
            const icon = toggleBtn.querySelector('i');
            if (sidebar.classList.contains('collapsed')) {
                icon.classList.remove('fa-chevron-left');
                icon.classList.add('fa-chevron-right');
            } else {
                icon.classList.remove('fa-chevron-right');
                icon.classList.add('fa-chevron-left');
            }
        });
    }

    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', () => {
            sidebar.classList.add('mobile-open');
        });
    }

    document.addEventListener('click', (e) => {
        if (window.innerWidth <= 768) {
            if (!sidebar.contains(e.target) && !mobileMenuBtn.contains(e.target)) {
                sidebar.classList.remove('mobile-open');
            }
        }
    });

    window.addEventListener('resize', () => {
        if (window.innerWidth > 768) {
            sidebar.classList.remove('mobile-open');
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>