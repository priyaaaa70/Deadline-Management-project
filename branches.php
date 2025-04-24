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
    $branchName = $conn->real_escape_string($_POST['branchName']);

    $sql = "INSERT INTO Branches (branch_name) VALUES ('$branchName')";
    if ($conn->query($sql) === TRUE) {
        echo "Branch added successfully!";
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>