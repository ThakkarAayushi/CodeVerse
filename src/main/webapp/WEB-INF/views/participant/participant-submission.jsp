<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Project | CodeVerse</title>
    <%-- Ensures CSS loads correctly using the context path --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav>
                <%-- Update navigation to your Controller mappings --%>
                <a href="dashboard" class="nav-item">📊 My Dashboard</a>
                <a href="submit-project" class="nav-item active">🚀 Project Submission</a>
                <a href="team-management" class="nav-item">👥 Team Management</a>
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

        <main class="content">
            <header class="header">
                <h1 style="color: #f8fafc;">Submit Your Project</h1>
                <p style="color: #94a3b8;"><br>Finalize your entry for the current hackathon.</p>
            </header>

            <div class="card" style="max-width: 800px; margin-top: 20px;">
            
                <%-- Action points to a Spring PostMapping handling file uploads --%>
                
                <form action="save-submission" method="POST" enctype="multipart/form-data">
                    
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Team Name</label>
                        <input type="text" name="teamName" placeholder="Enter registered team name" required 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Repository URL (GitHub/Bitbucket)</label>
                        <input type="url" name="repoUrl" placeholder="https://github.com/username/project" required 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Project Documentation (Zip/PDF)</label>
                        <input type="file" name="projectFile" 
                               style="background: #0b0f19; color: #94a3b8; border: 1px solid #30363d; padding: 10px; width: 100%; border-radius: 6px;">
                        <p style="font-size: 12px; color: #64748b; margin-top: 5px;">Optional: Upload design docs or manual.</p>
                    </div>

                    <div style="margin-top: 30px; border-top: 1px solid #30363d; padding-top: 20px;">
                        <button type="submit" class="btn-primary" style="width: 200px;">Submit Project</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>