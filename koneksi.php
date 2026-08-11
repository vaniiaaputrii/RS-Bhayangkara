<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Content-Type: application/json; charset=UTF-8");

$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_rsb_akpol";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die(json_encode(["status" => "error", "message" => "Koneksi database gagal: " . mysqli_connect_error()]));
}
?>