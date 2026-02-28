<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Participant Dashboard | CodeVerse</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/nalika-icon.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/meanmenu.min.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="../css/metisMenu/metisMenu-vertical.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <jsp:include page="ParticipantSidebar.jsp"></jsp:include>

    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                           <!--img class="main-logo" src="${pageContext.request.contextPath}/img/logo/logo.png" alt="CodeVerse" /-->
                    </div>
                </div>
            </div>
        </div>

        <div class="header-advance-area">
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
                                            <div class="breadcomb-icon">
                                                <i class="fa fa-rocket"></i>
                                            </div>
                                            <div class="breadcomb-ctn">
                                                <h2>Participant Workspace</h2>
                                                <p>Welcome back, <span class="bread-ntd">${sessionScope.user.firstName}</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right">
                                        <button class="btn btn-success" onclick="location.href='browse-hackathons'">Find New Hackathons</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-admin container-fluid">
            <div class="row admin text-center">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="admin-content analysis-progrebar-ctn res-mg-t-15">
                        <h4 class="text-left"><b>My Hackathons</b></h4>
                        <h2 class="text-right no-margin" style = "color:#ffffff;">04</h2>
                        <div class="progress progress-mini"><div style="width: 60%;" class="progress-bar bg-green"></div></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="admin-content analysis-progrebar-ctn res-mg-t-15">
                        <h4 class="text-left"><b>Rank</b></h4>
                        <h2 class="text-right no-margin"style = "color:#ffffff;">#124</h2>
                        <div class="progress progress-mini"><div style="width: 40%;" class="progress-bar bg-blue"></div></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="admin-content analysis-progrebar-ctn res-mg-t-15">
                        <h4 class="text-left"><b>Certificates</b></h4>
                        <h2 class="text-right no-margin"style = "color:#ffffff;">02</h2>
                        <div class="progress progress-mini"><div style="width: 30%;" class="progress-bar bg-purple"></div></div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="admin-content analysis-progrebar-ctn res-mg-t-15">
                        <h4 class="text-left"><b>XP Gained</b></h4>
                        <h2 class="text-right no-margin"style = "color:#ffffff;">1,250</h2>
                        <div class="progress progress-mini"><div style="width: 75%;" class="progress-bar bg-red"></div></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-status mg-b-30" style="margin-top: 30px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>My Active Competitions</h4>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Hackathon</th>
                                        <th>Role/Team</th>
                                        <th>Deadline</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Example Row --%>
                                    <tr>
                                        <td style="color: #fff; font-weight: 600;">Global AI Challenge 2026</td>
                                        <td>Team Lead (Solo)</td>
                                        <td>March 15, 2026</td>
                                        <td><button class="pd-setting">Active</button></td>
                                        <td>
                                            <button data-toggle="tooltip" title="View Details" class="pd-setting-ed"><i class="fa fa-eye"></i></button>
                                            <button data-toggle="tooltip" title="Submit Project" class="pd-setting-ed"><i class="fa fa-upload"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-sales-area mg-tb-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                        <div class="product-sales-chart">
                            <div class="portlet-title">
                                <h4 style = "color:#ffffff;">Growth Analytics (Skill XP)</h4>
                            </div>
                            <div id="curved-line-chart" class="flot-chart-sts flot-chart curved-chart-statistic"></div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <div class="white-box analytics-info-cs mg-b-30">
                            <h3 class="box-title">Global Standing</h3>
                            <ul class="list-inline two-part-sp">
                                <li><div id="sparklinedash"></div></li>
                                <li class="text-right sp-cn-r"><i class="fa fa-level-up"></i> <span class="counter sales-sts-ctn">Top 5%</span></li>
                            </ul>
                        </div>
                        <div class="white-box analytics-info-cs">
                            <h3 class="box-title">Next Milestone</h3>
                            <p style="color: #94a3b8;">Reach 2,000 XP to unlock "Senior Coder" badge.</p>
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