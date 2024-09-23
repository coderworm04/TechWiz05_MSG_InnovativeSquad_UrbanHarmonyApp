<?php
session_start();
require_once 'db_connection.php'; // Include the connection file
if(isset ($_SESSION['user_id'])){
    // Redirect to the dashboard or admin area
    header("Location: dashboard.php");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize email input
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];

    // Validate email and password are not empty
    if (!empty($email) && !empty($password)) {
        try {
            // Prepare SQL query to select the user with matching email
            $stmt = $pdo->prepare("SELECT id, username, password, role FROM tbl_admin WHERE email = :email");
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->execute();
            $user = $stmt->fetch();

            if ($user && password_verify($password, $user['password'])) {
                // Password is correct, create session variables
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['role'] = $user['role'];

                // Redirect to the dashboard or admin area
                header("Location: dashboard.php");
                exit();
            } else {
                // If the credentials are wrong
                $error_message = "Invalid email or password!";
            }
        } catch (PDOException $e) {
            error_log($e->getMessage(), 3, 'php_errors.log');
            $error_message = "An error occurred. Please try again later.";
        }
    } else {
        $error_message = "Please fill out both fields.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Sign In - Advaultmetrics</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sign In Start -->
        <div class="container-fluid d-flex p-0">
            <div class="w-50 bg-dark d-flex flex-column justify-content-center align-items-center">
                <img src="img/logo.png" class="w-50" alt="">
                <h1 class="text-warning">Urban Harmony</h1>
            </div>
            <div class="row h-100 w-50 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-10 col-md-8">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <!-- Display error message if exists -->
                        <?php if (isset($error_message)): ?>
                            <div class="alert alert-danger"><?php echo htmlspecialchars($error_message); ?></div>
                        <?php endif; ?>

                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <h3 class="text-warning">SIGN IN</h3>
                        </div>

                        <!-- Sign In Form -->
                        <form method="POST" action="index.php">
                            <div class="mb-3">
                                <label for="floatingInput">Email address</label>
                                <input type="email" class="form-control text-success" id="floatingInput" placeholder="name@example.com" name="email" required>
                            </div>
                            <div class="mb-4">
                                <label for="floatingPassword">Password</label>
                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-warning py-3 w-100 mb-4">Sign In</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
