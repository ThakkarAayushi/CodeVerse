<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Judge Allocation | CodeVerse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
  <aside class="sidebar">
    <div class="logo">Code<span>Verse</span></div>
    
    <nav class="nav-menu">
        <a href="dashboard" class="nav-item">
            <span>📊 Event Overview</span>
        </a>
        <a href="create-hackathon" class="nav-item">
            <span>➕ Create Hackathon</span>
        </a>
        <a href="problem-statements" class="nav-item">
            <span>📝 Problem Statements</span>
        </a>
        <a href="assign-judge" class="nav-item active">
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

<main class="main-content">
    <h1>Judge Allocation</h1>
    <div class="table-section" style="margin-top: 2rem;">
        <table>
            <thead>
                <tr>
                    <th>Problem Statement</th>
                    <th>Assigned Judge</th>
                    <th>Total Teams</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Iterating through problem statements provided by the Controller --%>
                <c:forEach var="problem" items="${problems}">
                    <tr>
                        <td>${problem.title}</td>
                        <td>
                            <form action="update-allocation" method="POST" id="allocForm-${problem.id}">
                                <input type="hidden" name="problemId" value="${problem.id}">
                                <select name="judgeId" style="background: #0b0f19; color: white; padding: 5px; border-radius: 4px; border: 1px solid #30363d;">
                                    <option value="">Select Judge...</option>
                                    <c:forEach var="judge" items="${judges}">
                                        <option value="${judge.id}" ${problem.judgeId == judge.id ? 'selected' : ''}>
                                            ${judge.fullName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </form>
                        </td>
                        <td>${problem.teamCount} Teams</td>
                        <td>
                            <button type="submit" form="allocForm-${problem.id}" class="btn-primary" style="padding: 5px 10px;">Update</button>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty problems}">
                    <tr>
                        <td colspan="4" style="text-align:center; color: #94a3b8;">No problem statements available for allocation.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>