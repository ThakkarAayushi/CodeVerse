<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Invite Judge | CodeVerse Admin</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* ========== DASHBOARD LAYOUT STYLES ========== */
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
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
            height: 100vh;
            overflow: hidden;
        }
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
        .content-area {
            flex: 1;
            overflow-y: auto;
            padding: 30px;
        }
        .footer {
            background: white;
            padding: 20px 30px;
            border-top: 1px solid #e9eef2;
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
        }
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

        /* ========== FORM SPECIFIC STYLES ========== */
        .form-card {
            background: white;
            border-radius: 24px;
            padding: 35px;
            max-width: 800px;
            margin: 0 auto;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }
        .card-header-custom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
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
        .form-group { margin-bottom: 20px; }
        .form-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            color: #64748b;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
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
        .input-group input {
            width: 100%;
            padding: 12px 15px 12px 0;
            border: none;
            outline: none;
            font-size: 0.95rem;
            color: #1e293b;
            background: transparent;
            font-family: inherit;
        }
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            border: none;
            font-size: 0.95rem;
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
        .btn-secondary {
            background: #f1f5f9;
            color: #475569;
        }
        @media (max-width: 768px) {
            .action-buttons {
                flex-direction: column;
            }
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="app-wrapper">
    <jsp:include page="AdminSidebar.jsp" />
    <div class="main-content">
        <jsp:include page="AdminHeader.jsp" />
        <div class="content-area">
            <div class="page-header-section" style="margin-bottom: 24px;">
                <h1 class="page-title" style="font-size: 1.5rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Invite Judge</h1>
               
            </div>

            <div class="form-card">
                <div class="card-header-custom">
                    <h3><i class="fas fa-user-plus"></i> Invite New Judge</h3>
                    <a href="listJudge" class="btn btn-secondary" style="padding: 8px 15px; font-size: 0.8rem;">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>
                <form action="saveJudge" method="post">
                    <div class="form-group">
                        <label>First Name</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-user"></i></span>
                            <input type="text" name="firstName" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-user"></i></span>
                            <input type="text" name="lastName" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-envelope"></i></span>
                            <input type="email" name="email" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Contact Number</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-phone"></i></span>
                            <input type="text" name="contactNum" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Qualification</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-graduation-cap"></i></span>
                            <input type="text" name="qualification" placeholder="e.g. M.Tech, PhD" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Designation</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-briefcase"></i></span>
                            <input type="text" name="designation" placeholder="e.g. Senior Engineer, Professor" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Organization</label>
                        <div class="input-group">
                            <span class="input-group-icon"><i class="fas fa-building"></i></span>
                            <input type="text" name="organization" placeholder="Company or Institute" />
                        </div>
                    </div>
                    <div class="action-buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-paper-plane"></i> Send Invite
                        </button>
                    </div>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-3">${error}</div>
                    </c:if>
                </form>
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
</body>
</html>