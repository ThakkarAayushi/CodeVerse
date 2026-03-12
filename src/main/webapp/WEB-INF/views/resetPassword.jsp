<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | CodeVerse</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .auth-container {
            width: 100%;
            max-width: 480px;
        }

        .auth-card {
            background: white;
            border-radius: 24px;
            padding: 40px 35px;
            box-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.1);
            border: 1px solid #edf2f7;
        }

        .auth-card h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: #0f172a;
        }

        .auth-card p {
            color: #64748b;
            margin-bottom: 30px;
            font-size: 0.95rem;
        }

        /* Message styles */
        .message {
            padding: 12px 16px;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .message.error {
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fee2e2;
        }
        .message.success {
            background: #f0fdf4;
            color: #166534;
            border: 1px solid #dcfce7;
        }
        .message i {
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .input-group {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            transition: 0.2s;
        }
        .input-group:focus-within {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }

        .input-group-icon {
            padding: 0 15px;
            color: #3b82f6;
            font-size: 1.1rem;
        }

        .input-group input {
            width: 100%;
            padding: 14px 15px 14px 0;
            border: none;
            outline: none;
            font-size: 1rem;
            color: #1e293b;
            background: transparent;
        }
        .input-group input::placeholder {
            color: #94a3b8;
        }

        .helper-text {
            display: block;
            color: #64748b;
            font-size: 0.8rem;
            margin-top: 5px;
        }

        .btn-auth {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            border: none;
            border-radius: 50px;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 4px 10px rgba(59,130,246,0.3);
            margin-top: 10px;
        }
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59,130,246,0.4);
        }

        .btn-secondary {
            width: 100%;
            padding: 14px;
            background: #f1f5f9;
            border: none;
            border-radius: 50px;
            color: #1e293b;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            text-align: center;
            display: inline-block;
            text-decoration: none;
            margin-top: 10px;
        }
        .btn-secondary:hover {
            background: #e2e8f0;
            transform: translateY(-2px);
        }

        .auth-footer {
            text-align: center;
            margin-top: 25px;
            color: #64748b;
            font-size: 0.9rem;
        }
        .auth-footer a {
            color: #3b82f6;
            font-weight: 600;
            text-decoration: none;
        }
        .auth-footer a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .auth-card {
                padding: 30px 20px;
            }
            .auth-card h2 {
                font-size: 1.8rem;
            }
        }
        /* More compact version – fits on smaller screens without scrolling */
@media (max-height: 750px) {
    .auth-card {
        padding: 25px 30px;
    }
    .auth-card h2 {
        font-size: 1.8rem;
        margin-bottom: 5px;
    }
    .auth-card p {
        margin-bottom: 15px;
    }
    .form-group {
        margin-bottom: 12px;
    }
    .input-group input {
        padding: 10px 15px 10px 0;
    }
    .btn-auth, .btn-secondary {
        padding: 10px;
        margin-top: 5px;
    }
}

/* For very small heights – further compact */
@media (max-height: 650px) {
    .auth-card {
        padding: 20px 25px;
    }
    .auth-card h2 {
        font-size: 1.6rem;
    }
    .auth-card p {
        font-size: 0.85rem;
        margin-bottom: 12px;
    }
    .form-group label {
        font-size: 0.8rem;
        margin-bottom: 4px;
    }
    .input-group input {
        padding: 8px 15px 8px 0;
        font-size: 0.9rem;
    }
    .input-group-icon {
        font-size: 1rem;
        padding: 0 12px;
    }
    .btn-auth, .btn-secondary {
        padding: 8px;
        font-size: 0.9rem;
    }
    .auth-footer {
        margin-top: 15px;
        font-size: 0.8rem;
    }
}

/* For mobile landscape – ensure everything fits */
@media (max-width: 768px) and (max-height: 500px) {
    .auth-card {
        padding: 15px 20px;
    }
    .auth-card h2 {
        font-size: 1.4rem;
    }
    .form-group {
        margin-bottom: 8px;
    }
    .input-group input {
        padding: 6px 12px 6px 0;
    }
}
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h2>Reset Password</h2>
            <p>Verify your identity and set a new password.</p>
            
            <%-- Feedback Messages --%>
            <c:if test="${not empty error}">
                <div class="message error">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="message success">
                    <i class="fas fa-check-circle"></i> ${success}
                </div>
            </c:if>

            <form action="update-password" method="POST" id="resetPasswordForm">
                <div class="form-group">
                    <label>Email Address</label>
                    <div class="input-group">
                        <span class="input-group-icon"><i class="fas fa-envelope"></i></span>
                        <input type="email" name="email" placeholder="example@gmail.com" value="${email}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>OTP Verification</label>
                    <div class="input-group">
                        <span class="input-group-icon"><i class="fas fa-shield-alt"></i></span>
                        <input type="text" name="otp" placeholder="Enter 6-digit OTP" required maxlength="6">
                    </div>
                    <span class="helper-text">Check your email for the code.</span>
                </div>

                <div class="form-group">
                    <label>New Password</label>
                    <div class="input-group">
                        <span class="input-group-icon"><i class="fas fa-lock"></i></span>
                        <input type="password" name="newPassword" placeholder="Minimum 8 characters" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Confirm New Password</label>
                    <div class="input-group">
                        <span class="input-group-icon"><i class="fas fa-lock"></i></span>
                        <input type="password" name="confirmPassword" placeholder="Re-enter password" required>
                    </div>
                </div>

                <button type="submit" class="btn-auth"><i class="fas fa-sync-alt"></i> Update Password</button>
                <a href="login" class="btn-secondary"><i class="fas fa-times"></i> Cancel</a>
            </form>
            
            <p class="auth-footer">
                Remember your password? <a href="login">Login here</a>
            </p>
        </div>
    </div>
</body>
</html>