<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Judge Assignments | CodeVerse</title>
    <%-- Path relative to context for CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
<main class="main-content">
    <header>
        <h1>Judge Assignments</h1>
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
            <a href="problem-statements" class="nav-item">
                <span>📝 Problem Statements</span>
            </a>
            <a href="assign-judges" class="nav-item active">
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

    <div class="table-section">
        <div class="table-header"><h2>Current Assignments</h2></div>
        <table>
            <thead>
                <tr>
                    <th>Problem Statement</th>
                    <th>Assigned Judge</th>
                    <th>Submissions</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%-- JSTL Loop to iterate through problems that need judges --%>
                <c:forEach var="problem" items="${problemList}">
                    <tr>
                        <td><strong>${problem.title}</strong></td>
                        <td>
                            <form action="update-assignment" method="POST" id="form-${problem.id}">
                                <input type="hidden" name="problemId" value="${problem.id}">
                                <select name="judgeId" style="background: #0b0f19; color: white; border: 1px solid #30363d; padding: 5px;">
                                    <option value="">Select Judge...</option>
                                    <c:forEach var="judge" items="${availableJudges}">
                                        <option value="${judge.id}" ${problem.assignedJudgeId == judge.id ? 'selected' : ''}>
                                            ${judge.fullName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </form>
                        </td>
                        <td>${problem.submissionCount} Teams</td>
                        <td>
                            <c:choose>
                                <c:when test="${problem.assignedJudgeId != null}">
                                    <span class="badge badge-warning">Awaiting Evaluation</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge" style="color: #94a3b8;">Unassigned</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button type="submit" form="form-${problem.id}" class="btn-primary" style="padding: 5px 10px;">Save</button>
                        </td>
                    </tr>
                </c:forEach>
                
                <%-- Placeholder if no problems are found --%>
                <c:if test="${empty problemList}">
                    <tr>
                        <td colspan="5" style="text-align:center; color:#94a3b8;">No active problem statements found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>