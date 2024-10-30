<?php
header('Access-Control-Allow-Origin: *');
include 'config.php'; // Include file konfigurasi koneksi database

if (isset($_POST['submit-otp'])) {
    $nomor = mysqli_escape_string($connection, $_POST['nomor']);
    if ($nomor) {
        if (!mysqli_query($connection, "DELETE FROM otp_device WHERE nomor = '$nomor'")) {
            echo ("Error description: " . mysqli_error($connection));
        }
        $otp = rand(100000, 999999);
        $waktu = time();
        mysqli_query($connection, "INSERT INTO otp_device (nomor, otp, waktu) VALUES ('$nomor', '$otp', '$waktu')");
        $data = [
            'target' => $nomor,
            'message' => "Your OTP : " . $otp
        ];

        $curl = curl_init();
        curl_setopt(
            $curl,
            CURLOPT_HTTPHEADER,
            array(
                "Authorization: PRrE9QDSpXhqU58EhuC3",
            )
        );
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_URL, "https://api.fonnte.com/send");
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $result = curl_exec($curl);
        curl_close($curl);
    }
} elseif (isset($_POST['submit-login'])) {
    $otp = mysqli_escape_string($connection, $_POST['otp']);
    $nomor = mysqli_escape_string($connection, $_POST['nomor']);
    $q = mysqli_query($connection, "SELECT * FROM otp_device WHERE nomor = '$nomor' AND otp = '$otp'");
    $row = mysqli_num_rows($q);
    $r = mysqli_fetch_array($q);
    if ($row) {
        if (time() - $r['waktu'] <= 300) {
            echo "otp benar";
        } else {
            echo "otp expired";
        }
    } else {
        echo "otp salah";
    }
}
?>
