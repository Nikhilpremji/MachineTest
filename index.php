<?php
include 'connection.php';

try {
    $stmt = $conn->prepare("
        SELECT customer_id, 
               COUNT(id) AS total_orders, 
               SUM(total_amount) AS total_spent
        FROM orders
        WHERE status != 'canceled' 
        AND order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
        GROUP BY customer_id
        ORDER BY total_orders DESC, total_spent DESC
        LIMIT 5
    ");

    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Display results
    echo "<h2>Top 5 Customers (Last 3 Months)</h2>";
    echo "<table border='1' cellpadding='5' cellspacing='0'>";
    echo "<tr><th>#SNO</th><th>Customer ID</th><th>Total Orders</th><th>Total Spent</th></tr>";

    foreach ($results as $key => $row) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($key + 1) . "</td>";
        echo "<td>" . htmlspecialchars($row['customer_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['total_orders']) . "</td>";
        echo "<td>₹ " . number_format($row['total_spent'], 2) . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} catch (PDOException $e) {
    echo "Query failed: " . $e->getMessage();
}
?>
