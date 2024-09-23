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

// Check if a delete request has been made
if (isset($_GET['delete']) && $_SESSION['role'] == 'admin') {
    $userId = $_GET['delete'];

    try {
        // Prepare a SQL statement to delete the user from the database
        $stmt = $pdo->prepare("DELETE FROM tbl_admin WHERE id = :id");
        $stmt->bindParam(':id', $userId, PDO::PARAM_INT);

        // Execute the SQL statement
        if ($stmt->execute()) {
            $successMessage = "User deleted successfully.";
        } else {
            $errorMessage = "Failed to delete user.";
        }
    } catch (PDOException $e) {
        $errorMessage = "An error occurred while deleting the user.";
    }
}

$bgColor = generateColorFromString($_SESSION['username']); // Generate color based on username
$firstLetter = strtoupper(substr($_SESSION['username'], 0, 1));
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>User</title>
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
<body>
<?php if (isset($successMessage) || isset($errorMessage)): ?>
    <div class="alert <?php echo isset($successMessage) ? 'alert-success' : 'alert-danger'; ?> text-center" id="alertMessage">
        <?php echo isset($successMessage) ? $successMessage : $errorMessage; ?>
    </div>
<?php endif; ?>

<script>
    // Function to hide the alert message after 2 seconds
    setTimeout(function() {
        var alertElement = document.getElementById('alertMessage');
        if (alertElement) {
            alertElement.style.display = 'none';
        }
    }, 2000); // 2000 milliseconds = 2 seconds
</script>


    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pb-3">
            <nav class="navbar bg-light navbar-light d-flex flex-column">
                <a href="dashboard.php" class="navbar-brand mx-4 mb-3">
                    <h5 class="text-warning text-uppercase"><i class="fa fa-hashtag me-2"></i>Urban Harmony</h5>
                </a>
                <div class="d-flex align-items-center mb-4">
                    <div class="position-relative">
                        <div class="profile-placeholder d-flex justify-content-center align-items-center me-lg-2" style="background-color: <?php echo $bgColor; ?>; width: 50px; height: 50px;">
                            <span class="text-white"><?php echo $firstLetter; ?></span>
                        </div>
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1 me-2"></div>
                    </div>
                    <div class="">
                        <h6 class="mb-0 text-success text-capitalize fs-5 text-warning"><?php echo $_SESSION['username']; ?></h6>
                        <span class="text-capitalize small"><?php echo $_SESSION['role']; ?></span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="dashboard.php" class="nav-item nav-link text-white fw-bold"><i class="fa fa-tachometer-alt me-2 text-light"></i>Dashboard</a>
                    <?php
                    if ($_SESSION['role'] == "admin") {
                        echo "
                        <a href='user.php' class='nav-item nav-link text-white fw-bold'><i class='fa fa-user text-light me-2'></i>Users</a>
                        <a href='designer.php' class='nav-item nav-link active text-warning fw-bold'><i class='fa fa-user text-warning me-2'></i>Designer</a>
                        <a href='website.php' class='nav-item nav-link text-white fw-bold'><i class='fa fa-globe text-light me-2'></i>User's Website</a>
                        ";
                    }
                    ?>
                </div>
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
                    <i class="fa fa-bars text-warning"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
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

            <!-- Users List Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0 text-white">All Users</h6>
                        <?php if ($_SESSION['role'] == "admin") {
                            echo "<a href='add_designer.php' class='btn btn-success'>Add+</a>";
                        } ?>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-warning">User ID</th>
                                    <th scope="col" class="text-warning">Name</th>
                                    <th scope="col" class="text-warning">Username</th>
                                    <th scope="col" class="text-warning">Email</th>
                                    <th scope="col" class="text-warning">Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                try {
                                    // Fetch users from the database
                                    $stmt = $pdo->query("SELECT id, name, username, email, role FROM tbl_admin");

                                    while ($user = $stmt->fetch()) {
                                        echo "<tr>";
                                        echo "<td>" . $user['id'] . "</td>";
                                        echo "<td>" . htmlspecialchars($user['name']) . "</td>";
                                        echo "<td>" . htmlspecialchars($user['username']) . "</td>";
                                        echo "<td>" . htmlspecialchars($user['email']) . "</td>";
                                        echo "<td>
                                                <a class='btn btn-sm btn-warning me-2' href='edit_user.php?id=" . $user['id'] . "'>Edit</a>";
                                        if(htmlspecialchars($user['role']) != "admin"){
                                            echo "<a class='btn btn-sm btn-danger' href='user.php?delete=" . $user['id'] . "' onclick=\"return confirm('Are you sure you want to delete this user?');\">Delete</a>";
                                        }
                                        echo"</td>";
                                        echo "</tr>";
                                    }
                                } catch (PDOException $e) {
                                    echo "Error: " . $e->getMessage();
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Users List End -->

            <!-- Footer Start -->
            <!-- (Optional Footer Code) -->
            <!-- Footer End -->
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
