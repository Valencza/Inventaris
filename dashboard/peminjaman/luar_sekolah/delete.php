<?php
session_start();

include '../../../koneksi.php';

$id_luar_sekolah = $_POST['id_luar_sekolah'];

$queryview = mysqli_query($connect, "SELECT id_barang FROM tbl_luar_sekolah WHERE id_luar_sekolah = '$id_luar_sekolah'");

$fetch = mysqli_fetch_assoc($queryview);
$id_barang = $fetch['id_barang'];
$querybarang = mysqli_query($connect, "SELECT * FROM tbl_barang WHERE id_barang = $id_barang");


$fetch_barang = mysqli_fetch_assoc($querybarang);

$nama_barang = $fetch_barang['nama_barang'];

$querydelete = mysqli_query($connect, "DELETE FROM tbl_luar_sekolah WHERE id_luar_sekolah='$id_luar_sekolah'");

if ($querydelete) {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Data berhasil di-hapus!";

    $_SESSION['aktivitas'] = "Menghapus Pinjaman <b>$nama_barang</b> dari Siswa <b>$nama_luar_sekolah</b> ";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "/peminjaman/luar_sekolah/";

    header("Location: ../../log-aktivitas/insert.php");
} else {
    echo "ERROR, data gagal dihapus" . mysqli_error($connect);
}
