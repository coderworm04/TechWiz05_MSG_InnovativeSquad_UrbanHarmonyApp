<?php
require_once 'db_connection.php'; // Include the connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST['name']);
    $username = htmlspecialchars($_POST['username']);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $dob = filter_var($_POST['dob'], FILTER_SANITIZE_STRING);
    $address = htmlspecialchars($_POST['address']);
    $phone = filter_var($_POST['phone'], FILTER_SANITIZE_NUMBER_INT);
    $specialization = htmlspecialchars($_POST['specialization']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Hash the password
    $role = 'admin'; // The role is hardcoded as 'admin'

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Invalid email format.";
        exit;
    }

    // Check if required fields are not empty
    if (!empty($name) && !empty($username) && !empty($email) && !empty($password) && !empty($dob) && !empty($address) && !empty($phone) && !empty($specialization)) {
        try {
            // Check if an admin already exists
            $stmt = $pdo->prepare("SELECT COUNT(*) FROM tbl_admin WHERE role = 'admin'");
            $stmt->execute();
            $count = $stmt->fetchColumn();

            if ($count == 0) {
                // Prepare SQL to insert the new admin
                $stmt = $pdo->prepare("INSERT INTO tbl_admin (name, username, email, phone, dob, specialization, address, password, role) 
                                       VALUES (:name, :username, :email, :phone, :dob, :specialization, :address, :password, :role)");
                
                // Bind parameters correctly
                $stmt->bindParam(':name', $name);
                $stmt->bindParam(':username', $username);
                $stmt->bindParam(':email', $email);
                $stmt->bindParam(':phone', $phone);
                $stmt->bindParam(':dob', $dob);
                $stmt->bindParam(':specialization', $specialization);
                $stmt->bindParam(':address', $address);
                $stmt->bindParam(':password', $password);
                $stmt->bindParam(':role', $role);

                // Execute and provide feedback
                if ($stmt->execute()) {
                    echo "Admin registered successfully!";
                } else {
                    echo "Error registering admin.";
                }
            } else {
                echo "An admin account already exists!";
            }
        } catch (PDOException $e) {
            error_log($e->getMessage(), 3, 'php_errors.log');
            echo "An error occurred. Please try again.";
        }
    } else {
        echo "All fields are required.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Register Admin</title>
</head>
<body>
    <div class="container">
        <form method="POST" action="register.php">
            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label for="username">Username</label>
                <input type="text" class="form-control" name="username" required>
            </div>
            <div class="mb-3">
                <label for="email">Email address</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <div class="mb-3">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" name="dob" required>
            </div>
            <div class="mb-3">
                <label for="specialization">Specialization</label>
                <input type="text" class="form-control" name="specialization" required>
            </div>
            <div class="mb-3">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" name="phone" required>
            </div>
            <div class="mb-3">
                <label for="address">Address</label>
                <input type="text" class="form-control" name="address" required>
            </div>
            <button type="submit" class="btn btn-primary">Register Admin</button>
        </form>
    </div>
</body>
</html>
