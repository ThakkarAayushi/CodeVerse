<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories List | CodeVerse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav>
                <a href="dashboard" class="nav-item">📊 Dashboard Overview</a>
                <a href="manage-hackathons" class="nav-item">🏆 Manage Hackathons</a>
                <a href="listcategories" class="nav-item active">📁 List Categories</a>
                <a href="newcategory" class="nav-item">➕ New Category</a>
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
                <h1 style="color: #f8fafc;">Competition Categories</h1>
                <button class="btn-primary" onclick="location.href='newCategory'">+ Create New</button>
            </header>

            <div class="table-section" style="margin-top: 20px;">
                <table>
                    <thead>
                        <tr>
                          
                            <th>Category Name</th>
                        
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Iterate through categories list from Controller --%>
                        <c:forEach var="category" items="${categoryList}" varStatus="i">
                            <tr>
                               
                                <td style="color: #38bdf8;">${category.categoryName}</td>
          
                                <td>
                                    <c:choose>
                                        <c:when test="${category.active}">
                                            <span class="badge badge-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge" style="background: #30363d; color: #94a3b8;">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 10px;">
                                        <a href="edit-category?categoryId=${category.categoryId}" style="color: #38bdf8; text-decoration: none; font-size: 0.9rem;">Edit</a>
                                        <a href="delete-category?categoryId=${category.categoryId}" 
                                           style="color: #ef4444; text-decoration: none; font-size: 0.9rem;"
                                           onclick="return confirm('Are you sure?')">Delete</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <%-- Empty State --%>
                        <c:if test="${empty categoryList}">
                            <tr>
                                <td colspan="5" style="text-align: center; color: #94a3b8; padding: 40px;">
                                    No categories found. Click "Create New" to add one.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>