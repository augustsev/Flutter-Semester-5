<?php
header('Access-Control-Allow-Origin: *');
include "config.php";

$username = $_POST['username'];
$new_password = $_POST['new_password'];

// Mengubah password di database
$result = mysqli_query($connection, "UPDATE registerakun SET psw='$new_password' WHERE username='$username'");

if ($result) {
    echo json_encode(['message' => 'Password berhasil diubah!']);
} else {
    echo json_encode(['message' => 'Gagal mengubah password.']);
}
?>
