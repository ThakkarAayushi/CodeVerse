<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Team Formation | CodeVerse</title>
    <%-- Ensures the CSS loads correctly regardless of URL depth in STS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
<aside class="sidebar">
    <div class="logo">Code<span>Verse</span></div>
    <nav class="nav-menu">
        <a href="dashboard" class="nav-item">
            <span>📊 Dashboard</span>
        </a>
        <a href="team" class="nav-item active">
            <span>👥 Team & Registration</span>
        </a>
        <a href="problem" class="nav-item">
            <span>📄 View Problem</span>
        </a>
        <a href="submit" class="nav-item">
            <span>🚀 Submit Project</span>
        </a>
        <a href="leaderboard" class="nav-item">
            <span>🏆 Leaderboard</span>
        </a>
    </nav>
    <div class="logout-section">
        <a href="${pageContext.request.contextPath}/logout" class="nav-item logout">
            <svg class="icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                <polyline points="16 17 21 12 16 7"></polyline>
                <line x1="21" y1="12" x2="9" y2="12"></line>
            </svg>
            <span>Logout</span>
        </a>
    </div>
</aside>

<main class="main-content">
    <header class="header">
        <h1>Team Formation</h1>
    </header>

    <div class="table-section" style="padding: 2rem; max-width: 600px;">
        <%-- Form configured to send data to the ParticipantController --%>
        <form action="create-team" method="POST" class="settings-form">
            <div class="form-group">
                <label>Team Name</label>
                <input type="text" name="teamName" placeholder="Enter your team name" required>
            </div>
            <div class="form-group">
                <label>Invite Members (Emails)</label>
                <input type="text" name="memberEmails" placeholder="email1@example.com, email2@example.com">
                <p class="subtext" style="margin-top: 5px; font-size: 0.8rem; color: #94a3b8;">
                    Maximum team size is set by Admin in System Settings.
                </p>
            </div>
            <button type="submit" class="btn-primary" style="width: 100%;">Create Team</button>
        </form>
    </div>
</main>
</body>
</html>