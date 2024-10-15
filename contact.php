<?php require_once "navbar.php";?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mabuhay, Laguna</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <div class="content-sections">
            
<h1>Contact Section</h1>
            <p>Have questions or need assistance? Reach out to us:</p>
            <p>Email: accompanyme@gmail.com</p>
            <p>Phone: +63 123 456 7890</p>
            <form action="contact.php" method="post" class="contact-form">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>
                <button type="submit" class="btn">Send Message</button>
            </form>
</div>

<?php
require_once "footer.php";
?>

</body>
</html>