<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Problem Statements | CodeVerse</title>
    <%-- Context-aware pathing for the CSS file --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dashboard.css">
</head>
<body>
<main class="main-content">
    <header class="header">
        <h1>Problem Statements</h1>
    </header>
    
    <aside class="sidebar">
        <div class="logo">Code<span>Verse</span></div>
        
        <nav class="nav-menu">
            <a href="dashboard" class="nav-item">
                <span>📊 Event Overview</span>
            </a>
            <a href="create-hackathon" class="nav-item">
                <span>➕ Create Hackathon</span>
            </a>
            <a href="problem-statements" class="nav-item active">
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

    <div class="table-section" style="padding: 2.5rem; max-width: 800px;">
        <%-- Form configured for file uploads to the Spring Controller --%>
        <form action="upload-statement" method="POST" enctype="multipart/form-data" class="settings-form">
            <div class="form-group">
                <label>Problem Title</label>
                <input type="text" name="title" placeholder="e.g., Decentralized Finance Security" required>
            </div>
            <div class="form-group">
                <label>Detailed Description (Upload File)</label>
                <input type="file" name="descriptionFile" style="padding: 10px; border: 1px dashed var(--border);" required>
            </div>
            <div class="form-group">
                <label>Difficulty Level</label>
                <select name="difficulty">
                    <option value="Beginner">Beginner</option>
                    <option value="Intermediate">Intermediate</option>
                    <option value="Advanced">Advanced</option>
                </select>
            </div>
            <button type="submit" class="btn-primary">Upload Statement</button>
        </form>
    </div>
</main>
</body>
</html>