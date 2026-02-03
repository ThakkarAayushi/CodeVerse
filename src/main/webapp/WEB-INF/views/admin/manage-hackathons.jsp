<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Hackathons | CodeVerse</title>
    <%-- Use relative path or context path for your CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
    <div class="sidebar">
        <div class="logo">Code<span>Verse</span></div>
        <nav class="nav-menu">
             <a href="dashboard" class="nav-item active">
                    <i class="icon">📊</i> Dashboard Overview
                </a>
                
                <a href="manage-hackathons" class="nav-item">
                    <i class="icon">🏆</i> Manage Hackathons
                </a>
                
                <a href="approvals" class="nav-item">
                    <i class="icon">✅</i> User Approvals
                </a>
                
                <a href="reports" class="nav-item">
                    <i class="icon">📋</i> Platform Reports
                </a>
                
                <a href="admin-settings" class="nav-item">
                    <i class="icon">⚙️</i> System Settings
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
    </div>

    <main class="main-content">
        <header>
            <h1>Manage Hackathons</h1><br>
            <%-- In STS/Spring, use controller mapping instead of absolute file paths --%>
           <a href="create-hackathon"><button class="btn-primary">+ Create Hackathon</button></a> 
        </header>

        <div class="table-section">
            <div class="table-header"><h2>Existing Hackathons</h2></div>
            <table>
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Timeline</th>
                        <th>Themes/Rules</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- This will eventually use <c:forEach> to loop through hackathons --%>
                    <tr>
                        <td>CyberSprint 2026</td>
                        <td>Jan 25 - Jan 30</td>
                        <td>Innovation, Coding</td>
                        <td><span style="color: var(--success)">Active</span></td>
                        <td><button class="btn-primary" style="padding: 5px 10px;">Manage</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>