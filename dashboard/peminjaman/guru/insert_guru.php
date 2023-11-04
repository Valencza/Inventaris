<?php
session_start();

include("../../../koneksi.php");

if (isset($_POST["submitinsert"])) {
    $nama_guru = $_POST["nama_guru"];
    $jabatan = $_POST["jabatan"];
    $nip = $_POST["nip"];
    $id_barang = $_POST['id_barang'];
    $waktu_pinjam = $_POST['waktu_pinjam'];
    $waktu_kembali = $_POST['waktu_kembali'];
    $kondisi_sesudah = $_POST['kondisi_sesudah']; // Set status sesudah menjadi "Pending"
    $kondisi_sebelum = $_POST['kondisi_sebelum'];
    $status_peminjaman = $_POST['status_peminjaman'];

    // Cari id_guru berdasarkan nama siswa yang dipilih
    $querybarang = mysqli_query($connect, "SELECT nama_barang FROM tbl_barang WHERE id_barang = $id_barang");
    $fetch = mysqli_fetch_assoc($querybarang);
    $nama_barang = $fetch['nama_barang'];
    $query_cari_id = "SELECT id_guru FROM tbl_guru WHERE nama_guru = '$nama_guru'";
    $result = mysqli_query($connect, $query_cari_id);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $id_guru = $row['id_guru'];

        $insert_peminjaman = "INSERT INTO tbl_peminjaman (id_guru, id_barang, waktu_pinjam, waktu_kembali, kondisi_sebelum, kondisi_sesudah) VALUES ('$id_guru', '$id_barang', '$waktu_pinjam', '$waktu_kembali', '$kondisi_sebelum', '$kondisi_sesudah');";
        $insert_peminjaman .= "UPDATE tbl_barang SET status = 'Dipinjam' WHERE id_barang = $id_barang;";

        if ($connect->multi_query($insert_peminjaman) === true) {
            $_SESSION['color'] = "success";
            $_SESSION['title'] = "Sukses!";
            $_SESSION['text'] = "Data berhasil di-insert!";

            $_SESSION['aktivitas'] = "Nama Siswa <b>$nama_guru</b> Meminjam Barang <b>$nama_barang</b>";
            date_default_timezone_set("Asia/Jakarta");
            $_SESSION['waktu'] = date("Y-F-d H:i:s");
            $_SESSION['location'] = "peminjaman/guru/";

            header("Location: ../../log-aktivitas/insert.php");
        } else {
            $_SESSION['pesan'] = "Terjadi kesalahan saat menyimpan data: " . mysqli_error($connect);
        }
    } else {
        $_SESSION['pesan'] = "Terjadi kesalahan saat mencari id_guru: " . mysqli_error($connect);
    }
}
