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
        body { background: #f5f7fb; font-family: 'Inter', sans-serif; }
        .container { max-width: 500px; margin-top: 50px; }
        .card { border-radius: 24px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .card-header { background: transparent; border-bottom: 1px solid #edf2f7; padding: 1.5rem; }
        .card-body { padding: 2rem; }
        .btn-primary { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); border: none; border-radius: 50px; padding: 12px; }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(59,130,246,0.4); }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0"><i class="fas fa-users me-2"></i>Create Your Team</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/saveteam" method="post">
                    <input type="hidden" name="hackathon_id" value="${hackathon_id}">
                    <div class="mb-3">
                        <label for="teamName" class="form-label">Team Name</label>
                        <input type="text" class="form-control" id="teamName" name="teamName" 
                               placeholder="e.g., Code Warriors" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 py-2">Create Team</button>
                    <a href="/participant/home?hackathon_id=${hackathon_id}" class="btn btn-outline-secondary w-100 mt-2">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>