<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Register User | CodeVerse Admin</title>
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
                                                <h2>User Registration</h2>
                                                <p>Create a new account for the <span class="bread-ntd">CodeVerse Platform</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
                                            <button data-toggle="tooltip" title="Download User Guide" class="btn"><i class="icon nalika-download"></i></button>
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
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#registration"><i class="icon nalika-edit" aria-hidden="true"></i> Account Details</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="registration">
                                        <form action="stored" method="POST">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="review-content-section">
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                            <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="icon nalika-mail" aria-hidden="true"></i></span>
                                                            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
                                                            <input type="text" name="contactNum" class="form-control" placeholder="Contact Number" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
                                                            <input type="text" name="qualification" class="form-control" placeholder="Qualification (e.g. B.Tech)" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                                                        </div>
                                                        <select name="userTypeId" class="form-control pro-edt-select form-control-primary" required>
                                                            <option value="-1">---Select User Role---</option>
                                                            <c:forEach items="${allUserType}" var="ut">
                                                                <option value="${ut.userTypeId}">${ut.userType}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="review-content-section">
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="icon nalika-user" aria-hidden="true"></i></span>
                                                            <input type="text" name="LastName" class="form-control" placeholder="Last Name" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                            <input type="number" name="birthYear" class="form-control" placeholder="Birth Year (YYYY)" min="1900" max="2026" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                                                            <select name="gender" class="form-control pro-edt-select form-control-primary" style="background-color: #152036; color: #fff; border: none;" required>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                            </select>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i></span>
                                                            <input type="text" name="city" class="form-control" placeholder="City" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-map" aria-hidden="true"></i></span>
                                                            <input type="text" name="state" class="form-control" placeholder="State/Province" required>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-globe" aria-hidden="true"></i></span>
                                                            <input type="text" name="country" class="form-control" placeholder="Country" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="text-center custom-pro-edt-ds">
                                                        <button type="submit" class="btn btn-ctl-bt waves-effect waves-light m-r-10">Create Account</button>
                                                        <button type="reset" class="btn btn-ctl-bt waves-effect waves-light">Discard</button>
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