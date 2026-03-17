<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team Formation | CodeVerse</title>
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
            color: #1e293b;
        }

        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: #f8fafc;
        }

        .content-area {
            padding: 30px;
            flex: 1;
        }

        /* Form Card */
        .form-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #64748b;
            margin-bottom: 8px;
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

        .input-group input {
            width: 100%;
            padding: 14px 16px;
            border: none;
            outline: none;
            font-size: 1rem;
            color: #1e293b;
            background: transparent;
            font-family: 'Inter', sans-serif;
        }

        .subtext {
            font-size: 0.8rem;
            color: #94a3b8;
            margin-top: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            border: none;
            border-radius: 50px;
            padding: 14px 35px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 4px 10px rgba(59,130,246,0.3);
            width: 100%;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59,130,246,0.4);
        }

        /* Footer */
        .footer {
            background: white;
            padding: 20px 30px;
            border-top: 1px solid #e9eef2;
            text-align: center;
            color: #64748b;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .content-area {
                padding: 20px;
            }
            .form-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Sidebar -->
        <jsp:include page="ParticipantSidebar.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <jsp:include page="ParticipantHeader.jsp" />

            <!-- Content Area -->
            <div class="content-area">
                <h1 class="page-title">Team Formation</h1>

                <div class="form-card">
                    <form action="${pageContext.request.contextPath}/create-team" method="POST">
                        <div class="form-group">
                            <label>Team Name</label>
                            <div class="input-group">
                                <input type="text" name="teamName" placeholder="Enter your team name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Invite Members (Emails)</label>
                            <div class="input-group">
                                <input type="text" name="memberEmails" placeholder="email1@example.com, email2@example.com">
                            </div>
                            <p class="subtext">
                                <i class="fas fa-info-circle"></i> 
                                Maximum team size is set by Admin in System Settings.
                            </p>
                        </div>

                        <button type="submit" class="btn-primary">
                            <i class="fas fa-users"></i> Create Team
                        </button>
                    </form>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                &copy; 2026 CodeVerse. All rights reserved. Empowering hackathons.
            </footer>
        </div>
    </div>
</body>
</html>