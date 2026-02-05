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
                    
                    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                        
                        <div class="form-group" style="flex: 2;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Event Title</label>
                            <input type="text" name="title" placeholder="e.g., CyberSprint 2026" required 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
                    </div>

                    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Status</label>
                            <select name="status" style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                                <option value="LIVE">Live</option>
                                <option value="EXPIRED">Expired</option>
                                <option value="CLOSED">Closed</option>
                            </select>
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Event Type</label>
                            <select name="eventType" style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                                <option value="ONLINE">Online</option>
                                <option value="OFFLINE">Offline</option>
                                <option value="HYBRID">Hybrid</option>
                            </select>
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Payment</label>
                            <select name="payment" style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                                <option value="FREE">Free</option>
                                <option value="PAID">Paid</option>
                            </select>
                        </div>
                    </div>

                    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                       
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">User Type</label>
                            <input type="text" name="userType" placeholder="e.g., Students" 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Location</label>
                        <input type="text" name="location" placeholder="Remote or City, Country" 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Registration Start Date</label>
                            <input type="date" name="registrationStartDate" required 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Registration End Date</label>
                            <input type="date" name="registrationEndDate" required 
                                   style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                        </div>
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