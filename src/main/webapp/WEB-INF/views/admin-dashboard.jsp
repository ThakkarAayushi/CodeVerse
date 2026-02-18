<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | CodeVerse</title>
    <%-- In STS, use relative paths or ${pageContext.request.contextPath} for CSS --%>
    <link rel="stylesheet" href="dashboard.css">
    <jsp:include page="AdminSidebar.jsp"></jsp:include>
</head>
<body>
    <div class="dashboard">
        
        <main class="content">
            <header class="header">

                <h1>Platform Command Center</h1>
                <!--button class="btn-primary">+ Create Hackathon</button-->
            </header>

            <section class="grid-stats">
                <div class="card">
                    <h3>Active Hackathons</h3>
                    <div class="value">14</div>
                    <p class="subtext">Across all organizers</p>
                </div>
                <div class="card">
                    <h3>Pending Approvals</h3>
                    <div class="value highlight">08</div>
                    <p class="subtext">Organizers & Judges</p>
                </div>
                <div class="card">
                    <h3>Total Users</h3>
                    <div class="value">2,405</div>
                    <p class="subtext">Participants & Teams</p>
                </div>
            </section>

            <section class="table-section">
                <div class="table-header">
                    <h2>Pending Approvals</h2>
                </div>
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role Request</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%-- This section will eventually be populated dynamically via JSTL --%>
                            <tr>
                                <td>Tech Innovators</td>
                                <td>contact@techinn.com</td>
                                <td>Organizer</td>
                                <td><span class="badge warning">Pending</span></td>
                                <td>
                                    <button class="btn-table approve">Approve</button>
                                    <button class="btn-table reject">Reject</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        
   <jsp:include page="Footer.jsp"></jsp:include>
        </main>
        
    </div>
    <!-- %@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%-->
  
        </div>
    </div>
</footer>
</body>
</html>