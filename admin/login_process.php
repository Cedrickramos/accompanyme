<?php
// Start session
session_start();

// Database connection
$conn = new mysqli('localhost', 'root', '', 'accompanyme'); 

// kesug
// $conn = new mysqli('sql307.infinityfree.com', 'if0_36896748', 'rzQg0dnCh2BT', 'if0_36896748_accompanyme');

// infinity
// $conn = new mysqli('sql202.infinityfree.com', 'if0_37495817', 'TQY8mKoPDq ', 'if0_37495817_accompanyme');


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get user input
$username = $_POST['username'];
$password = $_POST['password'];

// Query to check credentials
$sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('ss', $username, $password);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // User exists
    $_SESSION['username'] = $username;
    header("Location: manage_index.php"); // Redirect to admin dashboard
} else {
    // Invalid credentials
    echo "Invalid username or password";
}

$stmt->close();
$conn->close();
?>
