<?php
session_start();

include '../../../koneksi.php';

$id_peminjaman = $_POST['id_peminjaman'];

$queryview = mysqli_query($connect, "SELECT id_barang, id_guru FROM tbl_peminjaman WHERE id_peminjaman = '$id_peminjaman'");

$fetch = mysqli_fetch_assoc($queryview);
$id_barang = $fetch['id_barang'];
$id_guru = $fetch['id_guru'];

$querybarang = mysqli_query($connect, "SELECT * FROM tbl_barang WHERE id_barang = $id_barang");
$queryGuru = mysqli_query($connect, "SELECT * FROM tbl_guru WHERE id_guru = $id_guru");

$fetch_barang = mysqli_fetch_assoc($querybarang);
$fetch_guru = mysqli_fetch_assoc($queryGuru);

$nama_barang = $fetch_barang['nama_barang'];
$nama_guru = $fetch_guru['nama_guru'];

$querydelete = mysqli_query($connect, "DELETE FROM tbl_peminjaman WHERE id_peminjaman='$id_peminjaman'");

if ($querydelete) {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Data berhasil di-hapus!";

    $_SESSION['aktivitas'] = "Menghapus Pinjaman <b>$nama_barang</b> dari Siswa <b>$nama_guru</b> ";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "/peminjaman/guru/";

    header("Location: ../../log-aktivitas/insert.php");
} else {
    echo "ERROR, data gagal dihapus" . mysqli_error($connect);
}
