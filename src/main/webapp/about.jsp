<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - ATI Badulla</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f8f9fa; }
        .navbar { background-color: #03045e !important; padding: 15px 0; }
        .navbar-brand { font-weight: 700; color: #fff !important; }
        .nav-link { color: #fff !important; font-weight: 600; margin: 0 10px; }
        .nav-link:hover, .nav-link.active { color: #00b4d8 !important; }
        .btn-admin { background-color: #ffb703; color: #03045e !important; font-weight: 700; border-radius: 20px; padding: 8px 20px; border: none; }
        .hero-section { background: linear-gradient(135deg, #03045e, #0077b6); color: white; padding: 60px 0; text-align: center; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                <i class="fa-solid fa-user-graduate text-warning me-2 fs-3"></i> ATI BADULLA
            </a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a></li>
                    <li class="nav-item"><a class="nav-link" href="results.jsp">Results</a></li>
                    <li class="nav-item ms-3"><a class="btn btn-admin shadow-sm" href="login.jsp"><i class="fa-solid fa-lock me-2"></i>Admin Panel</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container">
            <h1 class="fw-bold">About Advanced Technological Institute, Badulla</h1>
            <p class="lead">Shaping the future of Sri Lankan professionals through state-of-the-art education.</p>
        </div>
    </div>

    <div class="container my-5">
        <div class="row align-items-center">
            <div class="col-md-7">
                <h3 class="fw-bold text-dark">Our Legacy and Mission</h3>
                <p class="text-muted mt-3">The Advanced Technological Institute (ATI) Badulla, operating under the prestigious Sri Lanka Institute of Advanced Technological Education (SLIATE), stands as a beacon of academic excellence in the Uva Province. We focus on delivering top-tier practical knowledge to high-achieving students.</p>
                <div class="row mt-4">
                    <div class="col-md-6 mb-3">
                        <div class="p-3 bg-white shadow-sm rounded-3 border-start border-primary border-4 h-100">
                            <h6 class="fw-bold text-primary"><i class="fa-solid fa-eye me-2"></i>Vision</h6>
                            <p class="small text-muted mb-0">To become the center of excellence in technological education in South Asia.</p>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="p-3 bg-white shadow-sm rounded-3 border-start border-success border-4 h-100">
                            <h6 class="fw-bold text-success"><i class="fa-solid fa-bullseye me-2"></i>Mission</h6>
                            <p class="small text-muted mb-0">Creating globally competitive professionals through industry-standard academic practices.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5 text-center d-none d-md-block">
                <i class="fa-solid fa-school-flag fa-10x text-secondary opacity-25"></i>
            </div>
        </div>
    </div>

</body>
</html>