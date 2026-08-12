<?php
header('Content-Type: application/json');
require_once 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nama_pelapor     = isset($_POST['nama_pelapor']) ? trim($_POST['nama_pelapor']) : '';
    $no_hp            = isset($_POST['no_hp']) ? trim($_POST['no_hp']) : '';
    $email            = isset($_POST['email']) ? trim($_POST['email']) : '';
    $kategori_layanan = isset($_POST['kategori_layanan']) ? trim($_POST['kategori_layanan']) : 'Lainnya';
    $isi_pengaduan    = isset($_POST['isi_pengaduan']) ? trim($_POST['isi_pengaduan']) : '';

    if (empty($nama_pelapor) || empty($no_hp) || empty($isi_pengaduan)) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'Nama, No HP, dan Isi Pengaduan wajib diisi!'
        ]);
        exit;
    }

    $kode_pengaduan = 'PGD-' . date('Ymd') . '-' . rand(100, 999);

    $sql = "INSERT INTO pengaduan (kode_pengaduan, nama_pelapor, no_hp, email, kategori_layanan, isi_pengaduan) 
            VALUES ('$kode_pengaduan', '$nama_pelapor', '$no_hp', '$email', '$kategori_layanan', '$isi_pengaduan')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode([
            'status'         => 'success',
            'message'        => 'Pengaduan berhasil dikirim!',
            'kode_pengaduan' => $kode_pengaduan
        ]);
    } else {
        echo json_encode([
            'status'  => 'error',
            'message' => 'Gagal menyimpan ke database: ' . mysqli_error($conn)
        ]);
    }
    exit;
}
?>