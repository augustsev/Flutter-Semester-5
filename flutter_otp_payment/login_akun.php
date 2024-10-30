<?php
header('Access-Control-Allow-Origin: *'); // Mengatur header untuk mengizinkan permintaan dari semua domain (CORS).

include "config.php"; // Mengimpor file konfigurasi yang berisi pengaturan koneksi ke database.

// Mengambil nilai dari input form yang dikirim melalui metode POST.
$username_or_email = $_POST['username_or_email'];
$pasw = $_POST['password']; // Mengambil nilai dari input form yang dikirim melalui metode POST dengan nama 'password'.

// Melakukan query untuk memeriksa keberadaan username/email dan password di tabel 'akun'.
$result = mysqli_query($connection, "SELECT * FROM akun WHERE (username='$username_or_email' OR email='$username_or_email') AND pasw='$pasw'");

if (mysqli_num_rows($result) > 0) { // Jika ada hasil, berarti login berhasil
    $user = mysqli_fetch_assoc($result); // Mengambil data pengguna
    echo json_encode([ // Mengubah array PHP menjadi format JSON untuk respons
        'success' => true, // Menyatakan bahwa login berhasil
        'message' => 'Login Berhasil!', // Pesan sukses
        'data' => $user // Mengembalikan data pengguna (bisa disesuaikan dengan kebutuhan)
    ]);
} else {
    // Jika tidak ada hasil, cek apakah username/email ada
    $checkUser = mysqli_query($connection, "SELECT * FROM akun WHERE username='$username_or_email' OR email='$username_or_email'");
    
    if (mysqli_num_rows($checkUser) > 0) {
        // Username/email ada, tetapi password salah
        echo json_encode([
            'success' => false, // Menyatakan bahwa login gagal
            'message' => 'Invalid password' // Pesan kesalahan jika password salah
        ]);
    } else {
        // Username/email tidak ditemukan
        echo json_encode([
            'success' => false, // Menyatakan bahwa login gagal
            'message' => 'User not found' // Pesan kesalahan jika akun tidak ditemukan
        ]);
    }
}

// Menutup koneksi database
mysqli_close($connection);
?>
