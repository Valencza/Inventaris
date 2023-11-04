<?php
session_start();
include("../../koneksi.php");

if (isset($_POST['submitinsert'])) {
    $jumlah = $_POST['jumlah'];
    $lokasi = $_POST['lokasi'];
    $sumber = $_POST['sumber'];
    $spesifikasi = $_POST['spesifikasi'];
    $kondisi_sebelum = $_POST['kondisi_sebelum'];
    $keterangan = $_POST['keterangan'];
    $tanggal_masuk = $_POST['tanggal_masuk'];
    $status = $_POST['status'];

    if (file_exists($_FILES['foto_barang']['tmp_name'])) {
        $id = $_POST['id'];
        $rand = rand();
        $ekstensi =  array('png', 'jpg', 'jpeg');
        $filename = $_FILES['foto_barang']['name'];
        $ukuran = $_FILES['foto_barang']['size'];
        $ext = pathinfo($filename, PATHINFO_EXTENSION);

        $foto_barang = $rand . '_' . $filename;
        move_uploaded_file($_FILES['foto_barang']['tmp_name'], '../../assets/img/barang/' . $rand . '_' . $filename);

        for ($i = 1; $i <= $jumlah; $i++) {
            $kode_barang = rand(10, 100000000);
            $nama_barang = $_POST['nama_barang'] . "-" . $i;

            if (!in_array($ext, $ekstensi)) {
                $_SESSION['color'] = "danger";
                $_SESSION['title'] = "Gagal!";
                $_SESSION['text'] = "Format file harus PNG, JPG, atau JPEG!";
                header("location: ../barang");
            } else {
                if ($ukuran < 1044070) {
                    $update_query = "INSERT INTO tbl_barang (kode_barang, nama_barang, foto_barang, lokasi, sumber, spesifikasi, kondisi_sebelum, keterangan, tanggal_masuk, status) VALUES ('$kode_barang', '$nama_barang', '$foto_barang', '$lokasi', '$sumber', '$spesifikasi', '$kondisi_sebelum', '$keterangan', '$tanggal_masuk', '$status')";
                    $hasil = mysqli_query($connect, $update_query);
                    $_SESSION['color'] = "success";
                    $_SESSION['title'] = "Sukses!";
                    $_SESSION['text'] = "Berhasil Insert data!";

                    $_SESSION['aktivitas'] = "Insert data barang <b>$nama_barang</b> di tabel <b>Barang</b>";
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
        }
    } else {
        for ($i = 1; $i <= $jumlah; $i++) {
            $kode_barang = $_POST['kode_barang'] . "-" . $i;
            $nama_barang = $_POST['nama_barang'] . "-" . $i;

            mysqli_query($connect, "INSERT INTO tbl_barang (kode_barang, nama_barang, lokasi, sumber, spesifikasi, kondisi_sebelum, keterangan, tanggal_masuk, status) VALUES ('$kode_barang', '$nama_barang', '$lokasi', '$sumber', '$spesifikasi', '$kondisi_sebelum', '$keterangan', '$tanggal_masuk', '$status')");
        }

        $_SESSION['color'] = "success";
        $_SESSION['title'] = "Sukses!";
        $_SESSION['text'] = "Berhasil Insert data!";

        $_SESSION['aktivitas'] = "Insert data barang <b>$nama_barang</b> di tabel <b>Barang</b>";
        date_default_timezone_set("Asia/Jakarta");
        $_SESSION['waktu'] = date("Y-F-d H:i:s");
        $_SESSION['location'] = "barang/";

        header("location: ../log-aktivitas/insert.php");
    }
}
