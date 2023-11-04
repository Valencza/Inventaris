<?php
include("../../../koneksi.php");

if (isset($_POST['id_barang'])) {
    $id_barang = $_POST['id_barang'];

    // Gantilah ini dengan kueri SQL yang sesuai untuk mengambil kondisi dari tabel tbl_barang
    $query = mysqli_query($connect, "SELECT * FROM tbl_barang WHERE id_barang = $id_barang");

    if ($query && mysqli_num_rows($query) > 0) {
        $row = mysqli_fetch_assoc($query);

        $barangData = [
            'id_barang' => $row['id_barang'],
            'kondisi_sebelum' => $row['kondisi_sebelum'],
        ];

        echo json_encode($barangData);
    } else {
        echo json_encode(['error' => 'Nama siswa tidak ditemukan']);
    }
} else {
    echo "ID barang tidak ditemukan";
}
