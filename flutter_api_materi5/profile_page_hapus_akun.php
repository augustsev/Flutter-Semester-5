<?php
header('Access-Control-Allow-Origin: *'); // Memungkinkan akses dari semua asal
header('Content-Type: application/json'); // Menetapkan tipe konten sebagai JSON

include "config.php"; // Mengimpor file konfigurasi database

// Mengambil data dari POST
$username = $_POST['username']; // Mengambil username dari input

// Query untuk menghapus akun
$query = "DELETE FROM registerakun WHERE username = ?";
$stmt = mysqli_prepare($connection, $query);
mysqli_stmt_bind_param($stmt, "s", $username); // Mengikat parameter
mysqli_stmt_execute($stmt);

// Mengecek hasil
if (mysqli_stmt_affected_rows($stmt) > 0) {
    // Jika berhasil menghapus
    echo json_encode([
        'message' => 'Akun berhasil dihapus!'
    ]);
} else {
    // Jika gagal atau akun tidak ditemukan
    echo json_encode([
        'message' => 'Gagal menghapus akun atau akun tidak ditemukan!'
    ]);
}

// Menutup koneksi
mysqli_close($connection);
?>
