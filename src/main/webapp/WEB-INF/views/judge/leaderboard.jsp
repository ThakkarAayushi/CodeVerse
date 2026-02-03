<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Leaderboard | CodeVerse</title>
    <%-- Ensure the CSS path is relative to the application context --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dashboard.css">
</head>
<body>
<main class="main-content">
    <header class="header">
        <h1>Global Leaderboard</h1>
        <span class="badge badge-success">Live Results</span>
    </header>

    <div class="table-section">
        <table>
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Team Name</th>
                    <th>Average Score</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%-- Iterating through the ranked teams list provided by the Controller --%>
                <c:forEach var="entry" items="${leaderboardEntries}" varStatus="status">
                    <tr>
                        <td><strong>#${status.index + 1}</strong></td>
                        <td>${entry.teamName}</td>
                        <td>${entry.averageScore} / 30</td>
                        <td>
                            <c:choose>
                                <c:when test="${status.index == 0}">
                                    <span style="color: var(--accent);">Winner</span>
                                </c:when>
                                <c:when test="${status.index == 1}">
                                    <span style="color: var(--text-muted);">Runner Up</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: var(--text-muted);">Participant</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>

                <%-- Fallback if the leaderboard is currently empty --%>
                <c:if test="${empty leaderboardEntries}">
                    <tr>
                        <td colspan="4" style="text-align:center; color:#94a3b8;">
                            Results are being finalized. Check back soon!
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>