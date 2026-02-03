<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Organizer Dashboard | CodeVerse</title>
    <%-- Use context path to ensure CSS loads correctly across different URL depths --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
<main class="main-content">
    <header class="header">
        <h1>Event Control Center</h1>
        <%-- Updated link to point to the Controller mapping --%>
        <button class="btn-primary" onclick="location.href='create-hackathon'">+ New Hackathon</button>
    </header>
    
    <aside class="sidebar">
        <div class="logo">Code<span>Verse</span></div>
        
        <nav class="nav-menu">
            <a href="dashboard" class="nav-item active">
                <span>📊 Event Overview</span>
            </a>
            <a href="save-hackathon-org" class="nav-item">
                <span>➕ Create Hackathon</span>
            </a>
            <a href="problem-statements" class="nav-item">
                <span>📝 Problem Statements</span>
            </a>
            <a href="assign-judges" class="nav-item">
                <span>⚖️ Assign Judges</span>
            </a>
            <a href="submissions" class="nav-item">
                <span>📥 View Submissions</span>
            </a>
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

    <section class="grid-stats">
        <div class="card">
            <h3>Registered Participants</h3>
            <%-- Data provided by the OrganizerController --%>
            <div class="value">${participantCount}</div>
            <p class="subtext">Step 3: Registration phase</p>
        </div>
        <div class="card">
            <h3>Team Submissions</h3>
            <div class="value highlight">${submissionCount}</div>
            <p class="subtext">Step 5: Solutions submitted</p>
        </div>
        <div class="card">
            <h3>Evaluation Progress</h3>
            <div class="value">${evalProgress}%</div>
            <p class="subtext">Step 6: Judge scoring</p>
        </div>
    </section>

    <div class="table-section">
        <div class="table-header"><h2>Active Hackathons</h2></div>
        <table>
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Timeline</th>
                    <th>Submissions</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%-- Dynamic list of hackathons managed by this organizer --%>
                <c:forEach var="event" items="${activeHackathons}">
                    <tr>
                        <td><strong>${event.name}</strong></td>
                        <td>${event.timeline}</td>
                        <td>${event.teamCount} Teams</td>
                        <td>
                            <c:choose>
                                <c:when test="${event.status == 'Live'}">
                                    <span class="badge badge-success">Live</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge">${event.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty activeHackathons}">
                    <tr>
                        <td colspan="4" style="text-align:center; color:#94a3b8;">No active hackathons found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>