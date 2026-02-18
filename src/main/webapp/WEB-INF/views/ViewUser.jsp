<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>User Profile | CodeVerse Admin</title>
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
        .profile-info-label { color: #94a3b8; font-size: 11px; text-transform: uppercase; font-weight: 700; margin-bottom: 2px; }
        .profile-info-value { color: #fff; font-size: 16px; margin-bottom: 15px; }
        .profile-card-custom { background: #152036; border-radius: 8px; padding: 30px; margin-top: 20px; }
        .profile-main-img { width: 150px; height: 150px; border-radius: 50%; border: 4px solid #24caa1; object-fit: cover; }
    </style>

    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                
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
                                                <i class="icon nalika-user"></i>
                                            </div>
                                            <div class="breadcomb-ctn">
                                                <h2>User Profile</h2>
                                                <p>Viewing details for <span class="bread-ntd">${user.firstName}</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
                                            <!-- button data-toggle="tooltip" title="Edit This User" class="btn" onclick="location.href='edit-user?userId=${user.userId}'">
                                                <i class="icon nalika-edit"></i>
                                            </button-->
                                            <button data-toggle="tooltip" title="Back to Directory" class="btn" onclick="location.href='listUser'">
                                                <i class="fa fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-product-tab-area mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="profile-card-custom">
                            <div class="row">
                                <%-- Left Section: Avatar & Identity --%>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center" style="border-right: 1px solid #2b354a;">
                                    <img src="${not empty user.profilePicURL ? user.profilePicURL : 'img/contact/1.jpg'}" 
                                         class="profile-main-img" alt="User Profile">
                                    <h2 style="color: #fff; margin-top: 15px;">${user.firstName} ${user.lastName}</h2>
                                    <p style="color: #24caa1; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;">${user.role}</p>
                                    
                                    <div style="margin-top: 20px;">
                                      <c:choose>
			                            <c:when test="${user.active}">
			                                <div style="color: #22c55e; font-size: 0.9rem; font-weight: 600;">● Account Active</div>
			                            </c:when>
			                            <c:otherwise>
			                                <div style="color: #ef4444; font-size: 0.9rem; font-weight: 600;">● Account Inactive</div>
			                            </c:otherwise>
			                        </c:choose>
                                    </div>
                                </div>

                                <%-- Right Section: Data Grid --%>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div style="padding-left: 20px;">
                                        <h3 style="color: #fff; margin-bottom: 25px; border-bottom: 1px solid #2b354a; padding-bottom: 10px;">General Information</h3>
                                        
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <p class="profile-info-label">User ID</p>
                                                <p class="profile-info-value">#${user.userId}</p>
                                                
                                                <p class="profile-info-label">Email Address</p>
                                                <p class="profile-info-value" style="color: #38bdf8;">${user.email}</p>
                                                
                                                <p class="profile-info-label">Contact Number</p>
                                                <p class="profile-info-value">${user.contactNum}</p>
                                                
                                                <p class="profile-info-label">Member Since</p>
                                                <p class="profile-info-value">${user.createAtDate}</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <p class="profile-info-label">Gender / YOB</p>
                                                <p class="profile-info-value">${user.gender} (${user.birthYear})</p>
                                                
                                                <p class="profile-info-label">Qualification</p>
                                                <p class="profile-info-value">${userDetail.qualification}</p>
                                                
                                                <p class="profile-info-label">Location</p>
                                                <p class="profile-info-value">${userDetail.city}, ${userDetail.state}</p>
                                                
                                                <p class="profile-info-label">Country</p>
                                                <p class="profile-info-value">${userDetail.country}</p>
                                            </div>
                                        </div>

                                        <div class="text-right" style="margin-top: 20px;">
                                            <button type="button" class="btn btn-ctl-bt waves-effect waves-light" 
                                                    onclick="location.href='edit-user?userId=${user.userId}'">
                                                <i class="fa fa-pencil"></i> Edit User Data
                                            </button>
                                        </div>
                                    </div>
                                </div>
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