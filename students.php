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
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    $branch_id = (int)$_POST['branch_id'];
    $semester_id = (int)$_POST['semester_id'];

    $sql = "INSERT INTO Students (name, email, branch_id, semester_id) VALUES ('$name', '$email', $branch_id, $semester_id)";
    if ($conn->query($sql) === TRUE) {
        echo "Student added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>
