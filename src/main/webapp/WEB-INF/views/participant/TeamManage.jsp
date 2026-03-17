<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Team | CodeVerse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { 
            background: #f5f7fb; 
            font-family: 'Inter', sans-serif; 
            margin: 0;
            padding: 0;
        }
        .main-content {
            padding: 30px;
        }
        .container { 
            max-width: 600px; 
            margin: 0 auto; 
        }
        .card { 
            border-radius: 24px; 
            border: none; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05); 
        }
        .card-body { 
            padding: 2rem; 
        }
        .form-label {
            font-weight: 500;
            color: #1e293b;
        }
        .form-control {
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            padding: 12px 16px;
        }
        .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }
        .btn-primary { 
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); 
            border: none; 
            border-radius: 50px; 
            padding: 12px; 
        }
        .btn-primary:hover { 
            transform: translateY(-2px); 
            box-shadow: 0 8px 20px rgba(59,130,246,0.4); 
        }
        .btn-outline-secondary {
            border-radius: 50px;
            padding: 12px;
        }
        .page-title {
            margin-bottom: 24px;
            font-size: 1.5rem;
            font-weight: 600;
            color: #0f172a;
        }
        .subtext {
            font-size: 0.8rem;
            color: #94a3b8;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <jsp:include page="ParticipantHeader.jsp" />

    <div class="main-content">
        <div class="container">
            <h1 class="page-title">Create Your Team</h1>

            <div class="card">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/saveteam" method="post">
                        <input type="hidden" name="hackathon_id" value="${param.hackathon_id}">

                        <!-- Team Name -->
                        <div class="mb-3">
                            <label for="teamName" class="form-label">Team Name</label>
                            <input type="text" class="form-control" id="teamName" name="teamName" 
                                   placeholder="e.g., Code Warriors" required>
                        </div>

                        <!-- Invite Members (Emails) -->
                        <div class="mb-3">
                            <label for="memberEmails" class="form-label">Invite Members (Emails)</label>
                            <input type="text" class="form-control" id="memberEmails" name="memberEmails" 
                                   placeholder="email1@example.com, email2@example.com">
                            <div class="subtext">
                                <i class="fas fa-info-circle"></i> 
                                Enter email addresses separated by commas. Max team size is defined by the hackathon.
                            </div>
                        </div>

                        <!-- Team Description (optional) -->
                        <div class="mb-3">
                            <label for="teamDescription" class="form-label">Team Description (optional)</label>
                            <textarea class="form-control" id="teamDescription" name="teamDescription" 
                                      rows="3" placeholder="Tell others about your team..."></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2">
                            <i class="fas fa-users me-2"></i>Create Team
                        </button>
                        <a href="${pageContext.request.contextPath}/participant/home?hackathon_id=${param.hackathon_id}" 
                           class="btn btn-outline-secondary w-100 mt-2">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>