<?php
// Koneksi ke Database
$conn = new mysqli("localhost", "root", "", "db_klinik_rs");

if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Koneksi gagal"]));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data dari form
    $nomor_pengaduan = "PGD-" . time();
    $nama_pelapor   = $_POST['nama_pelapor'] ?? $_POST['nama'] ?? '';
    $email          = $_POST['email'] ?? null;
    $no_telepon     = $_POST['no_telepon'] ?? $_POST['nik'] ?? ''; // Jika NIK disimpan ke no_telepon
    $kategori       = $_POST['kategori'] ?? 'Umum';
    $judul_pengaduan = $_POST['judul'] ?? 'Pengaduan Layanan';
    $isi_pengaduan   = $_POST['isi'] ?? 'Kunjungan Dokter Spesialis';
    $status         = 'pending';

    // Query INSERT hanya untuk kolom yang ADA di tabel pengaduan
    $sql = "INSERT INTO pengaduan (nomor_pengaduan, nama_pelapor, email, no_telepon, kategori, judul_pengaduan, isi_pengaduan, status) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssss", $nomor_pengaduan, $nama_pelapor, $email, $no_telepon, $kategori, $judul_pengaduan, $isi_pengaduan, $status);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Berhasil disimpan!"]);
    } else {
        echo json_encode(["status" => "error", "message" => $stmt->error]);
    }
}
?>