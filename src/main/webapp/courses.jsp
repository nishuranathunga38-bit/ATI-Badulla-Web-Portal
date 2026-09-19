<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.atibadulla.util.DBConnection, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Courses - ATI Badulla</title>
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
        .course-card { background: white; border: none; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); transition: 0.3s; }
        .course-card:hover { transform: translateY(-5px); }
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
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link active" href="courses.jsp">Courses</a></li>
                    <li class="nav-item"><a class="nav-link" href="results.jsp">Results</a></li>
                    <li class="nav-item ms-3"><a class="btn btn-admin shadow-sm" href="login.jsp"><i class="fa-solid fa-lock me-2"></i>Admin Panel</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h2 class="fw-bold text-dark text-center mb-2">Our Higher National Diplomas (HND)</h2>
        <p class="text-muted text-center mb-5">Explore modern paths engineered for high corporate and tech employment.</p>

        <div class="row">
            <%
                try (Connection conn = DBConnection.getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM courses")) {
                     while(rs.next()) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card course-card p-4 h-100 d-flex flex-column justify-content-between">
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="badge bg-primary px-3 py-2 rounded-pill"><%= rs.getString("course_code") %></span>
                            <small class="text-muted fw-bold"><i class="fa-regular fa-clock me-1"></i><%= rs.getString("duration") %></small>
                        </div>
                        <h5 class="fw-bold text-dark mb-3"><%= rs.getString("course_name") %></h5>
                        <p class="text-muted small"><%= rs.getString("description") %></p>
                    </div>
                    <div>
                        <hr>
                        <button class="btn btn-outline-primary btn-sm rounded-pill w-100">View Module Specifications</button>
                    </div>
                </div>
            </div>
            <% 
                     }
                } catch(Exception e) {
                    out.print("<div class='text-danger'>Error loading courses setup.</div>");
                }
            %>
        </div>
    </div>

</body>
</html>