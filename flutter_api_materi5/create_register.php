<?php
header('Access-Control-Allow-Origin: *'); // Perbaiki penulisan header

include "config.php";

$username = $_POST['username'];
$email = $_POST['email'];
$psw = $_POST['psw'];

$result = mysqli_query($connection, "INSERT INTO registerakun (username, email, psw) VALUES ('$username', '$email', '$psw')");

if ($result) {
    echo json_encode([ // Gunakan json_encode, bukan json_decode
        'message' => 'Data Berhasil di Create'
    ]);
} else {
    echo json_encode([
        'message' => 'Data Gagal di Create!!!'
    ]);
}
?>
