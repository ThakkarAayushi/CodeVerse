<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Create Hackathon | CodeVerse Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* (Keep all existing CSS exactly as before) */
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

        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
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
            padding: 30px;
            flex: 1;
        }

        .form-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 25px;
        }

        .card-header h3 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0f172a;
        }

        .card-header i {
            color: #3b82f6;
            font-size: 1.4rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #64748b;
            margin-bottom: 6px;
        }

        .input-group {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            transition: 0.2s;
        }
        .input-group:focus-within {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }

        .input-group-icon {
            padding: 0 15px;
            color: #3b82f6;
            font-size: 1.1rem;
        }

        .input-group input,
        .input-group select,
        .input-group textarea {
            width: 100%;
            padding: 14px 15px 14px 0;
            border: none;
            outline: none;
            font-size: 1rem;
            color: #1e293b;
            background: transparent;
            font-family: 'Inter', sans-serif;
        }

        .input-group textarea {
            min-height: 100px;
            resize: vertical;
            padding-top: 14px;
        }

        .input-group select {
            padding-right: 35px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%233b82f6' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><polyline points='6 9 12 15 18 9'/></svg>") no-repeat right 15px center;
            background-size: 16px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: 0.2s;
            font-size: 1rem;
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
            transform: translateY(-2px);
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
            .mobile-menu-btn {
                display: block;
            }
            .top-header {
                padding: 16px 20px;
            }
            .content-area {
                padding: 20px;
            }
            .form-grid {
                grid-template-columns: 1fr;
            }
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
            .btn {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Sidebar (unchanged) -->
        <jsp:include page="AdminSidebar.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <!-- Shared Header (includes notification, logout, user profile) -->
            <jsp:include page="AdminHeader.jsp" />

            <!-- Content Area -->
            <div class="content-area">
                <!-- Page title moved here -->
                <h1 class="page-title" style="margin-bottom: 24px;">Create Hackathon</h1>

                <div class="form-card">
                    <div class="card-header">
                        <i class="fas fa-rocket"></i>
                        <h3>Event Details</h3>
                    </div>

                    <form action="save-hackathon" method="POST" enctype="multipart/form-data">
                        <div class="form-grid">
                            <!-- Left Column -->
                            <div class="form-col">
                                <!-- Event Title -->
                                <div class="form-group">
                                    <label>Event Title</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-trophy"></i></span>
                                        <input type="text" name="title" placeholder="e.g. CyberSprint 2026" required>
                                    </div>
                                </div>

                                <!-- Status -->
                                <div class="form-group">
                                    <label>Status</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-toggle-on"></i></span>
                                        <select name="status" required>
                                            <option value="LIVE">Live</option>
                                            <option value="UPCOMING">Upcoming</option>
                                            <option value="EXPIRED">Expired</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Event Type -->
                                <div class="form-group">
                                    <label>Event Type</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-globe"></i></span>
                                        <select name="event_type" required>
                                            <option value="ONLINE">Online</option>
                                            <option value="OFFLINE">Offline</option>
                                            <option value="HYBRID">Hybrid</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Payment -->
                                <div class="form-group">
                                    <label>Entry Fee</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-credit-card"></i></span>
                                        <select name="payment" required>
                                            <option value="FREE">Free (No Entry Fee)</option>
                                            <option value="PAID">Paid (Entry Fee Applies)</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Location -->
                                <div class="form-group">
                                    <label>Location</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-map-marker-alt"></i></span>
                                        <input type="text" name="location" placeholder="Remote or Venue Address" required>
                                    </div>
                                </div>

                                <!-- Description -->
                                <div class="form-group">
                                    <label>Description</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-align-left"></i></span>
                                        <textarea name="description" placeholder="Detailed description of the hackathon..." required></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Column -->
                            <div class="form-col">
                                <!-- Min Team Size -->
                                <div class="form-group">
                                    <label>Min Team Size</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-users"></i></span>
                                        <input type="number" name="minTeamSize" placeholder="Min team members" min="1" required>
                                    </div>
                                </div>

                                <!-- Max Team Size -->
                                <div class="form-group">
                                    <label>Max Team Size</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-user-plus"></i></span>
                                        <input type="number" name="maxTeamSize" placeholder="Max team members" min="1" required>
                                    </div>
                                </div>

                                <!-- Allowed User Type -->
                                <div class="form-group">
                                    <label>Allowed User Type</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-user-tag"></i></span>
                                        <select name="userType" required>
                                            <option value="">-- Select --</option>
                                            <c:forEach items="${allUserType}" var="ut">
                                                <option value="${ut.userType}">${ut.userType}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Registration Start Date -->
                                <div class="form-group">
                                    <label>Registration Start</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-calendar-check"></i></span>
                                        <input type="date" name="registrationStartDate" required>
                                    </div>
                                </div>

                                <!-- Registration End Date -->
                                <div class="form-group">
                                    <label>Registration End</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-calendar-times"></i></span>
                                        <input type="date" name="registrationEndDate" required>
                                    </div>
                                </div>

                                <!-- Hackathon Poster -->
                                <div class="form-group">
                                    <label>Hackathon Poster</label>
                                    <div class="input-group">
                                        <span class="input-group-icon"><i class="fas fa-image"></i></span>
                                        <input type="file" name="hackathonPoster">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-rocket"></i> Launch Hackathon</button>
                            <button type="button" onclick="location.href='manage-hackathons'" class="btn btn-secondary"><i class="fas fa-times"></i> Cancel</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                &copy; 2025 CodeVerse. All rights reserved. Empowering hackathons.
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