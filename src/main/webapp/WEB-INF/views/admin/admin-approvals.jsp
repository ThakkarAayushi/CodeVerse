<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Approvals | CodeVerse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
<main class="content">
    <aside class="sidebar">
        <div class="logo">Code<span>Verse</span></div>
        <nav>
            <a href="dashboard" class="nav-item">📊 Dashboard Overview</a>
            <a href="manage-hackathons" class="nav-item">🏆 Manage Hackathons</a>
            <a href="approvals" class="nav-item active">✅ User Approvals</a>
            <a href="reports" class="nav-item">📋 Platform Reports</a>
            <a href="settings" class="nav-item">⚙️ System Settings</a>
        </nav>
        
        <div class="logout-section">
            <a href="${pageContext.request.contextPath}/logout" class="nav-item logout">
                <svg class="icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                    <polyline points="16 17 21 12 16 7"></polyline>
                    <line x1="21" y1="12" x2="9" y2="12"></line>
                </svg>
                <span>Logout</span>
            </a>
        </div>
    </aside>

    <section class="table-section">
        <div class="table-header">
            <h2 style="color: #f8fafc;">Organizer & Judge Approvals</h2><br>
            <p style="color: #94a3b8;">Review credentials before granting platform access.</p>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Applicant Name</th>
                    <th>Role Requested</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- We use JSTL to iterate through a list of pending users --%>
                <c:forEach var="user" items="${pendingUsers}">
                    <tr>
                        <td style="color: #f8fafc;">${user.fullName}</td>
                        <td style="color: #38bdf8;">${user.role}</td>
                        <td><span class="badge warning">Pending Approval</span></td>
                        <td>
                            <form action="process-approval" method="POST" style="display:inline;">
                                <input type="hidden" name="userId" value="${user.id}">
                                <input type="hidden" name="status" value="approve">
                                <button type="submit" class="btn-table approve">Approve</button>
                            </form>
                            <form action="process-approval" method="POST" style="display:inline;">
                                <input type="hidden" name="userId" value="${user.id}">
                                <input type="hidden" name="status" value="reject">
                                <button type="submit" class="btn-table reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                
                <%-- Fallback if no users are pending --%>
                <c:if test="${empty pendingUsers}">
                    <tr>
                        <td colspan="4" style="text-align:center; color:#94a3b8;">No pending requests.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </section>
</main>
</body>
</html>