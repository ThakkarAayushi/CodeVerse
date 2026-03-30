<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Review Submission | CodeVerse</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* ========== ROOT VARIABLES & GLOBAL ========== */
        :root {
            --primary: #4f46e5;
            --primary-dark: #4338ca;
            --primary-light: #818cf8;
            --secondary: #0f172a;
            --accent: #22c55e;
            --gray-50: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-800: #1e293b;
            --gray-900: #0f172a;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f1f5f9 0%, #eef2ff 100%);
            color: var(--gray-800);
            line-height: 1.5;
            overflow-x: hidden;
        }

        /* ===== MAIN LAYOUT (compatible with sidebar/header) ===== */
        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            transition: all 0.3s ease;
        }

        .content-area {
            flex: 1;
            padding: 2rem 2rem 1rem 2rem;
        }

        /* ===== MODERN CARD DESIGN ===== */
        .glass-card {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(0px);
            border-radius: 28px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        /* ===== BACK LINK ===== */
        .back-link-modern {
            display: inline-flex;
            align-items: center;
            gap: 0.6rem;
            color: var(--gray-600);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            padding: 0.5rem 1rem;
            border-radius: 40px;
            transition: all 0.2s;
            background: rgba(255,255,255,0.6);
        }

        .back-link-modern:hover {
            background: white;
            color: var(--primary);
            transform: translateX(-3px);
        }

        /* ===== PAGE TITLE (GRADIENT TEXT) ===== */
        .page-title {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(135deg, var(--gray-900), var(--primary-dark));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: -0.02em;
            margin: 0.5rem 0 0;
        }

        /* ===== META GRID ===== */
        .meta-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        .meta-item {
            background: #f8fafc;
            border-radius: 16px;
            padding: 1rem;
            border: 1px solid var(--gray-200);
        }
        .meta-label {
            font-size: 0.7rem;
            text-transform: uppercase;
            font-weight: 600;
            color: var(--gray-600);
            letter-spacing: 0.5px;
        }
        .meta-value {
            font-weight: 700;
            color: var(--gray-800);
            margin-top: 0.25rem;
        }

        /* ===== LINK BUTTONS ===== */
        .btn-link-custom {
            background: #f1f5f9;
            border: 1px solid #e2e8f0;
            border-radius: 40px;
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            font-weight: 500;
            color: #334155;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.2s;
        }
        .btn-link-custom:hover {
            background: #e2e8f0;
            color: #0f172a;
        }

        /* ===== FORM STYLES ===== */
        .form-label-custom {
            font-weight: 500;
            color: var(--gray-700);
            margin-bottom: 0.5rem;
        }
        .form-control, .form-select {
            border-radius: 12px;
            border: 1px solid var(--gray-200);
            padding: 0.6rem 1rem;
            transition: all 0.2s;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }
        .form-text {
            font-size: 0.75rem;
            color: var(--gray-600);
            margin-top: 0.25rem;
        }

        /* ===== BUTTONS ===== */
        .btn-save {
            background: linear-gradient(105deg, var(--primary) 0%, var(--primary-dark) 100%);
            border: none;
            border-radius: 40px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            transition: all 0.2s;
            color: white;
        }
        .btn-save:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
        }
        .btn-cancel {
            background: #f1f5f9;
            border: 1px solid var(--gray-200);
            border-radius: 40px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            color: var(--gray-700);
            text-decoration: none;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        .btn-cancel:hover {
            background: #e2e8f0;
        }

        /* ===== FOOTER ===== */
        .footer {
            padding: 1rem 2rem;
            text-align: center;
            font-size: 0.8rem;
            color: var(--gray-600);
            border-top: 1px solid var(--gray-200);
            background: rgba(255,255,255,0.6);
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .content-area { padding: 1rem; }
            .page-title { font-size: 1.5rem; }
            .meta-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
<div class="app-wrapper">
    <!-- Judge Sidebar -->
    <jsp:include page="JudgeSidebar.jsp" />
    <div class="main-content">
        <!-- Judge Header -->
        <jsp:include page="JudgeHeader.jsp" />
        <div class="content-area">
            <!-- Header & Back (same style as submissions list) -->
            <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
                <div>
                    <a href="${pageContext.request.contextPath}/judge/submissions" class="back-link-modern mb-2 d-inline-block">
                        <i class="fas fa-arrow-left"></i> Back to Submissions
                    </a>
                    <h1 class="page-title mt-2">Review Team Submission</h1>
                    <p class="text-muted mt-1">Evaluate and score the project based on predefined criteria.</p>
                </div>
            </div>

            <!-- Submission Info Card -->
            <div class="glass-card mb-4">
                <div class="card-body-custom p-4">
                    <div class="meta-grid">
                        <div class="meta-item">
                            <div class="meta-label">Hackathon</div>
                            <div class="meta-value">${hackathon.title}</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">Team</div>
                            <div class="meta-value">${team.teamName}</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-label">Submitted Date</div>
                            <div class="meta-value">${submission.submitedDate}</div>
                        </div>
                    </div>
                    <div class="d-flex gap-3">
                        <a href="${submission.codeBaseUrl}" target="_blank" class="btn-link-custom">
                            <i class="fab fa-github"></i> Open Code Base
                        </a>
                        <a href="${submission.documentationUrl}" target="_blank" class="btn-link-custom">
                            <i class="fas fa-file-alt"></i> Open Documentation
                        </a>
                    </div>
                </div>
            </div>

            <!-- Review Form Card -->
            <div class="glass-card">
                <div class="card-body-custom p-4">
                    <form action="${pageContext.request.contextPath}/judge/submissions/review/save" method="post">
                        <input type="hidden" name="hackathonResultId" value="${result.hackathonResultId}">
                        <input type="hidden" name="hackathonId" value="${submission.hackathonId}">
                        <input type="hidden" name="teamId" value="${submission.teamId}">

                        <div class="row g-4">
                            <div class="col-md-4">
                                <label class="form-label-custom">Innovation (1-10)</label>
                                <input type="number" name="innovation" class="form-control" min="1" max="10" value="${result.innovation}" required>
                                <div class="form-text">How unique and creative is the solution?</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-custom">Implementation (1-10)</label>
                                <input type="number" name="implementation" class="form-control" min="1" max="10" value="${result.implementation}" required>
                                <div class="form-text">How complete and functional is the build?</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label-custom">Coding Standard (1-10)</label>
                                <input type="number" name="codingStandard" class="form-control" min="1" max="10" value="${result.codingStandard}" required>
                                <div class="form-text">Code quality, readability, and maintainability.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label-custom">Round</label>
                                <select name="round" class="form-select" required>
                                    <option value="">Select Round</option>
                                    <option value="ROUND_1" ${result.round == 'ROUND_1' ? 'selected' : ''}>Round 1</option>
                                    <option value="ROUND_2" ${result.round == 'ROUND_2' ? 'selected' : ''}>Round 2</option>
                                    <option value="FINAL" ${result.round == 'FINAL' ? 'selected' : ''}>Final</option>
                                </select>
                            </div>
                        </div>

                        <div class="mt-4 d-flex gap-3">
                            <button type="submit" class="btn-save">
                                <i class="fas fa-save me-2"></i>Save Review
                            </button>
                            <a href="${pageContext.request.contextPath}/judge/submissions" class="btn-cancel">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div>© CodeVerse Judge Panel — Empowering fair evaluations</div>
            <div class="mt-1"><a href="#" class="text-decoration-none text-secondary">Support</a> | <a href="#" class="text-decoration-none text-secondary">Guidelines</a></div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>