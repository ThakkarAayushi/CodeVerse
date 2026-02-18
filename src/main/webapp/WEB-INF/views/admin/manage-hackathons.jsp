<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Hackathons | CodeVerse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
    <style>
        .status-badge {
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }
        .status-live { background: #064e3b; color: #34d399; }
        .status-expired { background: #450a0a; color: #f87171; }
        .status-upcoming { background: #1e1b4b; color: #818cf8; }
        
        .type-badge {
            border: 1px solid #30363d;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 0.7rem;
            color: #94a3b8;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav class="nav-menu">
                <a href="dashboard" class="nav-item">📊 Dashboard</a>
                <a href="manage-hackathons" class="nav-item active">🏆 Hackathons</a>
                <a href="listusers" class="nav-item">👥 Users</a>
            </nav>
        </aside>

        <main class="content">
            <header class="header">
                <div>
                    <h1 style="color: #f8fafc;">Hackathon Events</h1>
                    <p style="color: #94a3b8;">Manage existing competitions and their schedules.</p>
                </div>
                <button class="btn-primary" onclick="location.href='create-hackathon'">+ Launch New</button>
            </header>

            <div class="table-section" style="margin-top: 25px; overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Event Details</th>
                            <th>Participation</th>
                            <th>Registration Period</th>
                            <th>Location & Access</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="h" items="${allHackathons}" >
                            <tr>
                                <td><span style="color: #94a3b8;">#${h.hackthon_id}</span></td>
                                <td>
                                    <div style="color: #f8fafc; font-weight: 600; font-size: 1rem;">${h.title}</div>
                                    <div style="margin-top: 4px;">
                                        <span class="type-badge">${h.event_type}</span>
                                        <span class="type-badge" style="margin-left: 5px;">${h.payment}</span>
                                    </div>
                                </td>
                                <td>
                                    <div style="color: #f8fafc;">${h.userType}s</div>
                                    <div style="font-size: 0.8rem; color: #94a3b8;">Team: ${h.minTeamSize} - ${h.maxTeamSize}</div>
                                </td>
                                <td>
                                    <div style="font-size: 0.85rem; color: #38bdf8;">Starts: ${h.registrationStartDate}</div>
                                    <div style="font-size: 0.85rem; color: #f87171;">Ends: ${h.registrationEndDate}</div>
                                </td>
                                <td>
                                    <div style="color: #f8fafc;">${h.location}</div>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${h.status == 'LIVE'}">
                                            <span class="status-badge status-live">Live</span>
                                        </c:when>
                                        <c:when test="${h.status == 'EXPIRED'}">
                                            <span class="status-badge status-expired">Expired</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-upcoming">${h.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 12px;">
                                        <a href="edit-hackathon?hackthon_id=${h.hackthon_id}" style="color: #38bdf8; text-decoration: none; font-size: 0.85rem;">Edit</a>
                                        <a href="deleteHackathon?hackthon_id=${h.hackthon_id}"
                                           style="color: #ef4444; text-decoration: none; font-size: 0.85rem;"
                                           onclick="return confirm(''Are you sure you want to delete this hackathon?')">Delete</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty allHackathons}">
                            <tr>
                                <td colspan="7" style="text-align: center; color: #94a3b8; padding: 60px;">
                                    No hackathons found. Create your first event to get started!
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>