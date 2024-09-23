<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    // Redirect to the Signin page
    header("Location: index.php");
    exit();
}

// Include the database connection
include('db_connection.php');

function generateColorFromString($string)
{
    $hash = md5($string); // Generate a hash from the string
    $color = substr($hash, 0, 6); // Use the first 6 characters as a color
    return '#' . $color;
}

$bgColor = generateColorFromString($_SESSION['username']); // Generate color based on username
$firstLetter = strtoupper(substr($_SESSION['username'], 0, 1));

// Fetch users for the select field
$users = [];
try {
    $stmt = $pdo->query("SELECT id, username, role FROM tbl_admin");
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate and sanitize input
    $date = htmlspecialchars(trim($_POST['date']));
    $display = htmlspecialchars(trim($_POST['display']));
    $video = htmlspecialchars(trim($_POST['video']));
    $impression = htmlspecialchars(trim($_POST['impression']));
    $ecpm = htmlspecialchars(trim($_POST['ecpm']));
    $total = htmlspecialchars(trim($_POST['total']));
    $user_id = htmlspecialchars(trim($_POST['user_id']));

    try {
        // Prepare and bind
        $stmt = $pdo->prepare("INSERT INTO tbl_sales (date, display, video, impression, ecpm, total, user_id) VALUES (:date, :display, :video, :impression, :ecpm, :total, :user_id)");
        $stmt->bindParam(':date', $date);
        $stmt->bindParam(':display', $display);
        $stmt->bindParam(':video', $video);
        $stmt->bindParam(':impression', $impression);
        $stmt->bindParam(':ecpm', $ecpm);
        $stmt->bindParam(':total', $total);
        $stmt->bindParam(':user_id', $user_id);

        // Execute the statement
        if ($stmt->execute()) {
            echo "<script>alert('Sales record added successfully')</script>";
            
        } else {
            echo "<script>alert('Error adding sales record.')</script>";
        }

    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Add Sales</title>
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
                    <a href="dashboard.php" class="nav-item nav-link active text-white fw-bold"><i class="fa fa-tachometer-alt text-light me-2"></i>Dashboard</a>
                    <?php
                    if ($_SESSION['role'] == "admin") {
                        echo "<a href='user.php' class='nav-item nav-link text-white fw-bold'><i class='fa text-light fa-user me-2'></i>Users</a>";
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

            <!-- Add Sales Form Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 class="mx-auto text-white">Add Sales</h3>
                    </div>
                    <form class="row g-3" method="POST" action="">
                        <div class="col-md-6">
                            <label for="validationCustom01" class="form-label">Date</label>
                            <input type="date" class="form-control" id="validationCustom01" name="date" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom02" class="form-label">Display</label>
                            <input type="number" class="form-control" id="validationCustom02" name="display" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom03" class="form-label">Video</label>
                            <input type="number" class="form-control" id="validationCustom03" name="video" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom04" class="form-label">Impression</label>
                            <input type="number" class="form-control" id="validationCustom04" name="impression" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom05" class="form-label">ECPM</label>
                            <input type="number" class="form-control" step="0.01" id="validationCustom05" name="ecpm" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom06" class="form-label">Total</label>
                            <input type="number" class="form-control" id="validationCustom06" step="0.01" name="total" required>
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom07" class="form-label">User</label>
                            <select class="form-select" id="validationCustom07" name="user_id" required>
                                <option value="" disabled selected>Select a user</option>
                                <?php foreach ($users as $user): ?>
                                    <?php if(htmlspecialchars($user['role']) != "admin"): ?>
                                    <option class="text-light" value="<?php echo htmlspecialchars($user['id']); ?>"><?php echo htmlspecialchars($user['username']); ?></option>
                                <?php 
                            endif;
                            endforeach; ?>
                            </select>
                        </div>
                        <div class="col-12">
                            <button class="btn btn-success" type="submit">Add Sales</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Add Sales Form End -->
        </div>
        <!-- Content End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
