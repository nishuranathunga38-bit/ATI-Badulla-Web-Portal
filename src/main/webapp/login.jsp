<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Gateway - ATI Badulla</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background: #03045e; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .login-card { background: white; border-radius: 16px; padding: 40px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); width: 100%; max-width: 400px; }
    </style>
</head>
<body>

    <div class="login-card text-center">
        <a href="index.jsp" class="text-decoration-none text-dark d-inline-block mb-3">
            <i class="fa-solid fa-user-shield fa-3x text-primary"></i>
        </a>
        <h4 class="fw-bold text-dark mb-1">Admin Central Gate</h4>
        <p class="text-muted small mb-4">Authorized administrative personnel access only</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger py-2 small"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="LoginServlet" method="POST">
            <div class="mb-3 text-start">
                <label class="form-label small fw-bold">Admin Identifier</label>
                <input type="text" class="form-control" name="username" placeholder="Enter admin user" required>
            </div>
            <div class="mb-4 text-start">
                <label class="form-label small fw-bold">Security Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 rounded-pill fw-bold">Authenticate Gate</button>
        </form>
        <div class="mt-4"><a href="index.jsp" class="small text-decoration-none"><i class="fa-solid fa-arrow-left-long me-2"></i>Back to Live Portal</a></div>
    </div>

</body>
</html>