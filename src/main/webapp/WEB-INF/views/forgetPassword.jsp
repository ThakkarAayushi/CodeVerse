<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | CodeVerse</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/auth.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h2><span>Forgot Password</span></h2>
            <p>Enter your email address to recover your account.</p>
            
            <%-- Feedback Messages from Spring Controller --%>
            <c:if test="${not empty error}">
                <div style="color: #ef4444; background: rgba(239, 68, 68, 0.1); padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 0.85rem; border: 1px solid #ef4444;">
                    ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div style="color: #10b981; background: rgba(16, 185, 129, 0.1); padding: 10px; border-radius: 6px; margin-bottom: 15px; font-size: 0.85rem; border: 1px solid #10b981;">
                    ${success}
                </div>
            </c:if>

            <form action="resetPassword" method="POST">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="name@example.com" required>
                </div>
                
                <button type="submit" class="btn-auth">Send OTP</button>
            </form>
            
            <p class="auth-footer">
                Remember your password? <a href="login">Login here</a>
            </p>
        </div>
    </div>
</body>
</html>