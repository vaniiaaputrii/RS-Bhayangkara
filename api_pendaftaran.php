<?php
include 'koneksi.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Ambil data JSON dari request Body
    $data = json_decode(file_get_contents("php://input"), true);

    $nama     = $data['nama'];
    $nik      = $data['nik'];
    $kategori = $data['kategori'];
    $bayar    = $data['bayar'];
    $dokter   = $data['dokter'];
    $tanggal  = $data['tanggal'];

    // Generate Nomor Antrean (contoh: A-001)
    $queryCount = mysqli_query($conn, "SELECT COUNT(*) as total FROM pendaftaran");
    $rowCount   = mysqli_fetch_assoc($queryCount);
    $noAntrean  = "A-" . str_pad($rowCount['total'] + 1, 3, '0', STR_PAD_LEFT);

    // Simpan ke database
    $sql = "INSERT INTO pendaftaran (no_antrean, nama_pasien, nik_nrp, kategori, pembayaran, dokter_nama, tanggal_kunjungan) 
            VALUES ('$noAntrean', '$nama', '$nik', '$kategori', '$bayar', '$dokter', '$tanggal')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode([
            "status" => "success", 
            "no_antrean" => $noAntrean,
            "message" => "Pendaftaran berhasil disimpan ke MySQL"
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => mysqli_error($conn)]);
    }
} 
else if ($method === 'GET') {
    // Ambil semua data pendaftaran untuk Tampilan Admin
    $result = mysqli_query($conn, "SELECT * FROM pendaftaran ORDER BY id DESC");
    $list = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $list[] = $row;
    }
    echo json_encode($list);
}
?>