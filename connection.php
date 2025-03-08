<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$database = "test_db";

try {
    // Create PDO connection
    $conn = new PDO("mysql:host=$servername;dbname=$database;charset=utf8", $username, $password);
    
    // Set PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    //echo "Connected successfully"; 
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
