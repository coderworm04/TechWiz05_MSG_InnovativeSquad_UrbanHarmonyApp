<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    // Redirect to the Signin page
    header("Location: index.php");
    exit();
}

function generateColorFromString($string)
{
    $hash = md5($string); // Generate a hash from the string
    $color = substr($hash, 0, 6); // Use the first 6 characters as a color
    return '#' . $color;
}

$bgColor = generateColorFromString($_SESSION['username']); // Generate color based on username
$firstLetter = strtoupper(substr($_SESSION['username'], 0, 1));

// Include the database connection
include('db_connection.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Adoradvertise - Dashboard</title>
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

    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative bg-white d-flex p-0">
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
                    <a href="dashboard.php" class="nav-item nav-link active text-success fw-bold"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <?php
                    if ($_SESSION['role'] == "admin") {
                        echo "
                        <a href='user.php' class='nav-item nav-link text-white fw-bold'><i class='fa fa-user text-light me-2'></i>Users</a>
                        <a href='designer.php' class='nav-item nav-link text-white fw-bold'><i class='fa fa-user text-light me-2'></i>Designer</a>
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
                    <i class="fa fa-bars text-success"></i>
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
            


        </div>
        <!-- Content End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize DataTable
            $('#salesTable').DataTable();
        });
    </script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>