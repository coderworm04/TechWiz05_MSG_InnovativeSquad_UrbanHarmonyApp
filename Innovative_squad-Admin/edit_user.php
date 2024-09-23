<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    // Redirect to the Signin page
    header("Location: index.php");
    exit();
}

// Include the database connection
include('db_connection.php');

// Function to generate color from string
function generateColorFromString($string)
{
    $hash = md5($string); // Generate a hash from the string
    $color = substr($hash, 0, 6); // Use the first 6 characters as a color
    return '#' . $color;
}

$bgColor = generateColorFromString($_SESSION['username']); // Generate color based on username
$firstLetter = strtoupper(substr($_SESSION['username'], 0, 1));

// Fetch the user details from the database for updating
if (isset($_GET['id'])) {
    $userId = $_GET['id'];

    try {
        // Prepare a SQL statement to fetch the user details
        $stmt = $pdo->prepare("SELECT * FROM tbl_admin WHERE id = :id");
        $stmt->bindParam(':id', $userId, PDO::PARAM_INT);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            $errorMessage = "User not found.";
        }
    } catch (PDOException $e) {
        $errorMessage = "Error fetching user data: " . $e->getMessage();
    }
}

// Update the user details when the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        // Check if a new password has been provided
        if (!empty($password)) {
            $passwordHash = password_hash($password, PASSWORD_BCRYPT); // Encrypt the password
            // Prepare a SQL statement to update the user details with the new password
            $stmt = $pdo->prepare("UPDATE tbl_admin SET name = :name, username = :username, email = :email, password = :password WHERE id = :id");
            $stmt->bindParam(':password', $passwordHash);
        } else {
            // Prepare a SQL statement to update the user details without changing the password
            $stmt = $pdo->prepare("UPDATE tbl_admin SET name = :name, username = :username, email = :email WHERE id = :id");
        }

        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':id', $userId, PDO::PARAM_INT);

        if ($stmt->execute()) {
            $successMessage = "User updated successfully.";
            header("location: user.php");
        } else {
            $errorMessage = "Failed to update user.";
        }
    } catch (PDOException $e) {
        $errorMessage = "Error updating user: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Update User</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
        <!-- Sidebar Start -->
        <div class="sidebar pb-3">
            <nav class="navbar bg-light navbar-light d-flex flex-column">
                <a href="dashboard.php" class="navbar-brand mx-4 mb-3">
                    <h5 class="text-success"><i class="fa fa-hashtag me-2"></i>ADVAULTMETRICS</h5>
                </a>
                <div class="d-flex align-items-center mb-4">
                    <div class="position-relative">
                        <div class="profile-placeholder d-flex justify-content-center align-items-center me-lg-2" style="background-color: <?php echo $bgColor; ?>; width: 50px; height: 50px;">
                            <span class="text-white"><?php echo $firstLetter; ?></span>
                        </div>
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1 me-2"></div>
                    </div>
                    <div class="">
                        <h6 class="mb-0 text-success text-capitalize fs-5"><?php echo $_SESSION['username']; ?></h6>
                        <span class="text-capitalize small"><?php echo $_SESSION['role']; ?></span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="dashboard.php" class="nav-item nav-link text-white fw-bold"><i class="fa fa-tachometer-alt text-light me-2"></i>Dashboard</a>
                    <?php
                    if ($_SESSION['role'] == "admin") {
                        echo "<a href='user.php' class='nav-item active nav-link text-success fw-bold'><i class='fa fa-user me-2'></i>Users</a>";
                    }
                    ?>
                </div>
                <!-- <div class="border border-white mx-auto" style="height: 400px; width: 200px;">

                </div> -->
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-success mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars text-success"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <?php

                        ?>


                        <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
                            <div class="profile-placeholder d-flex justify-content-center align-items-center me-lg-2" style="background-color: <?php echo $bgColor; ?>;">
                                <span class="text-white"><?php echo $firstLetter; ?></span>
                            </div>
                            <span class="d-none d-lg-inline-flex text-capitalize"><?php echo $_SESSION['username']; ?></span>
                        </a>


                        <div class="dropdown-menu dropdown-menu-end bg-light border-1 border-white rounded-0 rounded-bottom m-0">
                            <a href="logout.php" class="dropdown-item text-white">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- Update User Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 class="mx-auto text-white">Update User</h3>
                    </div>

                    <!-- Display success or error messages -->
                    <?php if (isset($successMessage)): ?>
                        <div class="alert alert-success text-center">
                            <?php echo $successMessage; ?>
                        </div>
                    <?php endif; ?>

                    <?php if (isset($errorMessage)): ?>
                        <div class="alert alert-danger text-center">
                            <?php echo $errorMessage; ?>
                        </div>
                    <?php endif; ?>

                    <form class="row g-3" method="POST" action="">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="<?php echo htmlspecialchars($user['name']); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="<?php echo htmlspecialchars($user['username']); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Leave blank to keep current password">
                        </div>
                        <div class="col-12">
                            <button class="btn btn-success" type="submit">Update User</button>
                        </div>
                    </form>

                </div>
            </div>
            <!-- Update User Form End -->
        </div>
        <!-- Content End -->
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