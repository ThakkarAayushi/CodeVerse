<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Reset Password | CodeVerse Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nalika-icon.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>

<body>
    <div class="color-line"></div>
    <div class="container-fluid" style="margin-top: 50px;">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-4 col-md-4 col-sm-4 col-xs-12">
                <div class="text-center m-b-md custom-login">
                    <h3 style="color: #fff;">RESET YOUR PASSWORD</h3>
                    <p style="color: #94a3b8;">Verify your identity and set a new password.</p>
                </div>
                <div class="hpanel">
                    <div class="panel-body">
                        <form action="update-password" method="POST" id="resetPasswordForm">
                            
                            <div class="form-group">
                                <label class="control-label" style="color: #fff;">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon nalika-mail" aria-hidden="true"></i></span>
                                    <input type="email" name="email" class="form-control" placeholder="example@gmail.com" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label" style="color: #fff;">OTP Verification</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-shield" aria-hidden="true"></i></span>
                                    <input type="text" name="otp" class="form-control" placeholder="Enter 6-digit OTP" required maxlength="6">
                                </div>
                                <span class="help-block small" style="color: #94a3b8;">Check your email for the code.</span>
                            </div>

                            <div class="form-group">
                                <label class="control-label" style="color: #fff;">New Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <input type="password" name="newPassword" class="form-control" placeholder="Minimum 8 characters" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label" style="color: #fff;">Confirm New Password</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
                                    <input type="password" name="confirmPassword" class="form-control" placeholder="Re-enter password" required>
                                </div>
                            </div>

                            <div style="margin-top: 25px;">
                                <button type="submit" class="btn btn-success btn-block loginbtn">Update Password</button>
                                <a href="login" class="btn btn-default btn-block" style="margin-top: 10px;">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="text-center" style="margin-top: 20px;">
                    <p style="color: #94a3b8;">&copy; 2026 CodeVerse Platform</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
        </div>
    </div>
</body>
</html>