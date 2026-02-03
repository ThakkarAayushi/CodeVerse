<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CodeVerse</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="auth.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h2>Welcome Back</h2>
            <p>Login to your CodeVerse dashboard.</p>
            
            <%-- Form action should point to your Login Servlet --%>
            <form action="forgetPassw" method="POST">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>
                <div class="forgot-pass">
                    <a href="forgetpassword">Forgot Password?</a>
                </div>
                <button type="submit" class="btn-auth">Login</button>
            </form>
            <p class="auth-footer">New to the platform? <a href="register">Sign up now</a></p>
        </div>
    </div>
</body>
</html>