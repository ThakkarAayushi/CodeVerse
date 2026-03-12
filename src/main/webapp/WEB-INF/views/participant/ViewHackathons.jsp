<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${hackathon.title} | Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background: #f8fafc; }
        .detail-card { border-radius: 20px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .quick-facts { background: white; border-radius: 20px; padding: 1.5rem; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .fact-item { display: flex; align-items: center; padding: 0.75rem 0; border-bottom: 1px solid #edf2f7; }
        .fact-item:last-child { border-bottom: none; }
        .fact-icon { width: 40px; height: 40px; background: #eef2ff; border-radius: 12px; display: flex; align-items: center; justify-content: center; color: #3b82f6; margin-right: 15px; }
        .status-badge { font-size: 0.9rem; padding: 0.5rem 1.2rem; border-radius: 30px; }
        .prize-item { padding: 1rem; background: #f8fafc; border-radius: 16px; margin-bottom: 1rem; border: 1px solid #edf2f7; }
        .prize-title { font-weight: 600; color: #3b82f6; margin-bottom: 5px; }
        .prize-desc { color: #64748b; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container py-5">
    <!-- Back button -->
    <a href="/participant/participant-dashboard" class="btn btn-link text-decoration-none mb-4">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>

    <div class="row">
        <!-- Main Details -->
        <div class="col-lg-8">
            <div class="detail-card card p-4 mb-4">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <h1 class="fw-bold">${hackathon.title}</h1>
                    <span class="status-badge ${hackathon.status == 'LIVE' ? 'bg-success' : hackathon.status == 'UPCOMING' ? 'bg-warning' : 'bg-secondary'} text-white">
                        ${hackathon.status}
                    </span>
                </div>
                
                <p class="text-muted">
                    <i class="fas fa-map-marker-alt me-2"></i>${hackathon.location} | ${hackathon.event_type}
                </p>
                <hr>
                
                <h5 class="fw-bold mt-4">Description</h5>
                <p>${hackathon.description}</p>
                
                <h5 class="fw-bold mt-4">Registration Timeline</h5>
                <div class="row text-center bg-white border rounded p-3 my-3">
                    <div class="col-md-6 border-end">
                        <p class="text-muted mb-1 small">Starts On</p>
                        <p class="fw-bold text-primary mb-0">${hackathon.registrationStartDate}</p>
                    </div>
                    <div class="col-md-6">
                        <p class="text-muted mb-1 small">Ends On</p>
                        <p class="fw-bold text-danger mb-0">${hackathon.registrationEndDate}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Facts & Registration -->
        <div class="col-lg-4">
            <div class="quick-facts">
                <h5 class="mb-4">Quick Facts</h5>
                
                <div class="fact-item">
                    <div class="fact-icon"><i class="fas fa-users"></i></div>
                    <div>
                        <small class="text-secondary d-block">Team Size</small>
                        <span class="fw-bold">${hackathon.minTeamSize} - ${hackathon.maxTeamSize} Members</span>
                    </div>
                </div>
                
                <div class="fact-item">
                    <div class="fact-icon"><i class="fas fa-credit-card"></i></div>
                    <div>
                        <small class="text-secondary d-block">Entry Fee</small>
                        <span class="fw-bold">${hackathon.payment}</span>
                    </div>
                </div>
                
                <div class="fact-item">
                    <div class="fact-icon"><i class="fas fa-user-tag"></i></div>
                    <div>
                        <small class="text-secondary d-block">Allowed User Type</small>
                        <span class="fw-bold">${hackathon.userType}</span>
                    </div>
                </div>
                
                <hr class="my-4">
                
                <!-- Registration decision based on date and status -->
                <c:choose>
                    <%-- Deadline passed --%>
                    <c:when test="${today > hackathon.registrationEndDate}">
                        <div class="alert alert-danger text-center mb-3" role="alert">
                            <i class="fas fa-clock me-2"></i> Registration Deadline Passed
                        </div>
                        <button class="btn btn-secondary w-100 py-2 fw-bold" disabled>
                            Deadline Expired
                        </button>
                    </c:when>

                    <%-- Status valid for registration --%>
                    <c:when test="${hackathon.status == 'UPCOMING' || hackathon.status == 'LIVE'}">
                        <c:choose>
                            <c:when test="${isRegistered}">
                                <div class="alert alert-info text-center mb-3" role="alert">
                                    <i class="fas fa-check-circle me-2"></i> You are already registered.
                                </div>
                                <a href="/participant/view-my-info?id=${hackathon.hackthon_id}" class="btn btn-outline-info w-100 py-2 fw-bold">
                                    <i class="fas fa-info-circle"></i> View My Information
                                </a>
                            </c:when>
                            <c:otherwise>
                                <form action="${pageContext.request.contextPath}/teamManage" method="get">
                                    <input type="hidden" name="hackathon_id" value="${hackathon.hackthon_id}">
                                    <button type="submit" class="btn btn-primary w-100 py-2 fw-bold shadow">
                                        <i class="fas fa-pen"></i> Register Now
                                    </button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </c:when>

                    <%-- Expired or other closed status --%>
                    <c:otherwise>
                        <div class="alert alert-secondary text-center mb-3" role="alert">
                            <i class="fas fa-ban me-2"></i> Registration Not Available
                        </div>
                        <button class="btn btn-secondary w-100 py-2 fw-bold" disabled>
                            ${hackathon.status == 'EXPIRED' ? 'Hackathon Expired' : 'Closed'}
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Prizes Section -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="detail-card card p-4">
                <h5 class="fw-bold mb-4"><i class="fas fa-trophy text-warning me-2"></i> Prizes</h5>
                <c:choose>
                    <c:when test="${not empty prizes}">
                        <div class="row">
                            <c:forEach var="prize" items="${prizes}">
                                <div class="col-md-6">
                                    <div class="prize-item">
                                        <div class="prize-title">
                                            <i class="fas fa-medal me-2" style="color: #f59e0b;"></i> ${prize.prizeTitle}
                                        </div>
                                        <div class="prize-desc">${prize.prizeDescription}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted">No prizes have been announced yet.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>