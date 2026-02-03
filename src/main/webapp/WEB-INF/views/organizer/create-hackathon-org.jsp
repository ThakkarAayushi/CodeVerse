<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Hackathon | CodeVerse</title>
    <%-- Path relative to context for CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dashboard.css">
</head>
<body>
<main class="main-content">
    <header>
        <h1>Create New Hackathon</h1>
    </header>
    
    <aside class="sidebar">
        <div class="logo">Code<span>Verse</span></div>
        
        <nav class="nav-menu">
            <a href="dashboard" class="nav-item">
                <span>📊 Event Overview</span>
            </a>
            <a href="create-hackathon" class="nav-item active">
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

    <section class="table-section" style="padding: 2.5rem; max-width: 800px;">
        <%-- Added action, method, and enctype for file upload --%>
        <form action="save-hackathon" method="POST" enctype="multipart/form-data" class="settings-form">
            <div class="form-group">
                <label>Hackathon Title</label>
                <input type="text" name="title" placeholder="e.g. AI Innovation Sprint 2026" required>
            </div>
            <div class="form-group" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                <div>
                    <label>Start Date</label>
                    <input type="date" name="startDate" required>
                </div>
                <div>
                    <label>End Date</label>
                    <input type="date" name="endDate" required>
                </div>
            </div>
            <div class="form-group">
                <label>Problem Statement Upload (.pdf / .md)</label>
                <input type="file" name="problemStatementFile" style="padding: 10px; border: 1px dashed var(--border);">
            </div>
            <div class="form-group">
                <label>Event Rules & Guidelines</label>
                <textarea name="rules" rows="5" placeholder="Enter rules for participants..." required></textarea>
            </div>
            <button type="submit" class="btn-primary" style="width: 100%;">Launch Hackathon</button>
        </form>
    </section>
</main>
</body>
</html>