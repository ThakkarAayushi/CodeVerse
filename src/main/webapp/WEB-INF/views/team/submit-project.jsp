<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Project | CodeVerse</title>
    <%-- Use context path for reliable CSS loading across different routes --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}dashboard.css">
</head>
<body>
<aside class="sidebar">
    <div class="logo">Code<span>Verse</span></div>
    <nav class="nav-menu">
        <a href="dashboard" class="nav-item">
            <span>📊 Dashboard</span>
        </a>
        <a href="team" class="nav-item">
            <span>👥 Team & Registration</span>
        </a>
        <a href="problem" class="nav-item">
            <span>📄 View Problem</span>
        </a>
        <a href="submit" class="nav-item active">
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
        <h1>Submit Your Solution</h1>
    </header>

    <div class="table-section" style="padding: 2rem; max-width: 800px;">
        <%-- Form configured to post data to a Spring Controller --%>
        <form action="save-project" method="POST" class="settings-form">
            <div class="form-group">
                <label>Project Title</label>
                <input type="text" name="title" placeholder="The name of your solution" required>
            </div>
            <div class="form-group">
                <label>GitHub Repository Link</label>
                <input type="url" name="repoUrl" placeholder="https://github.com/yourteam/project" required>
            </div>
            <div class="form-group">
                <label>Demo Video Link (Optional)</label>
                <input type="url" name="demoUrl" placeholder="YouTube/Loom link">
            </div>
            <div class="form-group">
                <label>Brief Description</label>
                <textarea name="description" rows="4" placeholder="How does your solution work?" required></textarea>
            </div>
            <button type="submit" class="btn-primary" style="width: 100%;">Submit Final Project</button>
        </form>
    </div>
</main>
</body>
</html>