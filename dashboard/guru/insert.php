<?php
session_start();

include("../../koneksi.php");

if (isset($_POST["submitinsert"])) {
    // Ambil data dari form
    $nama_guru = $_POST["nama_guru"];
    $jabatan = $_POST["jabatan"];
    $nip = $_POST['nip'];

    // Query untuk INSERT data ke dalam tabel
    $query = "INSERT INTO tbl_guru (nama_guru, jabatan, nip) VALUES ('$nama_guru', '$jabatan', '$nip')";

    if (mysqli_query($connect, $query)) {
        $_SESSION['color'] = "success";
        $_SESSION['title'] = "Sukses!";
        $_SESSION['text'] = "Data berhasil di-insert!";

        $_SESSION['aktivitas'] = "Input data <b>$nama_guru</b> di tabel <b>Siswa<b>";
        date_default_timezone_set("Asia/Jakarta");
        $_SESSION['waktu'] = date("Y-F-d H:i:s");
        $_SESSION['location'] = "siswa/";

        header("Location: ../log-aktivitas/insert.php");
    } else {
        $_SESSION['pesan'] = "Terjadi kesalahan saat menyimpan data: " . mysqli_error($connect);
    }
}

// Redirect ke halaman utama setelah INSERT atau setelah kesalahan
header("Location: index.php");
exit();
