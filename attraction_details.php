<?php
require_once "config.php";
require_once "navbar.php";

// session_start();

// Check if the user is logged in
$uid = $_SESSION['uid'] ?? null; 
$uname = $_SESSION['uname'] ?? null; 

// Get the attr_id from the URL
$attr_id = $_GET['attr_id'] ?? '';

if (empty($attr_id)) {
    echo "Invalid attraction ID.";
    exit;
}

// Fetch attraction details based on attr_id
$stmt = $conn->prepare("SELECT * FROM attractions WHERE attr_id = ?");
$stmt->bind_param("i", $attr_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $attraction = $result->fetch_assoc();
} else {
    echo "Attraction not found.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($attraction['attraction_name']); ?> - Attraction Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* body {
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        } */
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .attraction-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .attraction-header h1 {
            font-size: 36px;
            color: #333;
        }
        .attraction-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .attraction-description {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 20px;
        }
        .attraction-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 40px;
        }

        .get-direction-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .get-direction-button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <br>
<?php require_once "back.php"; ?>

<div class="main-container">
    <div class="attraction-header">
        <h1><?php echo htmlspecialchars($attraction['attraction_name']); ?></h1>
        <img class="attraction-image" src="images/<?php echo htmlspecialchars($attraction['image']); ?>" alt="<?php echo htmlspecialchars($attraction['attraction_name']); ?>">
        <!-- <a href="https://www.google.com/maps/dir/?api=1&destination=<?/*php echo urlencode($attraction['map']); */?>" class="get-direction-button">Get Directions</a> -->
        <a href="https://www.google.com/maps/dir/?api=1&destination=<?php echo htmlspecialchars($attraction['attraction_name']); ?>" class="get-direction-button">Get Directions</a>
    </div>

    <div class="attraction-details">
        <div class="attraction-description">
            <h2>Description</h2>
            <p><?php echo /*nl2br*/(htmlspecialchars($attraction['description'])); ?></p>
        </div>
        <div class="attraction-description">
            <h2>Details</h2>
            <p><strong>Entrance Fee:</strong> <?php echo htmlspecialchars($attraction['entrance_fee']); ?></p>
            <p><strong>Parking:</strong> <?php echo htmlspecialchars($attraction['parking']); ?></p>
            <p><strong>Dining:</strong> <?php echo htmlspecialchars($attraction['dining']); ?></p>
            <p><strong>Operating Hours:</strong> <?php echo htmlspecialchars($attraction['operating_hours_from']); ?>am to <?php echo htmlspecialchars($attraction['operating_hours_to']); ?>pm</p>
            <p><strong>History:</strong> <?php echo nl2br(htmlspecialchars($attraction['history'])); ?></p>
        </div>
    </div>

    <!-- Check if user is logged in using uid -->
    <?php if ($uid): ?>
        <a href="reviews.php?attr_id=<?php echo $attr_id; ?>" class="get-direction-button">Review <?php echo htmlspecialchars($attraction['attraction_name']); ?></a>
        <br>
        <br>
        <a href="users_reviews.php?attr_id=<?php echo $attr_id; ?>" class="get-direction-button">Show Reviews for <?php echo htmlspecialchars($attraction['attraction_name']); ?></a>
    <?php else: ?>
        <p><em>Login to leave a review.</em></p>
    <?php endif; ?>
</div>
</body>
</html>
