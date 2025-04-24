<?php

$servername = "localhost";
$username = "root";
$password = "priya8305";
$dbname = "DeadlineDB";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $assignmentTitle = $conn->real_escape_string($_POST['assignmentTitle']);
    $assignmentDescription = $conn->real_escape_string($_POST['assignmentDescription']);
    $assignmentDeadline = $conn->real_escape_string($_POST['assignmentDeadline']);
    $subject_id = (int)$_POST['subject_id'];

    $sql = "INSERT INTO Assignments (title, description, due_date, subject_id) VALUES ('$assignmentTitle', '$assignmentDescription', '$assignmentDeadline', $subject_id)";
    if ($conn->query($sql) === TRUE) {
        echo "Assignment added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>

