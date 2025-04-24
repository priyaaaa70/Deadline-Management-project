<?php
header("Content-Type: application/json");
$conn = new mysqli("localhost", "root", "priya8305", "DeadlineDB");

$today = date('Y-m-d');
$query = "SELECT title, due_date FROM Assignments WHERE due_date >= '$today' ORDER BY due_date LIMIT 5";
$res = $conn->query($query);

$assignments = [];
while ($row = $res->fetch_assoc()) {
  $assignments[] = $row;
}

echo json_encode($assignments);
?>
