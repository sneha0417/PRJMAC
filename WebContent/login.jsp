<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INK IT Business Solutions | ERP Login</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* CSS Variables */
        :root {
            --primary: #2563EB;
            --secondary: #14B8A6;
            --white: #FFFFFF;
            --light-gray: #F8FAFC;
            --border-color: #E2E8F0;
            --text-dark: #0F172A;
            --text-muted: #64748B;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.1);
            --shadow-lg: 0 20px 40px -10px rgba(0,0,0,0.08);
            --font-family: 'Inter', sans-serif;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: var(--font-family);
            background: linear-gradient(135deg, var(--white) 0%, #E0E7FF 100%);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            overflow-x: hidden;
        }

        /* Layout */
        .erp-container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        /* Left Panel - Branding & Info */
        .left-panel {
            flex: 1.2;
            background-color: var(--white);
            padding: 4rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
            border-right: 1px solid rgba(37, 99, 235, 0.1);
        }

        /* Subtle Background Shapes */
        .bg-shape-1 {
            position: absolute;
            top: -10%; left: -10%;
            width: 500px; height: 500px;
            background: radial-gradient(circle, rgba(37,99,235,0.05) 0%, rgba(255,255,255,0) 70%);
            border-radius: 50%;
            pointer-events: none;
        }
        .bg-shape-2 {
            position: absolute;
            bottom: -20%; right: -10%;
            width: 600px; height: 600px;
            background: radial-gradient(circle, rgba(20,184,166,0.05) 0%, rgba(255,255,255,0) 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .brand-header {
            position: relative;
            z-index: 10;
        }

        .company-logo-text {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 2rem;
        }

        .company-logo-text img {
            height: 60px; /* Sized to match the original blue stack icon */
            width: auto;
        }
        

        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .hero-title span {
            color: var(--primary);
        }

        .hero-subtitle {
            font-size: 1.125rem;
            color: var(--text-muted);
            max-width: 80%;
            margin-bottom: 3rem;
            line-height: 1.6;
        }

        /* Feature List */
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 4rem;
            position: relative;
            z-index: 10;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            background: var(--light-gray);
            padding: 1rem 1.5rem;
            border-radius: 16px;
            border: 1px solid var(--border-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .feature-item:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-sm);
            border-color: rgba(37, 99, 235, 0.3);
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .icon-blue { background: rgba(37, 99, 235, 0.1); color: var(--primary); }
        .icon-teal { background: rgba(20, 184, 166, 0.1); color: var(--secondary); }
        
        .feature-text {
            font-weight: 600;
            color: var(--text-dark);
            font-size: 0.95rem;
        }

        /* Statistics */
        .stats-container {
            display: flex;
            gap: 2rem;
            position: relative;
            z-index: 10;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
        }

        .stat-value {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.25rem;
        }

        .stat-label {
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Right Panel - Login Card */
        .right-panel {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
        }

        .login-card {
            background: var(--white);
            width: 100%;
            max-width: 460px;
            border-radius: 24px;
            padding: 3.5rem 3rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid rgba(255,255,255,0.5);
        }

        .login-header {
            margin-bottom: 2.5rem;
        }

        .login-header h2 {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .form-control {
            width: 100%;
            height: 52px;
            background: var(--light-gray);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 0 1rem;
            font-family: var(--font-family);
            font-size: 1rem;
            color: var(--text-dark);
            transition: all 0.2s ease;
        }

        select.form-control {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%2364748B' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1em;
        }

        .form-control:focus {
            outline: none;
            background: var(--white);
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .password-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .password-header .form-label {
            margin-bottom: 0;
        }

        .forgot-link {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--primary);
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .forgot-link:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }

        .btn-submit {
            width: 100%;
            height: 52px;
            background: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .btn-submit:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.3);
        }

        /* Footer */
        .footer {
            position: absolute;
            bottom: 2rem;
            width: 100%;
            text-align: center;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .left-panel { padding: 3rem; }
            .hero-title { font-size: 2.5rem; }
            .feature-grid { grid-template-columns: 1fr; }
        }

        @media (max-width: 768px) {
            .erp-container { flex-direction: column; }
            .left-panel { display: none; } /* Focus on login for mobile */
            .right-panel { padding: 1.5rem; }
            .login-card { padding: 2.5rem 2rem; }
        }
    </style>
</head>
<body onload="getComp();">

    <div class="erp-container">
        
        <div class="left-panel">
            <div class="bg-shape-1"></div>
            <div class="bg-shape-2"></div>
            
            <div class="brand-header">
                <div class="company-logo-text">
                    <img src="icons/ink_new_logo_2025.png" alt="INK IT Business Solutions">
                </div>
                <h1 class="hero-title">Intelligent ERP for<br><span>Modern Enterprises</span></h1>
                <p class="hero-subtitle">Experience a unified platform connecting your workforce, finances, and operations seamlessly.</p>
            </div>

            <div class="feature-grid">
                <div class="feature-item">
                    <div class="feature-icon icon-blue"><i class="fa-solid fa-truck-fast"></i></div>
                    <div class="feature-text">Fleet Management</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon icon-teal"><i class="fa-solid fa-chart-line"></i></div>
                    <div class="feature-text">Financial Reports</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon icon-teal"><i class="fa-solid fa-users-gear"></i></div>
                    <div class="feature-text">HR & Payroll</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon icon-blue"><i class="fa-solid fa-code-branch"></i></div>
                    <div class="feature-text">Approval Workflow</div>
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-item">
                    <span class="stat-value">33+</span>
                    <span class="stat-label">Modules</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">Multi</span>
                    <span class="stat-label">Branch</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">24/7</span>
                    <span class="stat-label">Support</span>
                </div>
            </div>
        </div>

        <div class="right-panel">
            <div class="login-card">
                <div class="login-header">
                    <h2>Sign In</h2>
                    <p>Enter your credentials to access your account</p>
                </div>

                <form method="post" action="login" autocomplete="off">
                    
                    <div class="form-group">
                        <label for="company" class="form-label">Company</label>
                        <select class="form-control" name="company" id="company" required></select>
                    </div>

                    <div class="form-group">
                        <label for="userid" class="form-label">Username</label>
                        <input type="text" id="userid" name="userid" class="form-control" required autofocus>
                    </div>

                    <div class="form-group">
                        <div class="password-header">
                            <label for="password" class="form-label">Password</label>
                            <a href="#" class="forgot-link">Forgot Password?</a>
                        </div>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>

                    <button type="submit" class="btn-submit">Sign In</button>
                </form>
            </div>

            <div class="footer">
                &copy; 2026 INK IT Business Solutions. All rights reserved.
            </div>
        </div>

    </div>

    <script>
        // Exact function requested to pull company/database names directly from the backend.
        // No values are hardcoded. It expects the endpoint to return data.
        function getComp() {
            var x = new XMLHttpRequest();
            x.onreadystatechange = function() {
                if (x.readyState == 4 && x.status == 200) {
                    var items = x.responseText;
                    // Standard parsing mechanism assuming a backend format like "CompA,CompB####ID1,ID2"
                    if (items.trim() !== "" && items.trim() !== "NOTGET") {
                        try {
                            items = items.split('####');
                            var cmpItems = items[0].split(",");
                            var cmpIdItems = items[1].split(",");
                            var optionscmp = '<option value="" disabled selected>Select Company</option>';
                            for (var i = 0; i < cmpItems.length; i++) {
                                optionscmp += '<option value="' + cmpIdItems[i] + '">' + cmpItems[i] + '</option>';
                            }
                            document.getElementById("company").innerHTML = optionscmp;
                        } catch(e) {
                            console.error("Error parsing backend data", e);
                        }
                    }
                }
            };
            // Calling the backend endpoint to populate the dropdown
            x.open("GET", "getCompany.jsp", true);
            x.send();
        }
    </script>
</body>
</html>