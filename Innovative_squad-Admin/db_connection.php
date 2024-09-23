<?php
// db_connection.php

// Use environment variables to store sensitive information
$host = "localhost";
$db_name = "urbanharmony";
$username = "root";
$password = "";

// Error handling: try to establish a secure connection using PDO
// db_connection.php (Updated error_log path)

try {
    $dsn = "mysql:host=$host;dbname=$db_name;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
        PDO::ATTR_PERSISTENT => true,
    ];

    $pdo = new PDO($dsn, $username, $password, $options);

} catch (PDOException $e) {
    // Change the path to a location that exists on your Windows environment
    error_log($e->getMessage(), 3, 'php_errors.log');
    die("Database connection error. Please try again later.");
}
?>
