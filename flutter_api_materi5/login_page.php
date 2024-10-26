<?php
header('Access-Control-Allow-Origin: *'); // Memungkinkan akses dari semua asal
header('Content-Type: application/json'); // Menetapkan tipe konten sebagai JSON

include "config.php"; // Mengimpor file konfigurasi database

// Mengambil data dari POST
$username = $_POST['username'];
$password = trim($_POST['psw']); // Mengambil password dari input dan menghapus spasi

// Menggunakan prepared statements untuk mencegah SQL injection
$query = "SELECT * FROM registerakun WHERE username = ?";
$stmt = mysqli_prepare($connection, $query);
mysqli_stmt_bind_param($stmt, "s", $username); // Mengikat parameter
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt); // Mendapatkan hasil

if ($result) {
    // Mengecek apakah ada hasil
    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result); // Mengambil data pengguna

        // Memeriksa apakah password sesuai
        if ($password === $user['psw']) {
            // Jika login berhasil
            echo json_encode([
                'message' => 'Login berhasil!',
                'username' => $username
            ]);
        } else {
            // Jika password salah
            echo json_encode([
                'message' => 'Password salah!'
            ]);
        }
    } else {
        // Jika username tidak ditemukan
        echo json_encode([
            'message' => 'Username tidak ditemukan!'
        ]);
    }
} else {
    // Jika terjadi kesalahan dalam query
    echo json_encode([
        'message' => 'Terjadi kesalahan saat memproses permintaan.'
    ]);
}

// Menutup koneksi
mysqli_close($connection);
?>
