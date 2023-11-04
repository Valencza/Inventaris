<?php
session_start();
include "../../koneksi.php";

$id = $_POST['id_barang'];
$rand = rand();
$ekstensi =  array('png', 'jpg', 'jpeg');
$filename = $_FILES['foto_barang']['name'];
$ukuran = $_FILES['foto_barang']['size'];
$ext = pathinfo($filename, PATHINFO_EXTENSION);

$nama_barang = $_POST['nama_barang'];
$lokasi = $_POST['lokasi'];
$sumber = $_POST['sumber'];
$spesifikasi = $_POST['spesifikasi'];
$kondisi_sebelum = $_POST['kondisi_sebelum'];
$keterangan = $_POST['keterangan'];
$tanggal_masuk = $_POST['tanggal_masuk'];
$status = $_POST['status'];

if (file_exists($_FILES['foto_barang']['tmp_name'])) {
    if (!in_array($ext, $ekstensi)) {
        $_SESSION['color'] = "danger";
        $_SESSION['title'] = "Gagal!";
        $_SESSION['text'] = "Format file harus PNG, JPG, atau JPEG!";
        header("location: ../barang");
    } else {
        if ($ukuran < 1044070) {
            $selectquery = mysqli_query($connect, "SELECT * FROM tbl_barang WHERE id_barang = $id");
            $data = mysqli_fetch_assoc($selectquery);

            if ($data['foto_barang'] != "default.jpg") {
                unlink('../../assets/img/barang/' . $data['foto_barang']);
            }

            $xx = $rand . '_' . $filename;
            move_uploaded_file($_FILES['foto_barang']['tmp_name'], '../../assets/img/barang/' . $rand . '_' . $filename);
            $update_query = "UPDATE tbl_barang SET foto_barang = '$xx', nama_barang = '$nama_barang', lokasi = '$lokasi', sumber = '$sumber', spesifikasi = '$spesifikasi', kondisi_sebelum = '$kondisi_sebelum', keterangan = '$keterangan', status = '$status' WHERE id_barang = $id";
            $hasil = mysqli_query($connect, $update_query);
            $_SESSION['color'] = "success";
            $_SESSION['title'] = "Sukses!";
            $_SESSION['text'] = "Berhasil Edit Profil!";

            $_SESSION['aktivitas'] = "Edit Profil <b>$username</b>";
            date_default_timezone_set("Asia/Jakarta");
            $_SESSION['waktu'] = date("Y-F-d H:i:s");
            $_SESSION['location'] = "barang/";

            header("location: ../log-aktivitas/insert.php");
        } else {
            $_SESSION['color'] = "danger";
            $_SESSION['title'] = "Error!";
            $_SESSION['text'] = "Ukuran file maksimal 1 MB!";
            header("location: ../barang");
        }
    }
} else {
    $_SESSION['color'] = "success";
    $_SESSION['title'] = "Sukses!";
    $_SESSION['text'] = "Berhasil Edit Profil!";

    $_SESSION['aktivitas'] = "Edit Profil <b>$username</b>";
    date_default_timezone_set("Asia/Jakarta");
    $_SESSION['waktu'] = date("Y-F-d H:i:s");
    $_SESSION['location'] = "barang/";

    header("location: ../log-aktivitas/insert.php");
}
