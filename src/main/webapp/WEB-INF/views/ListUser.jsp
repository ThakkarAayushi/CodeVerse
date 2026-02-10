<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Essential for the forEach loop and conditional status badges --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management | CodeVerse</title>
    <%-- Path relative to context for CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav class="nav-menu">
                <a href="dashboard" class="nav-item">📊 Dashboard</a>
                <a href="listusers" class="nav-item active">👥 User List</a>
                <a href="register" class="nav-item">👤 Add New</a>
            </nav>
        </aside>

        <main class="content">
            <header class="header">
                <h1>Platform User Directory</h1>
                <button class="btn-primary" onclick="location.href='register'">+ Register User</button>
            </header>

            <div class="table-section" style="margin-top: 20px; overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>SrNo</th>
							<th>Name</th>
							<th>Email</th>
							<th>Role</th>
							<th>Gender</th>
							<th>Birth Year</th>
							<th>Profile</th>
							<th>Status</th>
							<th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Matches the 'userList' attribute from SessionController --%>
                        <c:forEach var="user" items="${userList}" varStatus = "s">
                            <tr>
                            	<td>${s.count}</td>
                               
                                <td>
                                    <div style="display: flex; align-items: center; gap: 10px;">
                              
                                        <div>
                                            <div style="color: #f8fafc; font-weight: 600;">${user.firstName} ${user.lastName}</div>
                                           
                                        </div>
                                    </div>
                                </td>
                                
                                <td>
                                	
                                	 <div style="color: #38bdf8;">${user.email}</div>  
                                </td>
                                <td>
                                       <span class="badge" style="background: #1e293b; color: #38bdf8; text-transform: capitalize;">
                                            ${user.role}
                                        </span>  
                                   
                                </td>
                                
                                <td>
                                     <div style="font-size: 0.8rem; color: #94a3b8;">${user.gender}</div>
                                </td>
                                <td>
                                 
                                    <div style="font-size: 0.8rem; color: #94a3b8;">${user.birthYear}</div>
                                </td>
                                
                                <td class="text-center">
                                <c:if
								        test="${not empty user.profilePicURL}">
								        <img src="${user.profilePicURL}" class="profile-pic" />
							       </c:if>
							    </td>
                               
                                <td>
                                    <%-- Uses the Boolean active field for status --%>
                                    <c:choose>
                                        <c:when test="${user.active}">
                                            <span class="badge badge-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge" style="background: #ef4444; color: white;">Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 10px;">
                                        <a href="edit-user?id=${user.userId}" style="color: #38bdf8; text-decoration: none;">Edit</a>
                                        <a href="delete-user?id=${user.userId}" style="color: #ef4444; text-decoration: none;" onclick="return confirm('Remove user?')">Delete</a>
                                    	 <a href="viewUser?userId=${user.userId}" style="color: green ; text-decoration: none;">View</a>
                    
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty userList}">
                            <tr>
                                <td colspan="7" style="text-align: center; color: #94a3b8; padding: 40px;">No users currently registered.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>