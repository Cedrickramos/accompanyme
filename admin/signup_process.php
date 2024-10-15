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
$passwordHash = password_hash($password, PASSWORD_DEFAULT); // Hash the password
$sql = "INSERT INTO admins (username, password) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param('ss', $username, $passwordHash);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Process</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .container p {
            margin: 10px 0;
            font-size: 1.1rem;
            color: #555;
        }

        .container a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }

        .container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <?php
        if ($stmt->execute()) {
            // echo "<h1>Signup Successful!</h1>";
            // echo "<p>You can now <a href='login.php'>login</a> to confirm your Sign Up Credential.</p>";

            echo "<script>alert('Sign Up successful! Please consider to log in to confirm your SignUp Credential.') 
                window.location.href = 'login.php';
                </script>";

        } else {
            echo "<h1>Error</h1>";
            echo "<p>There was an error with your signup: " . $stmt->error . "</p>";
        }

        $stmt->close();
        $conn->close();
        ?>
    </div>
</body>
</html>
