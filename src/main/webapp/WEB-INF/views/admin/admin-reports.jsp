<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports | CodeVerse Admin</title>
    <%-- Path relative to context for CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
    <main class="content">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav>
                <a href="dashboard" class="nav-item">📊 Dashboard Overview</a>
                <a href="manage-hackathons" class="nav-item">🏆 Manage Hackathons</a>
                <a href="approvals" class="nav-item">✅ User Approvals</a>
                <a href="reports" class="nav-item active">📋 Platform Reports</a>
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

        <header class="header">
            <h1 style="color: #f8fafc;">System Reports & Logs</h1>
            <button class="btn-report">Download Full PDF Report</button>
        </header>

        <section class="grid-stats">
            <div class="card">
                <h3>Total Submissions</h3>
                <div class="value">${totalSubmissions}</div>
                <p style="color: #94a3b8;">Across all events</p>
            </div>
            <div class="card">
                <h3>Evaluation Progress</h3>
                <div class="value" style="color: #10b981;">${evalProgress}%</div>
                <p style="color: #94a3b8;">Judges active</p>
            </div>
        </section>

        <div class="table-section">
            <div class="table-header"><h3>Recent System Activity</h3></div>
            <table>
                <thead>
                    <tr>
                        <th>Timestamp</th>
                        <th>User Role</th>
                        <th>Action Performed</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Using JSTL to iterate through activity logs --%>
                    <c:forEach var="log" items="${activityLogs}">
                        <tr>
                            <td style="color: #94a3b8;">${log.timestamp}</td>
                            <td style="color: #38bdf8;">${log.userRole}</td>
                            <td style="color: #f8fafc;">${log.action}</td>
                        </tr>
                    </c:forEach>
                    
                    <%-- Placeholder if no data is present --%>
                    <c:if test="${empty activityLogs}">
                        <tr>
                            <td colspan="3" style="text-align:center; color:#94a3b8;">No recent activity found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>