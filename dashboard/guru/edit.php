<?php
session_start();

include '../../koneksi.php';

$id_guru = $_POST['id_guru'];
$nama_guru = $_POST['nama_guru'];
$jabatan = $_POST['jabatan'];
$nip = $_POST['nip'];

$queryupdate = mysqli_query($connect, "UPDATE tbl_guru SET nama_guru='$nama_guru', jabatan='$jabatan', nip='$nip' WHERE id_guru='$id_guru' ");

if ($queryupdate) {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Data berhasil di-edit!";

    $_SESSION['aktivitas'] = "Edit data <b>$nama_guru</b> di tabel <b>Siswa<b>";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "guru/";

    header("Location: ../log-aktivitas/insert.php");
} else {
    echo "ERROR, data gagal diupdate" . mysqli_error($connect);
}
