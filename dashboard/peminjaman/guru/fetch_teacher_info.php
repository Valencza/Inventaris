<?php
include('../../../koneksi.php');

if (isset($_POST['teacherName'])) {
    $teacherName = $_POST['teacherName'];

    $query = "SELECT * FROM tbl_guru WHERE nama_guru = '$teacherName'";
    $result = mysqli_query($connect, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);

        $studentData = [
            'jabatan' => $row['jabatan'],
            'nip' => $row['nip'],
        ];

        echo json_encode($studentData);
    } else {
        echo json_encode(['error' => 'Nama siswa tidak ditemukan']);
    }
} else {
    echo json_encode(['error' => 'Data tidak ditemukan']);
}
