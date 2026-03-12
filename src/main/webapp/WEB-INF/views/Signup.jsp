<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | CodeVerse</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .register-container {
            width: 100%;
            max-width: 900px;
        }

        .register-card {
            background: white;
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.1);
            border: 1px solid #edf2f7;
        }

        .register-card h2 {
            font-size: 2rem;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .register-card > p {
            color: #64748b;
            margin-bottom: 30px;
            font-size: 0.95rem;
        }

        .section-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .section-title i {
            color: #3b82f6;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .input-group {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            transition: 0.2s;
        }
        .input-group:focus-within {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
        }

        .input-group-icon {
            padding: 0 15px;
            color: #3b82f6;
            font-size: 1.1rem;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 14px 15px 14px 0;
            border: none;
            outline: none;
            font-size: 1rem;
            color: #1e293b;
            background: transparent;
        }
        .input-group select {
            padding-right: 35px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%233b82f6' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><polyline points='6 9 12 15 18 9'/></svg>") no-repeat right 15px center;
            background-size: 16px;
        }
        .input-group input[type="file"] {
            padding: 10px 15px 10px 0;
        }
        .input-group input::placeholder {
            color: #94a3b8;
        }

        .inline-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .btn-register {
            width: 100%;
            max-width: 300px;
            padding: 14px;
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            border: none;
            border-radius: 50px;
            color: white;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 4px 10px rgba(59,130,246,0.3);
            margin: 30px auto 0;
            display: block;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59,130,246,0.4);
        }

        .auth-footer {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
            font-size: 0.9rem;
        }
        .auth-footer a {
            color: #3b82f6;
            font-weight: 600;
            text-decoration: none;
            margin-left: 5px;
        }
        .auth-footer a:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
            .register-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-card">
            <h2>Create Account</h2>
            <p>Join the CodeVerse community and start your hackathon journey.</p>

            <form action="/stored" method="POST" enctype="multipart/form-data">
                <!-- Two‑column layout -->
                <div class="form-row">
                    <!-- Left column: Personal Profile -->
                    <div>
                        <div class="section-title">
                            <i class="fas fa-user-circle"></i> Personal Profile
                        </div>

                        <div class="form-group">
                            <label>First Name</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-user"></i></span>
                                <input type="text" name="firstName" placeholder="Enter your first name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Last Name</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-user"></i></span>
                                <input type="text" name="LastName" placeholder="Enter your last name" required>
                            </div>
                        </div>

                        <div class="inline-group">
                            <div class="form-group">
                                <label>Gender</label>
                                <div class="input-group">
                                    <span class="input-group-icon"><i class="fas fa-venus-mars"></i></span>
                                    <select name="gender" required>
                                        <option value="" disabled selected>Select</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Birth Year</label>
                                <div class="input-group">
                                    <span class="input-group-icon"><i class="fas fa-calendar"></i></span>
                                    <input type="number" name="birthYear" placeholder="YYYY" min="1950" max="2026" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Profile Picture</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-image"></i></span>
                                <input type="file" name="profilePic" accept="image/*" required>
                            </div>
                        </div>
                    </div>

                    <!-- Right column: Account & Location -->
                    <div>
                        <div class="section-title">
                            <i class="fas fa-lock"></i> Account & Location
                        </div>

                        <div class="form-group">
                            <label>Email Address</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-envelope"></i></span>
                                <input type="email" name="email" placeholder="email@example.com" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-lock"></i></span>
                                <input type="password" name="password" placeholder="Create a strong password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Contact Number</label>
                            <div class="input-group">
                                <span class="input-group-icon"><i class="fas fa-phone"></i></span>
                                <input type="text" name="contactNum" placeholder="+91 XXXXX XXXXX" required>
                            </div>
                        </div>

                        <div class="inline-group">
                            <div class="form-group">
                                <label>City</label>
                                <div class="input-group">
                                    <span class="input-group-icon"><i class="fas fa-city"></i></span>
                                    <input type="text" name="city" placeholder="City" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>State</label>
                                <div class="input-group">
                                    <span class="input-group-icon"><i class="fas fa-map-pin"></i></span>
                                    <input type="text" name="state" placeholder="State" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-register">
                    <i class="fas fa-user-plus"></i> Create My Account
                </button>
                <p class="auth-footer">
                    Already have an account? <a href="login">Login</a>
                </p>
            </form>
        </div>
    </div>
</body>
</html>