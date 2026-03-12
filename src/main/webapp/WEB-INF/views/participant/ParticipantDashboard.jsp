<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Participant Dashboard | CodeVerse</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

        /* Sidebar styles are in ParticipantSidebar.jsp, but we include basic layout */
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

        /* Hackathon cards */
        .hackathon-card {
            transition: transform 0.2s, box-shadow 0.2s;
            border: none;
            border-radius: 20px;
        }
        .hackathon-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .badge-status {
            position: absolute;
            top: 15px;
            right: 15px;
        }
        .card-footer {
            background: transparent;
            border-top: 1px solid #f1f1f1;
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
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Include Sidebar -->
        <jsp:include page="ParticipantSidebar.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <header class="top-header">
                <div class="header-left">
                    <button class="mobile-menu-btn" id="mobileMenuBtn">
                        <i class="fas fa-bars"></i>
                    </button>
                    <span class="page-title">Available Hackathons</span>
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
                            <div class="role">Participant</div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content Area -->
            <div class="content-area">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3>Available Hackathons</h3>
                    <span class="badge bg-primary fs-6">${hackathons.size()} Events Found</span>
                </div>

                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="hack" items="${hackathons}">
                        <div class="col">
                            <div class="card h-100 hackathon-card shadow-sm">
                                <span class="badge badge-status ${hack.status == 'LIVE' ? 'bg-success' : hack.status == 'UPCOMING' ? 'bg-warning' : 'bg-secondary'} text-white">
                                    ${hack.status}
                                </span>

                                <div class="card-body">
                                    <h5 class="card-title text-primary fw-bold mb-3 text-truncate">${hack.title}</h5>
                                    
                                    <div class="mb-2">
                                        <small class="text-muted"><i class="fas fa-map-marker-alt me-2"></i>${hack.location} (${hack.event_type})</small>
                                    </div>
                                    
                                    <div class="mb-2">
                                        <small class="text-muted"><i class="fas fa-wallet me-2"></i>Payment: <strong>${hack.payment}</strong></small>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-6 border-end">
                                            <p class="mb-0 small text-uppercase fw-bold text-muted">Team Size</p>
                                            <p class="mb-0">${hack.minTeamSize} - ${hack.maxTeamSize} Members</p>
                                        </div>
                                        <div class="col-6 ps-3">
                                            <p class="mb-0 small text-uppercase fw-bold text-muted">Deadline</p>
                                            <p class="mb-0 text-danger small">${hack.registrationEndDate}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer d-grid">
                                    <a href="<c:url value='/participant/home?hackathon_id=${hack.hackthon_id}'/>" class="btn btn-outline-primary rounded-pill">
                                        View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty hackathons}">
                        <div class="col-12 text-center py-5">
                            <i class="fas fa-calendar-times fa-3x text-muted mb-3"></i>
                            <p class="lead">No hackathons available at the moment.</p>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                &copy; 2026 CodeVerse. All rights reserved. Empowering hackathons.
            </footer>
        </div>
    </div>

    <!-- JavaScript for Sidebar Toggle (if not already in sidebar) -->
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>