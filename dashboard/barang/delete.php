<?php
session_start();

include '../../koneksi.php';

$id_barang = $_POST['id_barang'];
$foto_barang = $_POST['foto_barang'];

$queryview = mysqli_query($connect, "SELECT nama_barang, foto_barang FROM tbl_barang WHERE id_barang ='$id_barang' OR foto_barang = '$foto_barang'");
$queryupdate = mysqli_query($connect, "DELETE FROM tbl_barang WHERE id_barang='$id_barang'");

$fetch = mysqli_fetch_assoc($queryview);

$hitung_foto = mysqli_num_rows($queryview);

$nama_barang = $fetch['nama_barang'];

if ($queryupdate) {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Data berhasil dihapus!";

    $_SESSION['aktivitas'] = "Delete data <b>$nama_barang</b> di tabel <b>Barang<b>";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "barang/";

    if ($hitung_foto <= 1) {
        if ($fetch['foto_barang'] != "default.jpg") {
            unlink('../../assets/img/barang/' . $fetch['foto_barang']);
        }
    }

    header("Location: ../log-aktivitas/insert.php");
} else {
    echo "ERROR, data gagal diupdate" . mysqli_error($connect);
}
