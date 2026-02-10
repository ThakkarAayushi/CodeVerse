<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile | CodeVerse</title>
    <%-- Standard CSS pathing for your CodeVerse project --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dashboard.css">
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="logo">Code<span>Verse</span></div>
            <nav class="nav-menu">
                <a href="dashboard" class="nav-item">📊 Dashboard</a>
                <a href="listUser" class="nav-item">👥 User List</a>
                <a href="register" class="nav-item">👤 Add New</a>
            </nav>
            <div class="logout-section">
                <a href="${pageContext.request.contextPath}/logout" class="nav-item logout">
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <main class="content">
            <header class="header">
                <h1 style="color: #f8fafc;">User Profile Details</h1>
                <div style="display: flex; gap: 10px;">
                    <button class="btn-primary" onclick="location.href='editUser?userId=${user.userId}'">✏️ Edit Profile</button>
                    <button style="background: #161b22; color: #f8fafc; border: 1px solid #30363d; padding: 10px 20px; border-radius: 6px; cursor: pointer;" 
                            onclick="location.href='listUser'">⬅️ Back to List</button>
                </div>
            </header>

            <div class="card" style="max-width: 1000px; margin-top: 20px; background: #0d1117; border: 1px solid #30363d; padding: 30px;">
                <div style="display: flex; gap: 40px; align-items: flex-start;">
                    
                    <%-- Left Sidebar: Profile Identity --%>
                    <div style="flex: 1; text-align: center; border-right: 1px solid #30363d; padding-right: 40px;">
                        <img src="${not empty user.profilePicURL ? user.profilePicURL : 'https://via.placeholder.com/150'}" 
                             style="width: 160px; height: 160px; border-radius: 50%; border: 3px solid #38bdf8; object-fit: cover; margin-bottom: 20px;">
                        
                        <h2 style="color: #f8fafc; margin-bottom: 5px;">${user.firstName} ${user.lastName}</h2>
                        <div style="margin-bottom: 15px;">
                            <span class="badge" style="background: #1e293b; color: #38bdf8; text-transform: capitalize; padding: 6px 12px; border-radius: 20px;">
                                ${user.role}
                            </span>
                        </div>
                        
                        <c:choose>
                            <c:when test="${user.active}">
                                <div style="color: #22c55e; font-size: 0.9rem; font-weight: 600;">● Account Active</div>
                            </c:when>
                            <c:otherwise>
                                <div style="color: #ef4444; font-size: 0.9rem; font-weight: 600;">● Account Inactive</div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <%-- Right Content: Detailed Data Grid --%>
                    <div style="flex: 2;">
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
                            
                            <%-- Personal Info Group --%>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">User ID</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">#${user.userId}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Email Address</label>
                                <div style="color: #38bdf8; font-size: 1.1rem; padding-top: 4px;">${user.email}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Contact Number</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${user.contactNum}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Gender / Year</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${user.gender} (${user.birthYear})</div>
                            </div>

                            <%-- Location Info Group (From UserDetail) --%>
                            <div style="grid-column: span 2; margin-top: 15px; border-top: 1px solid #30363d; padding-top: 20px;">
                                <h3 style="color: #f8fafc; font-size: 1.2rem; margin-bottom: 15px;">Location & Education</h3>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">City / State</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${userDetail.city}, ${userDetail.state}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Country</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${userDetail.country}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Qualification</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${userDetail.qualification}</div>
                            </div>
                            <div>
                                <label style="color: #94a3b8; font-size: 0.8rem; text-transform: uppercase;">Member Since</label>
                                <div style="color: #f8fafc; font-size: 1.1rem; padding-top: 4px;">${user.createAtDate}</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>