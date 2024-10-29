<?php
header('Access-Control-Allow-Origin: *'); // Memungkinkan akses dari semua asal
include "config.php"; // Mengimpor file konfigurasi database

$username = $_POST['username']; // Mengambil username dari input POST
$new_password = $_POST['new_password']; // Mengambil new_password dari input POST

// Mengubah password di database
$result = mysqli_query($connection, "UPDATE registerakun SET psw='$new_password' WHERE username='$username'");

if ($result) {
    echo json_encode(['message' => 'Password berhasil diubah!']); // Mengembalikan pesan sukses dalam format JSON
} else {
    echo json_encode(['message' => 'Gagal mengubah password.']); // Mengembalikan pesan gagal dalam format JSON
}
?>