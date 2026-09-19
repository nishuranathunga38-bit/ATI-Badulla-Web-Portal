<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.atibadulla.util.DBConnection, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATI Badulla - Official Web Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f8f9fa; }
        .navbar { background-color: #03045e !important; padding: 15px 0; }
        .navbar-brand { font-weight: 700; letter-spacing: 1px; color: #fff !important; }
        .nav-link { color: #fff !important; font-weight: 600; margin: 0 10px; transition: 0.3s; }
        .nav-link:hover, .nav-link.active { color: #00b4d8 !important; }
        .btn-admin { background-color: #ffb703; color: #03045e !important; font-weight: 700; border-radius: 20px; padding: 8px 20px; border: none; }
        .btn-admin:hover { background-color: #e5a100; }
        
        /* Ticker Settings */
        .ticker-wrap { background: #0077b6; color: white; padding: 10px 0; overflow: hidden; font-weight: 600; }
        
        /* Advanced Carousel Customization */
        .carousel-item { height: 500px; min-height: 300px; background: no-repeat center center cover; }
        .carousel-image-1 { background-image: linear-gradient(rgba(3, 4, 94, 0.65), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1541339907198-e08756dedf3f?q=80&w=1920'); }
        .carousel-image-2 { background-image: linear-gradient(rgba(3, 4, 94, 0.65), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=1920'); }
        .carousel-image-3 { background-image: linear-gradient(rgba(3, 4, 94, 0.65), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1920'); }
        .carousel-caption { bottom: 35%; text-shadow: 0 4px 10px rgba(0,0,0,0.6); }
        .carousel-caption h1 { font-size: 3rem; font-weight: 700; }
        
        .notice-card { background: white; border-radius: 12px; border-left: 5px solid #03045e; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body>

    <!-- Top Header Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                <i class="fa-solid fa-user-graduate text-warning me-2 fs-3"></i> ATI BADULLA
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"></button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a></li>
                    <li class="nav-item"><a class="nav-link" href="results.jsp">Results</a></li>
                    <li class="nav-item ms-3"><a class="btn btn-admin shadow-sm" href="login.jsp"><i class="fa-solid fa-lock me-2"></i>Admin Panel</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Moving Announcement Ticker -->
    <div class="ticker-wrap shadow-sm">
        <div class="container">
            <marquee behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
                📢 Latest Update: 
                <%
                    try (Connection conn = DBConnection.getConnection();
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT title FROM notices ORDER BY id DESC LIMIT 3")) {
                         while(rs.next()) {
                             out.print(" | 🔥 " + rs.getString("title") + " ");
                         }
                    } catch(Exception e) { out.print("Welcome to ATI Badulla Web Portal."); }
                %>
            </marquee>
        </div>
    </div>

    <!-- 🌟 Beautiful Auto-play Image Carousel (Slider) Section 🌟 -->
    <div id="campusHeroCarousel" class="carousel slide carousel-fade shadow" data-bs-ride="carousel" data-bs-interval="4000">
        <!-- Indicators/Dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#campusHeroCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#campusHeroCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#campusHeroCarousel" data-bs-slide-to="2"></button>
        </div>

        <!-- The Slideshow Elements -->
        <div class="carousel-inner">
            <!-- Slide 1 -->
            <div class="carousel-item active carousel-image-1">
                <div class="carousel-caption d-none d-md-block animated fadeInUp">
                    <h1 class="display-4">Welcome to ATI Badulla</h1>
                    <p class="lead">Your gateway to top-tier Higher National Diplomas and technological innovation.</p>
                    <a href="courses.jsp" class="btn btn-warning rounded-pill text-dark fw-bold px-4 mt-2">Our Programmes</a>
                </div>
            </div>
            <!-- Slide 2 -->
            <div class="carousel-item carousel-image-2">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Excellence In Education</h1>
                    <p class="lead">Empowering Sri Lankan youth with industrial skills and highly recognized qualifications.</p>
                    <a href="about.jsp" class="btn btn-light rounded-pill text-primary fw-bold px-4 mt-2">Discover Our Legacy</a>
                </div>
            </div>
            <!-- Slide 3 -->
            <div class="carousel-item carousel-image-3">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Bright Future Awaits</h1>
                    <p class="lead">Step into a world of endless professional opportunities and modern campus facilities.</p>
                    <a href="results.jsp" class="btn btn-info rounded-pill text-white fw-bold px-4 mt-2"><i class="fa-solid fa-magnifying-glass me-2"></i>Check Results Portal</a>
                </div>
            </div>
        </div>

        <!-- Left and Right Slider Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#campusHeroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#campusHeroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Live Notice Board Section -->
    <div class="container my-5">
        <h3 class="fw-bold text-dark mb-4 text-center"><i class="fa-solid fa-bullhorn text-danger me-2"></i>Official Notice Board</h3>
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <%
                    try (Connection conn = DBConnection.getConnection();
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM notices ORDER BY id DESC")) {
                         boolean hasNotices = false;
                         while(rs.next()) {
                             hasNotices = true;
                             int p = rs.getInt("priority");
                             String badgeColor = (p == 3) ? "bg-danger" : (p == 2) ? "bg-warning text-dark" : "bg-info";
                             String borderStyle = (p == 3) ? "border-left: 5px solid red;" : "border-left: 5px solid #03045e;";
                %>
                <div class="card notice-card p-4 mb-3" style="<%= borderStyle %>">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold text-dark mb-1"><%= rs.getString("title") %></h5>
                        <span class="badge <%= badgeColor %> rounded-pill px-3 py-1">Notice</span>
                    </div>
                    <p class="text-secondary mt-2 mb-0"><%= rs.getString("content") %></p>
                </div>
                <% 
                         }
                         if(!hasNotices) {
                             out.print("<div class='text-center p-5 text-muted bg-white shadow-sm rounded-3'>No notices posted at the moment.</div>");
                         }
                    } catch(Exception e) {
                        out.print("<p class='text-danger'>Database connection error.</p>");
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Footer Area -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p class="mb-0 small">&copy; 2026 Advanced Technological Institute - Badulla. All Rights Reserved.</p>
        <small class="text-muted"><i class="fa-solid fa-users me-1 text-success"></i> Active Online Users: <%= application.getAttribute("activeUsers") != null ? application.getAttribute("activeUsers") : 1 %></small>
    </footer>

    <!-- Bootstrap 5 JavaScript Bundle for Carousel functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>