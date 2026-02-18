<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>User Management | CodeVerse</title>
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
        .user-name { color: #fff; font-weight: 600; }
        .user-email { color: #38bdf8; font-size: 13px; }
        .profile-img-small { 
            width: 35px; 
            height: 35px; 
            border-radius: 50%; 
            object-fit: cover;
            border: 1px solid #30363d;
        }
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
                                            <i class="icon nalika-user"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Platform User Directory</h2>
                                            <p>Manage community members and access levels</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="breadcomb-report">
                                        <button data-toggle="tooltip" title="Export CSV" class="btn"><i class="icon nalika-download"></i></button>
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
                            <h4>Users List</h4>
                            <!--div class="add-product">
                                <a href="register">Register User</a>
                            </div-->
                            <table>
                                <thead>
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Email / Role</th>
                                        <th>Gender / YOB</th>
                                        <th>Status</th>
                                        <th>Setting</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${userList}" varStatus="s">
                                        <tr>
                                            <td>${s.count}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty user.profilePicURL}">
                                                        <img src="${user.profilePicURL}" class="profile-img-small" alt="Profile" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="img/contact/1.jpg" class="profile-img-small" alt="Default" />
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <span class="user-name">${user.firstName} ${user.lastName}</span>
                                            </td>
                                            <td>
                                                <div class="user-email">${user.email}</div>
                                                <small style="color: #94a3b8; text-transform: uppercase;">${user.role}</small>
                                            </td>
                                            <td>
                                                <div style="color: #fff;">${user.gender}</div>
                                                <small style="color: #94a3b8;">Born: ${user.birthYear}</small>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.active}">
                                                        <button class="pd-setting">Active</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="ds-setting">Disabled</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button data-toggle="tooltip" title="View" class="pd-setting-ed" 
                                                        onclick="location.href='viewUser?userId=${user.userId}'" style="background: #24caa1;">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </button>
                                                <button data-toggle="tooltip" title="Edit" class="pd-setting-ed" 
                                                        onclick="location.href='edit-user?userId=${user.userId}'">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                                <button data-toggle="tooltip" title="Trash" class="pd-setting-ed" 
                                                        onclick="if(confirm('Remove this user?')) location.href='deleteUser?userId=${user.userId}'">
                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty userList}">
                                        <tr>
                                            <td colspan="7" style="text-align: center; padding: 60px; color: #94a3b8;">
                                                No users currently registered.
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