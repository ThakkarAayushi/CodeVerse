<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Hackathon | CodeVerse</title>
    <%-- Ensures CSS loads correctly regardless of URL depth --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav>
                <a href="dashboard" class="nav-item">
                    <i class="icon">📊</i> Dashboard Overview
                </a>
                <a href="manage-hackathons" class="nav-item active">
                    <i class="icon">🏆</i> Manage Hackathons
                </a>
                <a href="approvals" class="nav-item">
                    <i class="icon">✅</i> User Approvals
                </a>
                <a href="reports" class="nav-item">
                    <i class="icon">📋</i> Platform Reports
                </a>
                <a href="settings" class="nav-item">
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
        </aside>

        <main class="content">
            <header class="header">
                <h1 style="color: #f8fafc;">Setup New Hackathon</h1>
                <p style="color: #94a3b8;">Define the event details and problem statement.</p>
            </header>

            <div class="card" style="margin-top: 20px;">
                <%-- Action points to a Spring PostMapping --%>
                <form action="save-hackathon" method="POST">
                    
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Event Title</label>
                        <input type="text" name="title" placeholder="e.g., CyberSprint 2026" required 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Full Description & Rules</label>
                        <textarea name="description" rows="4" placeholder="Themes, eligibility, and rules..." required 
                                  style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px; resize: vertical;"></textarea>
                    </div>

                    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Start Date</label>
                            <input type="datetime-local" name="startDate" required 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">End Date</label>
                            <input type="datetime-local" name="endDate" required 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
                    </div>

                    <hr style="border: 0; border-top: 1px solid #30363d; margin: 30px 0;">

                    <h3 style="color: #f8fafc; margin-bottom: 15px;">Problem Statement</h3>
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Problem Title </label>
                        <input type="text" name="problemTitle" placeholder="e.g., Secure Banking API" required 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Detailed Problem Requirements </label>
                        <textarea name="problemDescription" rows="4" placeholder="Constraints, expected output, etc." required 
                                  style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px; resize: vertical;"></textarea>
                    </div>

                    <div style="margin-top: 30px;">
                        <button type="submit" class="btn-primary" style="width: 220px;">🚀 Launch Hackathon</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>