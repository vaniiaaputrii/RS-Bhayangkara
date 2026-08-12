<?php
$host     = "localhost";
$user     = "root";
$password = ""; 
$database = "db_klinik_rs"; // Pastikan namanya db_klinik_rs

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die(json_encode([
        'status' => 'error',
        'message' => 'Koneksi database gagal: ' . mysqli_connect_error()
    ]));
}
?>