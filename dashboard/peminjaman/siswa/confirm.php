<?php
// Pastikan Anda memiliki koneksi database yang sudah diatur
include '../../../koneksi.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_peminjaman = $_POST['id_peminjaman'];
    $id_barang = $_POST['id_barang'];
    $kondisi_sesudah = $_POST['kondisi_sesudah'];
    $nama_siswa = $_POST['nama_siswa'];

    // Perbarui status peminjaman
    $query = "UPDATE tbl_peminjaman SET kondisi_sesudah = '$kondisi_sesudah', is_confirmed = 1 WHERE id_peminjaman = $id_peminjaman;";
    $query .= "UPDATE tbl_barang SET status = 'Tersedia', kondisi_sebelum = '$kondisi_sesudah' WHERE id_barang = $id_barang;";

    if ($connect->multi_query($query)) {
        $_SESSION['color'] = "success";
        $_SESSION['title'] = "Sukses!";
        $_SESSION['text'] = "Peminjaman berhasil di-konfirmasi!";

        $_SESSION['aktivitas'] = "Meng-konfirmasi peminjaman dari $nama_siswa";
        date_default_timezone_set("Asia/Jakarta");
        $_SESSION['waktu'] = date("Y-F-d H:i:s");
        $_SESSION['location'] = "/peminjaman/siswa/";

        header("Location: ../../log-aktivitas/insert.php");
    } else {
        echo "error"; // Gagal
    }
} else {
    echo "Metode permintaan tidak valid.";
}
