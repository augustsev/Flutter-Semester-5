<?php 
    $namaserver = "localhost";
    $userdb = "root";
    $passdb = "";
    $namadb = "flutterapi";
    $connection = mysqli_connect($namaserver, $userdb,$passdb, $namadb);

    if (!$connection){
        die("Koneksi ke server gagal!".mysqli_connect_error());
    }
?>