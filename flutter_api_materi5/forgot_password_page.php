<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$username = $_POST['username'];
$email = $_POST['email'];

// Memeriksa apakah akun dengan username dan email ada
$result = mysqli_query($connection, "SELECT psw FROM registerakun WHERE username='$username' AND email='$email'");

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    echo json_encode([
        'message' => 'Akun ditemukan',
        'password' => $row['psw'] // Mengembalikan password dalam bentuk plaintext
    ]);
} else {
    echo json_encode([
        'message' => 'Akun tidak ditemukan'
    ]);
}
?>
