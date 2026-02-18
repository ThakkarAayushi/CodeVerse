<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Manage Hackathons | CodeVerse</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nalika-icon.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    
    <style>
        .type-badge {
            border: 1px solid #30363d;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 0.7rem;
            color: #94a3b8;
            margin-right: 5px;
        }
        .event-title { color: #fff; font-weight: 600; display: block; }
        .date-start { font-size: 12px; color: #24caa1; }
        .date-end { font-size: 12px; color: #fe5e5e; }
    </style>
    
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <div class="all-content-wrapper">
        <div class="breadcome-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcome-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="icon nalika-home"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Hackathon Events</h2>
                                            <p>Manage existing competitions and schedules</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="breadcomb-report">
                                        <button data-toggle="tooltip" title="Download Report" class="btn"><i class="icon nalika-download"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Hackathon Events List</h4>
                            <!--div class="add-product">
                                <a href="create-hackathon">Launch New</a>
                            </div-->
                            <table>
                                <thead>
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>Event Details</th>
                                        <th>Participation</th>
                                        <th>Registration Period</th>
                                        <th>Location</th>
                                        <th>Status</th>
                                        <th>Setting</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="h" items="${allHackathons}" varStatus="s">
                                        <tr>
                                            <td>${s.count}</td>
                                            <td>
                                                <span class="event-title">${h.title}</span>
                                                <small style="display:block; margin-top:5px;">
                                                    <span class="type-badge">${h.event_type}</span>
                                                    <span class="type-badge">${h.payment}</span>
                                                </small>
                                            </td>
                                            <td>
                                                <div>${h.userType}s</div>
                                                <div style="font-size: 11px; color: #94a3b8;">Team: ${h.minTeamSize}-${h.maxTeamSize}</div>
                                            </td>
                                            <td>
                                                <div class="date-start">Start: ${h.registrationStartDate}</div>
                                                <div class="date-end">End: ${h.registrationEndDate}</div>
                                            </td>
                                            <td>${h.location}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${h.status == 'LIVE'}">
                                                        <button class="pd-setting">Live</button>
                                                    </c:when>
                                                    <c:when test="${h.status == 'EXPIRED'}">
                                                        <button class="ds-setting">Expired</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="ps-setting">${h.status}</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button data-toggle="tooltip" title="Edit" class="pd-setting-ed" 
                                                        onclick="location.href='edit-hackathon?hackthon_id=${h.hackthon_id}'">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                                <button data-toggle="tooltip" title="Trash" class="pd-setting-ed" 
                                                        onclick="if(confirm('Delete this event?')) location.href='deleteHackathon?hackthon_id=${h.hackthon_id}'">
                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty allHackathons}">
                                        <tr>
                                            <td colspan="7" style="text-align: center; padding: 60px; color: #94a3b8;">
                                                No hackathons found. Create your first event to get started!
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            
                            <div class="custom-pagination">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2026 CodeVerse. All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <script src="js/main.js"></script>
</body>
</html>