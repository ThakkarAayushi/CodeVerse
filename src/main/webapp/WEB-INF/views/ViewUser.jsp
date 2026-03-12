<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>User Profile | CodeVerse Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
            color: #1e293b;
        }

        /* Layout */
        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar styles are assumed to be in AdminSidebar.jsp */
        /* We'll include the toggle button functionality later */

        /* Main Content */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
        }

        /* Header */
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

        /* Content Area */
        .content-area {
            padding: 30px;
            flex: 1;
        }

        /* Profile Card */
        .profile-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }

        .profile-left {
            text-align: center;
            padding-right: 30px;
            border-right: 1px solid #e2e8f0;
        }

        .profile-main-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #3b82f6;
            box-shadow: 0 8px 20px rgba(59,130,246,0.2);
            margin-bottom: 20px;
        }

        .profile-name {
            font-size: 1.5rem;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 5px;
        }

        .profile-role {
            color: #3b82f6;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .status-indicator {
            font-size: 0.9rem;
            font-weight: 600;
        }
        .status-active {
            color: #10b981;
        }
        .status-inactive {
            color: #ef4444;
        }

        .profile-right {
            padding-left: 30px;
        }

        .section-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #0f172a;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .info-label {
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            color: #64748b;
            margin-bottom: 4px;
        }

        .info-value {
            font-size: 1rem;
            color: #1e293b;
            font-weight: 500;
        }
        .info-value.email {
            color: #3b82f6;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: 0.2s;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            box-shadow: 0 4px 10px rgba(59,130,246,0.3);
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59,130,246,0.4);
        }

        .btn-secondary {
            background: #f1f5f9;
            color: #1e293b;
        }
        .btn-secondary:hover {
            background: #e2e8f0;
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
            .mobile-menu-btn {
                display: block;
            }
            .top-header {
                padding: 16px 20px;
            }
            .content-area {
                padding: 20px;
            }
            .profile-left {
                border-right: none;
                padding-right: 0;
                margin-bottom: 30px;
            }
            .profile-right {
                padding-left: 0;
            }
            .info-grid {
                grid-template-columns: 1fr;
            }
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <jsp:include page="AdminSidebar.jsp"></jsp:include>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <header class="top-header">
                <div class="header-left">
                    <button class="mobile-menu-btn" id="mobileMenuBtn">
                        <i class="fas fa-bars"></i>
                    </button>
                    <span class="page-title">User Profile</span>
                </div>
                <div class="header-right">
                    <div class="notification-icon">
                        <i class="far fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </div>
                    <div class="user-profile">
                        <div class="user-avatar">
                            <c:out value="${sessionScope.user.firstName.charAt(0)}" />
                        </div>
                        <div class="user-info">
                            <div class="name"><c:out value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" /></div>
                            <div class="role">Administrator</div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content Area -->
            <div class="content-area">
                <div class="profile-card">
                    <div class="row">
                        <!-- Left Column: Avatar & Basic Info -->
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 profile-left">
                            <img src="${not empty user.profilePicURL ? user.profilePicURL : 'img/contact/1.jpg'}" 
                                 class="profile-main-img" alt="User Profile">
                            <div class="profile-name">${user.firstName} ${user.lastName}</div>
                            <div class="profile-role">${user.role}</div>
                            
                            <c:choose>
                                <c:when test="${user.active}">
                                    <div class="status-indicator status-active"><i class="fas fa-circle"></i> Active Account</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="status-indicator status-inactive"><i class="fas fa-circle"></i> Inactive Account</div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Right Column: Detailed Info -->
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 profile-right">
                            <div class="section-title">General Information</div>
                            
                            <div class="info-grid">
                                <div>
                                    <div class="info-label">User ID</div>
                                    <div class="info-value">#${user.userId}</div>
                                </div>
                                <div>
                                    <div class="info-label">Email Address</div>
                                    <div class="info-value email">${user.email}</div>
                                </div>
                                <div>
                                    <div class="info-label">Contact Number</div>
                                    <div class="info-value">${user.contactNum}</div>
                                </div>
                                <div>
                                    <div class="info-label">Member Since</div>
                                    <div class="info-value">${user.createAtDate}</div>
                                </div>
                                <div>
                                    <div class="info-label">Gender / YOB</div>
                                    <div class="info-value">${user.gender} (${user.birthYear})</div>
                                </div>
                                <div>
                                    <div class="info-label">Qualification</div>
                                    <div class="info-value">${userDetail.qualification}</div>
                                </div>
                                <div>
                                    <div class="info-label">Location</div>
                                    <div class="info-value">${userDetail.city}, ${userDetail.state}</div>
                                </div>
                                <div>
                                    <div class="info-label">Country</div>
                                    <div class="info-value">${userDetail.country}</div>
                                </div>
                            </div>

                            <div class="action-buttons">
                                <button class="btn btn-secondary" onclick="location.href='listUser'">
                                    <i class="fas fa-arrow-left"></i> Back to Directory
                                </button>
                                <button class="btn btn-primary" onclick="location.href='edit-user?userId=${user.userId}'">
                                    <i class="fas fa-pencil-alt"></i> Edit User Data
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                &copy; 2026 CodeVerse. All rights reserved. Empowering hackathons.
            </footer>
        </div>
    </div>

    <!-- JavaScript for Sidebar Toggle & Mobile Menu -->
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

        mobileMenuBtn.addEventListener('click', () => {
            sidebar.classList.add('mobile-open');
        });

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