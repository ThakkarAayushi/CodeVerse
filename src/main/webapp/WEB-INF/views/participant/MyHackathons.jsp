<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Hackathons | CodeVerse</title>
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

        .content-area {
            padding: 30px;
            flex: 1;
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 24px;
        }

        /* Table Card */
        .table-card {
            background: white;
            border-radius: 24px;
            padding: 24px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }

        .responsive-table {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 16px 12px;
            font-weight: 600;
            font-size: 0.85rem;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            border-bottom: 2px solid #e2e8f0;
        }

        td {
            padding: 16px 12px;
            border-bottom: 1px solid #edf2f7;
            color: #1e293b;
            font-weight: 500;
            vertical-align: middle;
        }

        .hackathon-title {
            font-weight: 600;
            color: #0f172a;
        }

        .team-name {
            font-size: 0.9rem;
            color: #3b82f6;
            font-weight: 500;
        }

        .role-badge {
            background: #f1f5f9;
            color: #475569;
            padding: 4px 12px;
            border-radius: 30px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .date-info {
            font-size: 0.85rem;
            line-height: 1.4;
        }
        .date-start {
            color: #10b981;
        }
        .date-end {
            color: #ef4444;
        }

        .status-badge {
            padding: 6px 14px;
            border-radius: 30px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }
        .status-live {
            background: #d1fae5;
            color: #065f46;
        }
        .status-upcoming {
            background: #fef9c3;
            color: #854d0e;
        }
        .status-expired {
            background: #fee2e2;
            color: #991b1b;
        }

        .action-btn {
            background: #3b82f6;
            color: white;
            border: none;
            border-radius: 30px;
            padding: 6px 16px;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .action-btn:hover {
            background: #2563eb;
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
            .content-area {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Sidebar -->
        <jsp:include page="ParticipantSidebar.jsp" />

        <!-- Main Content --->
        <div class="main-content">
            <!-- Header -->
            <jsp:include page="ParticipantHeader.jsp" />

            <!-- Content Area -->
            <div class="content-area">
                <h1 class="page-title">My Hackathons</h1>

                <div class="table-card">
                    <div class="responsive-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Hackathon</th>
                                    <th>Team / Role</th>
                                    <th>Registration Period</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="reg" items="${registeredHackathons}" varStatus="loop">
                                    <tr>
                                        <td>
                                            <span class="hackathon-title">${reg.hackathonTitle}</span>
                                        </td>
                                        <td>
                                            <div class="team-name">${reg.teamName}</div>
                                            <span class="role-badge">${reg.roleTitle}</span>
                                        </td>
                                        <td>
                                            <div class="date-info">
                                                <div class="date-start">
                                                    <i class="fas fa-calendar-check"></i> Start: <fmt:formatDate value="${reg.registrationStartDate}" pattern="dd MMM yyyy" />
                                                </div>
                                                <div class="date-end">
                                                    <i class="fas fa-calendar-times"></i> End: <fmt:formatDate value="${reg.registrationEndDate}" pattern="dd MMM yyyy" />
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${reg.status == 'LIVE'}">
                                                    <span class="status-badge status-live">Live</span>
                                                </c:when>
                                                <c:when test="${reg.status == 'UPCOMING'}">
                                                    <span class="status-badge status-upcoming">Upcoming</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge status-expired">Expired</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/participant/hackathon-details?id=${reg.hackathonId}" class="action-btn">
                                                <i class="fas fa-eye"></i> View
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <c:if test="${empty registeredHackathons}">
                                    <tr>
                                        <td colspan="5" style="text-align: center; padding: 60px; color: #94a3b8;">
                                            <i class="fas fa-calendar-times fa-2x mb-3" style="display: block; margin-bottom: 10px;"></i>
                                            You haven't registered for any hackathons yet.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                &copy; 2026 CodeVerse. All rights reserved. Empowering hackathons.
            </footer>
        </div>
    </div>
</body>
</html>