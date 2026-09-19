<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATI Badulla - Admin Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f4f6f9; }
        .sidebar { background-color: #03045e; min-height: 100vh; color: white; }
        .sidebar .nav-link { color: #caf0f8; font-weight: 500; margin-bottom: 10px; border-radius: 8px; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background: rgba(255,255,255,0.1); color: #fff; }
        .card-custom { border-radius: 15px; border: none; background: white; box-shadow: 0 4px 12px rgba(0,0,0,0.05); padding: 25px; margin-bottom: 25px; }
    </style>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar Navigation panel -->
            <div class="col-md-3 col-lg-2 sidebar p-3 d-flex flex-column justify-content-between">
                <div>
                    <div class="text-center my-3">
                        <i class="fa-solid fa-user-shield fa-2x text-warning mb-2"></i>
                        <h6 class="fw-bold m-0"><%= session.getAttribute("adminUser") %></h6>
                        <span class="badge bg-success mt-1">Console Active</span>
                    </div>
                    <hr>
                    <ul class="nav flex-column">
                        <li class="nav-item"><a class="nav-link active" href="admin_dashboard.jsp"><i class="fa-solid fa-sliders me-2"></i>Management</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp" target="_blank"><i class="fa-solid fa-globe me-2"></i>Live Site View</a></li>
                    </ul>
                </div>
                <div>
                    <hr>
                    <a href="LogoutServlet" class="btn btn-danger btn-sm w-100 rounded-pill"><i class="fa-solid fa-power-off me-2"></i>Secure Log-out</a>
                </div>
            </div>

            <!-- Main Content Area -->
            <div class="col-md-9 col-lg-10 p-4">
                <h2 class="fw-bold text-dark mb-4">ATI Badulla - Control Center</h2>
                
                <% if(request.getAttribute("message") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fa-solid fa-check-circle me-2"></i><%= request.getAttribute("message") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <div class="row">
                    <!-- Section 1: Post Notice -->
                    <div class="col-md-6">
                        <div class="card card-custom">
                            <h5 class="fw-bold text-primary mb-3"><i class="fa-solid fa-bullhorn me-2"></i>Publish New Notice</h5>
                            <form action="AddNoticeServlet" method="POST">
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Notice Header Title</label>
                                    <input type="text" class="form-control" name="title" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Content Narrative</label>
                                    <textarea class="form-control" name="content" rows="2" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Priority Target Level</label>
                                    <select class="form-select" name="priority">
                                        <option value="1">Normal Alert</option>
                                        <option value="2">High Priority</option>
                                        <option value="3">Urgent Announcement</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 btn-sm rounded-pill">Publish Board Notice</button>
                            </form>
                        </div>
                    </div>

                    <!-- Section 2: Manage HND Courses -->
                    <div class="col-md-6">
                        <div class="card card-custom">
                            <h5 class="fw-bold text-success mb-3"><i class="fa-solid fa-graduation-cap me-2"></i>Add New Course Profile</h5>
                            <form action="AddCourseServlet" method="POST">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label small fw-bold">Course Code</label>
                                        <input type="text" class="form-control" name="course_code" placeholder="HNDIT" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label small fw-bold">Duration Tag</label>
                                        <input type="text" class="form-control" name="duration" placeholder="2.5 Years" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Full Program Name</label>
                                    <input type="text" class="form-control" name="course_name" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Description Brief</label>
                                    <textarea class="form-control" name="description" rows="1" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-success w-100 btn-sm rounded-pill">Inject Course Records</button>
                            </form>
                        </div>
                    </div>

                    <!-- Section 3: Manage Grading Results -->
                    <div class="col-md-6">
                        <div class="card card-custom">
                            <h5 class="fw-bold text-warning mb-3"><i class="fa-solid fa-square-poll-vertical me-2 text-white"></i>Publish Examination Results</h5>
                            <form action="AddResultServlet" method="POST">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label small fw-bold">Student Index Registry</label>
                                        <input type="text" class="form-control" name="student_id" placeholder="BAD/IT/2024/01" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label small fw-bold">Target Course Code</label>
                                        <input type="text" class="form-control" name="course_code" placeholder="HNDIT" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Subject Module Scope</label>
                                    <input type="text" class="form-control" name="subject" placeholder="Enterprise Architecture" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label small fw-bold">Obtained Grade</label>
                                    <select class="form-select" name="grade">
                                        <option value="A">Grade A</option>
                                        <option value="B">Grade B</option>
                                        <option value="C">Grade C</option>
                                        <option value="S">Grade S</option>
                                        <option value="F">Grade F</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-warning w-100 btn-sm text-white rounded-pill">Authorize Grade Publication</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>