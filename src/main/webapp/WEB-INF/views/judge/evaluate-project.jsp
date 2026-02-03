<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evaluate Project | CodeVerse</title>
    <%-- Use contextPath to ensure CSS loads correctly regardless of URL mapping --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dashboard.css">
</head>
<body>
<aside class="sidebar">
    <div class="logo">Code<span>Verse</span></div>
    <nav class="nav-menu">
        <a href="dashboard" class="nav-item">
            <span>🏠 Evaluation Home</span>
        </a>
        <a href="assigned-projects" class="nav-item">
            <span>📊 Assigned Projects</span>
        </a>
        <a href="scoring-criteria" class="nav-item">
            <span>📜 Scoring Rules</span>
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
        <h1>Evaluate: ${teamName} Solution</h1>
    </header>

    <div class="grid-stats">
        <div class="card">
            <h3>Project Links</h3>
            <%-- Use EL to display dynamic links for the team's project --%>
            <a href="${repoUrl}" target="_blank" class="text-accent" style="display:block; margin-top:10px;">GitHub Repository</a>
            <a href="${demoUrl}" target="_blank" class="text-accent" style="display:block; margin-top:5px;">Demo Video</a>
        </div>
    </div>

    <div class="table-section" style="padding: 2rem;">
        <%-- Form configured to post scores to your JudgeController --%>
        <form action="submit-evaluation" method="POST" class="settings-form">
            <%-- Hidden field to associate the evaluation with the correct team/submission --%>
            <input type="hidden" name="submissionId" value="${submissionId}">

            <div class="form-group">
                <label>Technical Implementation (1-10)</label>
                <input type="number" name="techScore" min="1" max="10" placeholder="Enter score" required>
            </div>
            <div class="form-group">
                <label>Innovation & Creativity (1-10)</label>
                <input type="number" name="innovationScore" min="1" max="10" placeholder="Enter score" required>
            </div>
            <div class="form-group">
                <label>Presentation/UI (1-10)</label>
                <input type="number" name="uiScore" min="1" max="10" placeholder="Enter score" required>
            </div>
            <div class="form-group">
                <label>Overall Feedback</label>
                <textarea name="feedback" rows="4" placeholder="Provide constructive criticism for the team..." required></textarea>
            </div>
            <button type="submit" class="btn-primary" style="width: 100%;">Submit Scores</button>
        </form>
    </div>
</main>
</body>
</html>