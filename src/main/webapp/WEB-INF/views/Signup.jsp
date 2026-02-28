<style>
    /* 1. Integration with your Auth CSS */
    .signup-wrapper {
        background: #152036; /* Matching your style.css body */
        padding: 20px;
        border-radius: 12px;
    }

    .signup-card-custom {
        background: #1e293b; /* From your auth.css .auth-card */
        padding: 2.5rem;
        border-radius: 12px;
        border: 1px solid #334155;
        box-shadow: 0 10px 25px rgba(0,0,0,0.3);
    }

    .signup-card-custom h3 {
        color: #38bdf8; /* Your CodeVerse light blue accent */
        margin-bottom: 25px;
        font-size: 22px;
        border-bottom: 1px solid #334155;
        padding-bottom: 15px;
    }

    /* 2. Alignment & Form Group Precision */
    .form-group-signup {
        margin-bottom: 1.5rem;
    }

    .form-group-signup label {
        display: block;
        margin-bottom: 0.8rem;
        font-size: 0.85rem;
        color: #cbd5e1;
        font-weight: 500;
    }

    /* Standardizing Inputs with your auth.css */
    .form-group-signup input, 
    .form-group-signup select {
        width: 100%;
        padding: 0.75rem;
        border-radius: 6px;
        border: 1px solid #334155;
        background: #0f172a;
        color: white;
        height: auto !important; /* Overriding style.css 40px */
    }

    .form-group-signup input:focus {
        border-color: #38bdf8;
        outline: none;
    }

    /* 3. Column Separator */
    @media (min-width: 992px) {
        .col-left {
            border-right: 1px solid #334155;
            padding-right: 30px;
        }
        .col-right {
            padding-left: 30px;
        }
    }

    /* 4. Button - Matching .btn-auth */
    .btn-signup-action {
        width: 100%;
        max-width: 300px;
        padding: 1rem;
        background: #38bdf8;
        border: none;
        border-radius: 6px;
        color: #0f172a;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 2rem;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .btn-signup-action:hover {
        background: #0ea5e9;
        transform: translateY(-2px);
    }
</style>

<div class="product-tab-list tab-pane fade active in" id="registration">
    <div class="signup-wrapper">
        <div class="signup-card-custom">
            <form action="/stored" method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-left">
                        <h3><i class="icon nalika-user"></i> Personal Profile</h3>
                        
                        <div class="form-group-signup">
                            <label>First Name</label>
                            <input type="text" name="firstName" placeholder="Enter your first name" required>
                        </div>
                        
                        <div class="form-group-signup">
                            <label>Last Name</label>
                            <input type="text" name="LastName" placeholder="Enter your last name" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-signup">
                                    <label>Gender</label>
                                    <select name="gender" required>
                                        <option value="" disabled selected>Select</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group-signup">
                                    <label>Birth Year</label>
                                    <input type="number" name="birthYear" placeholder="YYYY" min="1950" max="2026" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group-signup">
                            <label>Profile Picture</label>
                            <input type="file" name="profilePic" accept="image/*" style="padding: 5px;" required>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-right">
                        <h3><i class="fa fa-shield"></i> Account & Location</h3>
                        
                        <div class="form-group-signup">
                            <label>Email Address</label>
                            <input type="email" name="email" placeholder="email@example.com" required>
                        </div>

                        <div class="form-group-signup">
                            <label>Password</label>
                            <input type="password" name="password" placeholder="Create a strong password" required>
                        </div>

                        <div class="form-group-signup">
                            <label>Contact Number</label>
                            <input type="text" name="contactNum" placeholder="+91 XXXXX XXXXX" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group-signup">
                                    <label>City</label>
                                    <input type="text" name="city" placeholder="City" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group-signup">
                                    <label>State</label>
                                    <input type="text" name="state" placeholder="State" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <button type="submit" class="btn-signup-action">
                            Create My Account
                        </button>
                        <p style="color: #94a3b8; margin-top: 20px;">
                            Already have an account? <a href="Login" style="color: #38bdf8; font-weight: bold;">Sign In</a>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>