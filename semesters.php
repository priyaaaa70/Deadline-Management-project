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
    $semesterName = $conn->real_escape_string($_POST['semesterName']);

    $sql = "INSERT INTO Semesters (semester_name) VALUES ('$semesterName')";
    if ($conn->query($sql) === TRUE) {
        echo "Semester added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>