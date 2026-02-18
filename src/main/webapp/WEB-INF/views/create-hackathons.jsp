<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Create Hackathon | CodeVerse Admin</title>
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
    
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
              
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
                                                <i class="icon nalika-edit"></i>
                                            </div>
                                            <div class="breadcomb-ctn">
                                                <h2>Setup New Hackathon</h2>
                                                <p>Define event details and <span class="bread-ntd">Participation Limits</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-product-tab-area mg-b-30">
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#hackathon_details"><i class="icon nalika-forms" aria-hidden="true"></i> Event Info</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="hackathon_details">
                                        <form action="save-hackathon" method="POST">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="review-content-section">
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-trophy" aria-hidden="true"></i></span>
                                                            <input type="text" name="title" class="form-control" placeholder="Event Title (e.g. CyberSprint 2026)" required>
                                                        </div>
                                                        <select name="status" class="form-control pro-edt-select form-control-primary mg-b-pro-edt">
                                                            <option value="LIVE">Live</option>
                                                            <option value="UPCOMING">Upcoming</option>
                                                            <option value="EXPIRED">Expired</option>
                                                        </select>
                                                        <select name="event_type" class="form-control pro-edt-select form-control-primary mg-b-pro-edt">
                                                            <option value="ONLINE">Online</option>
                                                            <option value="OFFLINE">Offline</option>
                                                            <option value="HYBRID">Hybrid</option>
                                                        </select>
                                                        <select name="payment" class="form-control pro-edt-select form-control-primary mg-b-pro-edt">
                                                            <option value="FREE">Free (No Entry Fee)</option>
                                                            <option value="PAID">Paid (Entry Fee Applies)</option>
                                                        </select>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i></span>
                                                            <input type="text" name="location" class="form-control" placeholder="Remote or Venue Address" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="review-content-section">
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></span>
                                                            <input type="number" name="minTeamSize" class="form-control" placeholder="Min Team Size" min="1" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-user-plus" aria-hidden="true"></i></span>
                                                            <input type="number" name="maxTeamSize" class="form-control" placeholder="Max Team Size" min="1" required>
                                                        </div>
                                                        <select name="userType" class="form-control pro-edt-select form-control-primary mg-b-pro-edt" required>
                                                            <option value="">-- Allowed User Type --</option>
                                                            <c:forEach items="${allUserType}" var="ut">
                                                                <option value="${ut.userType}">${ut.userType}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <label style="color: #94a3b8; font-size: 12px; padding-left: 5px;">Registration Start Date</label>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>
                                                            <input type="date" name="registrationStartDate" class="form-control" required>
                                                        </div>
                                                        <label style="color: #94a3b8; font-size: 12px; padding-left: 5px;">Registration End Date</label>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></span>
                                                            <input type="date" name="registrationEndDate" class="form-control" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="text-center custom-pro-edt-ds">
                                                        <button type="submit" class="btn btn-ctl-bt waves-effect waves-light m-r-10">🚀 Launch Hackathon</button>
                                                        <button type="button" onclick="location.href='manage-hackathons'" class="btn btn-ctl-bt waves-effect waves-light">✖ Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page = "Footer.jsp"></jsp:include>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <script src="js/main.js"></script>
</body>
</html>