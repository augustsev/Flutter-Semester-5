<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$username = $_POST['username'];
$old_password = $_POST['old_password'];

// Mengambil data dari database untuk memeriksa password
$query = mysqli_query($connection, "SELECT * FROM registerakun WHERE username='$username' AND psw='$old_password'");

if (mysqli_num_rows($query) > 0) {
    echo json_encode(['valid' => true]);
} else {
    echo json_encode(['valid' => false]);
}
?>
