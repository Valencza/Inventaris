<?php
session_start();

include '../../koneksi.php';

$id_guru = $_POST['id_guru'];

$queryview = mysqli_query($connect, "SELECT nama_guru FROM tbl_guru WHERE id_guru ='$id_guru'");
$queryupdate = mysqli_query($connect, "DELETE FROM tbl_guru WHERE id_guru='$id_guru'");

$fetch = mysqli_fetch_assoc($queryview);

$nama_barang = $fetch['nama_guru'];

if ($queryupdate) {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Data berhasil dihapus!";

    $_SESSION['aktivitas'] = "Delete data <b>$nama_barang</b> di tabel <b>Barang<b>";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "guru/";

    header("Location: ../log-aktivitas/insert.php");
} else {
    echo "ERROR, data gagal diupdate" . mysqli_error($koneksi);
}
