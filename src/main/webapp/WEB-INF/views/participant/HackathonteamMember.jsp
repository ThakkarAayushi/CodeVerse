<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Manage Team Members | CodeVerse Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
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

        .table-card {
            background: white;
            border-radius: 24px;
            padding: 24px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .card-header h3 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-header h3 i {
            color: #3b82f6;
        }

        .add-btn {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 8px 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            transition: 0.2s;
            text-decoration: none;
        }
        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59,130,246,0.3);
        }

        .responsive-table {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 16px 12px;
            font-weight: 600;
            font-size: 0.85rem;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            border-bottom: 2px solid #e2e8f0;
        }

        td {
            padding: 16px 12px;
            border-bottom: 1px solid #edf2f7;
            color: #1e293b;
            font-weight: 500;
        }

        .action-btns {
            display: flex;
            gap: 8px;
        }
        .btn-icon {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
            color: white;
        }
        .btn-edit {
            background: #3b82f6;
        }
        .btn-edit:hover {
            background: #2563eb;
        }
        .btn-delete {
            background: #ef4444;
        }
        .btn-delete:hover {
            background: #dc2626;
        }

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
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Include your admin sidebar and header -->
        <jsp:include page="ParticipantSidebar.jsp" />
        <div class="main-content">
            <jsp:include page="ParticipantHeader.jsp" />

            <div class="content-area">
                <div class="table-card">
                    <div class="card-header">
                        <h3><i class="fas fa-users-cog"></i> Hackathon Team Members</h3>
                        <a href="addTeamMember.jsp" class="add-btn"><i class="fas fa-plus"></i> Add Member</a>
                    </div>
                    <div class="responsive-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Sr.No</th>
                                    <th>Team</th>
                                    <th>Hackathon</th>
                                    <th>Member</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="member" items="${teamMembersList}" varStatus="s">
                                    <tr>
                                        <td>${s.count}</td>
                                        <td>${member.teamName}</td>
                                        <td>${member.hackathonTitle}</td>
                                        <td>${member.memberName}</td>
                                        <td>${member.roleTitle}</td>
                                        <td>
                                            <div class="action-btns">
                                                <button class="btn-icon btn-edit" title="Edit" 
                                                        onclick="location.href='editTeamMember?id=${member.hackathonTeamMemberId}'">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </button>
                                                <button class="btn-icon btn-delete" title="Delete" 
                                                        onclick="if(confirm('Remove this member from team?')) location.href='deleteTeamMember?id=${member.hackathonTeamMemberId}'">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <c:if test="${empty teamMembersList}">
                                    <tr>
                                        <td colspan="6" style="text-align: center; padding: 60px; color: #94a3b8;">
                                            <i class="fas fa-users fa-2x mb-3" style="display: block; margin-bottom: 10px;"></i>
                                            No team members found.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <footer class="footer">
                &copy; 2026 CodeVerse. All rights reserved. Empowering hackathons.
            </footer>
        </div>
    </div>

    <!-- Optional script for sidebar toggle (if not handled in header) -->
    <script>
        // If you have a separate sidebar toggle script, ensure it doesn't conflict.
    </script>
</body>
</html>