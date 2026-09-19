<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.atibadulla.util.DBConnection, java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Examination Results - ATI Badulla</title>
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
        .search-box { background: white; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); padding: 30px; }
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
                    <li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a></li>
                    <li class="nav-item"><a class="nav-link active" href="results.jsp">Results</a></li>
                    <li class="nav-item ms-3"><a class="btn btn-admin shadow-sm" href="login.jsp"><i class="fa-solid fa-lock me-2"></i>Admin Panel</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 text-center mb-4">
                <h2 class="fw-bold text-dark">Online Result Sheet</h2>
                <p class="text-muted">Enter your official student Index Number to fetch published Semester grades.</p>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="search-box mb-4">
                    <form action="results.jsp" method="GET">
                        <div class="input-group shadow-sm rounded-pill overflow-hidden">
                            <input type="text" class="form-control px-4 border-0" name="indexNo" placeholder="e.g. BAD/IT/2024/01" value="<%= request.getParameter("indexNo") != null ? request.getParameter("indexNo") : "" %>" required>
                            <button class="btn btn-primary px-4 fw-bold" type="submit"><i class="fa-solid fa-magnifying-glass me-2"></i>Check Grade</button>
                        </div>
                    </form>
                </div>

                <%
                    String indexNo = request.getParameter("indexNo");
                    if (indexNo != null && !indexNo.trim().isEmpty()) {
                %>
                <div class="card border-0 shadow-sm rounded-3 p-4 bg-white">
                    <h5 class="fw-bold text-dark mb-3"><i class="fa-solid fa-graduation-cap me-2 text-primary"></i>Statement of Results: <span class="text-primary"><%= indexNo.toUpperCase() %></span></h5>
                    <table class="table table-hover mt-3 align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Course</th>
                                <th>Subject Module</th>
                                <th class="text-center">Obtained Grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                boolean found = false;
                                try (Connection conn = DBConnection.getConnection();
                                     PreparedStatement ps = conn.prepareStatement("SELECT * FROM results WHERE student_id = ?")) {
                                     ps.setString(1, indexNo.trim());
                                     try (ResultSet rs = ps.executeQuery()) {
                                         while(rs.next()) {
                                             found = true;
                            %>
                            <tr>
                                <td><span class="badge bg-secondary"><%= rs.getString("course_code") %></span></td>
                                <td class="fw-semibold text-secondary"><%= rs.getString("subject") %></td>
                                <td class="text-center"><span class="fw-bold text-success"><%= rs.getString("grade") %></span></td>
                            </tr>
                            <%
                                         }
                                     }
                                } catch(Exception e) {
                                    out.print("<tr><td colspan='3' class='text-danger'>Error execution.</td></tr>");
                                }
                                if(!found) {
                                    out.print("<tr><td colspan='3' class='text-center text-muted py-4'>No exam registry records found for this student Index.</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <% } %>
            </div>
        </div>
    </div>

</body>
</html>