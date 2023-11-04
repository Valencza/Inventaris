<?php
session_start();

include("../../../koneksi.php");

if (isset($_POST["submitinsert"])) {
    $nama_peminjam = $_POST["nama_peminjam"];
    $alamat = $_POST['alamat'];
    $no_identitas = $_POST["no_identitas"];
    $id_barang = $_POST['id_barang'];
    $waktu_pinjam = $_POST['waktu_pinjam'];
    $waktu_kembali = $_POST['waktu_kembali'];
    $kondisi_sesudah = $_POST['kondisi_sesudah']; // Set status sesudah menjadi "Pending"
    $kondisi_sebelum = $_POST['kondisi_sebelum'];
    $status_peminjaman = $_POST['status_peminjaman'];

    // Cari nama_barang berdasarkan id_barang
    $querybarang = mysqli_query($connect, "SELECT nama_barang FROM tbl_barang WHERE id_barang = $id_barang");
    $fetch = mysqli_fetch_assoc($querybarang);
    $nama_barang = $fetch['nama_barang'];

    $insert_peminjaman = "INSERT INTO tbl_luar_sekolah (nama_peminjam, alamat, no_identitas, id_barang, waktu_pinjam, waktu_kembali, kondisi_sebelum, kondisi_sesudah) VALUES ('$nama_peminjam', '$alamat', '$no_identitas', '$id_barang', '$waktu_pinjam', '$waktu_kembali', '$kondisi_sebelum', '$kondisi_sesudah');";
    $insert_peminjaman .= "UPDATE tbl_barang SET status = 'Dipinjam' WHERE id_barang = $id_barang;";

    if ($connect->multi_query($insert_peminjaman) === true) {
        $_SESSION['color'] = "success";
        $_SESSION['title'] = "Sukses!";
        $_SESSION['text'] = "Data berhasil di-insert!";

        $_SESSION['aktivitas'] = "Nama Peminjam <b>$nama_peminjam</b> Meminjam Barang <b>$nama_barang</b>";
        date_default_timezone_set("Asia/Jakarta");
        $_SESSION['waktu'] = date("Y-F-d H:i:s");
        $_SESSION['location'] = "peminjaman/luar_sekolah/";

        header("Location: ../../log-aktivitas/insert.php");
    } else {
        $_SESSION['pesan'] = "Terjadi kesalahan saat menyimpan data: " . mysqli_error($connect);
    }
} else {
    $_SESSION['pesan'] = "Terjadi kesalahan saat mencari id_luar_sekolah: " . mysqli_error($connect);
}
