<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Category | CodeVerse</title>
    <%-- Standard CSS pathing for STS project structure --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav>
                <a href="dashboard" class="nav-item">📊 Dashboard Overview</a>
                <a href="manage-hackathons" class="nav-item">🏆 Manage Hackathons</a>
                <a href="newcategory" class="nav-item active">📁 New Category</a>
                <a href="settings" class="nav-item">⚙️ Settings</a>
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

        <main class="content">
            <header class="header">
                <h1 style="color: #f8fafc;">Create Competition Category</h1>
                <p style="color: #94a3b8;">Define a new track for upcoming hackathons.</p>
            </header>

            <div class="card" style="max-width: 600px; margin-top: 20px;">
                <form action="saveCategory" method="POST">
                    <div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Category Name</label>
                        <input type="text" name="categoryName" placeholder="e.g., Artificial Intelligence" required 
                               style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                    </div>

                    <!--div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Description</label>
                        <textarea name="description" rows="4" placeholder="Briefly describe what this category entails..." required 
                                  style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px; resize: vertical;"></textarea>
                    </div-->

                    <!-- div class="form-group" style="margin-bottom: 20px;">
                        <label style="color: #94a3b8; display: block; margin-bottom: 8px;">Status</label>
                        <select name="status" style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 12px; width: 100%; border-radius: 6px;">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div-->

                    <div style="margin-top: 30px;">
                        <button type="submit" class="btn-primary" style="width: 100%;">🚀 Save Category</button><br><br>
                        
                          <button type="submit" class="btn-primary" style="width: 100%; color:white; background-color:black;">Cancel</button>
                        
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>