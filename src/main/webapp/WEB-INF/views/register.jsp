<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | CodeVerse</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="auth.css"> 
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h2>Join <span>CodeVerse</span></h2>
            <p>Create your account to start competing or organizing.</p>
            
            <form action="stored" method="POST">
                
                <div class="form-group-row" style="display: flex; gap: 10px;">
                    <div class="form-group" style="flex: 1;">
                        <label>First Name</label>
                        <input type="text" name="firstName" placeholder="First Name" required>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>Last Name</label>
                        <input type="text" name="LastName" placeholder="Last Name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="name@example.com" required>
                </div>

                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="text" name="contactNum" placeholder="e.g. +1234567890" required>
                </div>

                <div class="form-group-row" style="display: flex; gap: 10px;">
                    <div class="form-group" style="flex: 1;">
                        <label>Gender</label>
                        <select name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>Birth Year</label>
                        <input type="number" name="birthYear" placeholder="YYYY" min="1900" max="2026" required>
                    </div>
                </div>

                <%-- Added Qualification Field --%>
                <div class="form-group">
                    <label>Qualification</label>
                    <input type="text" name="qualification" placeholder="e.g. B.Tech Computer Science" required>
                </div>
                
                <div class="form-group">
                    <label>User Type</label>
                   <select name="userTypeId" class="form-control" required style="width: 100%; padding: 10px; border-radius: 6px; background: #0b0f19; color: white; border: 1px solid #30363d;">
                        <option value="-1">---Select User Type---</option>
                        <c:forEach items="${allUserType}" var="ut">
                            <option value="${ut.userTypeId}">${ut.userType}</option>
                        </c:forEach>
                    </select>
                </div>
                

                <%-- Added Location Fields --%>
                <div class="form-group">
                    <label>City</label>
                    <input type="text" name="city" placeholder="City" required>
                </div>

                <div class="form-group-row" style="display: flex; gap: 10px;">
                    <div class="form-group" style="flex: 1;">
                        <label>State</label>
                        <input type="text" name="state" placeholder="State/Province" required>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>Country</label>
                        <input type="text" name="country" placeholder="Country" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Profile Picture URL</label>
                    <input type="file" name="profilePicURL" placeholder="https://image-link.com/photo.jpg">
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Create a password" required>
                </div>

                <button type="submit" class="btn-auth">Create Account</button>
            </form>
            <p class="auth-footer">Already have an account? <a href="login">Login here</a></p>
        </div>
    </div>
</body>
</html>