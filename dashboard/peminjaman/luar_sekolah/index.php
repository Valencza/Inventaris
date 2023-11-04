<?php
$no = 1;
include "../../../koneksi.php";
session_start();
$username = $_SESSION['username'];
$result = mysqli_query($connect, "SELECT * FROM tbl_user WHERE username = '$username'");
$data = mysqli_fetch_assoc($result);

if ($_SESSION['logged_in']) {
?>
    <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../sneat/assets/" data-template="vertical-menu-template-free">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Dashboard - Manage Peminjaman</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="../../sneat/assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="../../sneat/assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="../../sneat/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="../../sneat/assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="../../sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="../../sneat/assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="../../sneat/assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../../sneat/assets/js/config.js"></script>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.10.0/dist/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.10.0/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
    </head>

    <style>
        #siswaForm {
            margin-top: 30px;
        }

        #guruForm {
            margin-top: 30px;
        }

        #luarSekolahForm {
            margin-top: 30px;
        }

        #tabel-crud {
            margin: auto;
            padding: auto;
        }

        .custom-form {
            width: 80%;
            margin: 5px auto;
        }

        .custom-form label {
            width: 120px;
            display: inline-block;
        }

        .custom-form .form-control {
            width: 44 0px;
        }

        .toggle-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
            margin-bottom: 20px;
            margin-top: 1px;
        }

        .toggle-btn.active {
            background-color: #6c757d;
        }
    </style>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="../../" class="app-brand-link">
                            <span class="app-brand-text menu-text fw-bolder">Inventaris Lab Animasi</span>
                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <ul class="menu-inner py-1">
                        <!-- Dashboard -->
                        <li class="mt-3 menu-item">
                            <a href="../../" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                <div data-i18n="Analytics">Dashboard</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Data Bahan</span>
                        </li>
                        <li class="menu-item">
                            <a href="../../bahan/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-package"></i>
                                <div data-i18n="Basic">Bahan</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="../../distribusi-bahan/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-transfer-alt"></i>
                                <div data-i18n="Basic">Distribusi Bahan</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Data Barang</span>
                        </li>
                        <li class="menu-item">
                            <a href="../../barang/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-package"></i>
                                <div data-i18n="Basic">Barang</div>
                            </a>
                        </li>
                        <li class="menu-item active">
                            <a href="../siswa/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-transfer-alt"></i>
                                <div data-i18n="Basic">Peminjaman</div>
                            </a>
                        </li>
                        <?php
                        if ($data['role'] == "1") {
                        ?>
                            <li class="menu-item">
                                <a href="../../pengajuan/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-chevrons-right"></i>
                                    <div data-i18n="Basic">Pengajuan</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Aktivitas</span></li>
                            <li class="menu-item">
                                <a href="../../log-aktivitas/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-shuffle"></i>
                                    <div data-i18n="Basic">Log Aktivitas</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Data Nama</span></li>
                            <li class="menu-item">
                                <a href="../../siswa/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-user"></i>
                                    <div data-i18n="Basic">Manage Siswa</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="../../guru/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-user"></i>
                                    <div data-i18n="Basic">Manage Guru</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Admin</span></li>
                            <li class="menu-item">
                                <a href="../../admin/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-user-circle"></i>
                                    <div data-i18n="Basic">Manage Admin</div>
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    Menu Admin
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- Place this tag where you want the button to render. -->

                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="../../../assets/img/<?php echo $data['foto_profil'] ?>" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="../../../assets/img/<?php echo $data['foto_profil'] ?>" alt class="w-px-40 h-auto rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block"><?= $_SESSION['username'] ?></span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="../../profil/">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">Edit Profile</span>
                                            </a>
                                        </li>
                                        <?php
                                        if ($data['role'] == "1") {
                                        ?>
                                            <li>
                                                <a class="dropdown-item" href="../../master-setting/">
                                                    <i class="bx bx-cog me-2"></i>
                                                    <span class="align-middle">Master Setting</span>
                                                </a>
                                            </li>
                                        <?php
                                        }
                                        ?>
                                        <li>
                                            <a class="dropdown-item" href="../../../logout.php">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Log Out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-xxl flex-grow-1 container-p-y">
                            <div class="row">
                                <div class="col-lg mb-4 order-0">
                                    <button id="tombol" type="button" class="mb-4 btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#insertModalLong">
                                        <i class="bx bx-plus"></i> Insert
                                    </button>
                                    <div class="button-box">
                                        <div id="btn"></div>
                                        <button type="button" class="toggle-btn btn-sm" id="siswaToggle">Siswa</button>
                                        <button type="button" class="toggle-btn btn-sm" id="guruToggle">Guru</button>
                                        <button type="button" class="toggle-btn btn-sm active" id="luarSekolahToggle">Luar Sekolah</button>
                                    </div>

                                    <?php
                                    if (isset($_SESSION['text'])) :
                                    ?>
                                        <div class="alert alert-<?= $_SESSION['color'] ?> alert-dismissible" role="alert">
                                            <h6 class="alert-heading d-flex align-items-center fw-bold mb-1"><?= $_SESSION['title'] ?></h6>
                                            <p class="mb-0"><?= $_SESSION['text'] ?></p>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                                            </button>
                                        </div>
                                        <script type="text/javascript">
                                            $(document).ready(function() {

                                                window.setTimeout(function() {
                                                    $(".alert").fadeTo(1000, 0).slideUp(1000, function() {
                                                        $(this).remove();
                                                    });
                                                }, 3000);

                                            });
                                        </script>
                                    <?php
                                        unset($_SESSION['color']);
                                        unset($_SESSION['title']);
                                        unset($_SESSION['text']);
                                    endif;

                                    ?>

                                    <div class="card">
                                        <div class="p-3 table-responsive">
                                            <table id="tabel-crud" class="table table-striped" style="width: 100%;">
                                                <thead>

                                                    <tr id="tabelGuru">
                                                        <th scope="col">#</th>
                                                        <th scope="col">Nama</th>
                                                        <th scope="col">Alamat</th>
                                                        <th scope="col">No. Identitas</th>
                                                        <th scope="col">Barang</th>
                                                        <th scope="col">Waktu Pinjam</th>
                                                        <th scope="col">Waktu Kembali</th>
                                                        <th scope="col">Kondisi Sebelum</th>
                                                        <th scope="col">Kondisi Sesudah</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Action</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $no = 1;
                                                    $queryview = mysqli_query($connect, "SELECT
                                                        tbl_luar_sekolah.*,
                                                        tbl_barang.kondisi_sebelum AS barang_sebelum,
                                                        tbl_barang.nama_barang,
                                                        tbl_barang.status
                                                    FROM
                                                        tbl_luar_sekolah
                                                    JOIN
                                                        tbl_barang ON tbl_luar_sekolah.id_barang = tbl_barang.id_barang
                                                    ORDER BY id_luar_sekolah DESC")
                                                        or die(mysqli_error($connect));

                                                    if (!$queryview) {
                                                        die('Query failed: ' . mysqli_error($connect));
                                                    }
                                                    while ($row = mysqli_fetch_assoc($queryview)) :
                                                        echo "<tr>";
                                                        echo '<td scope="row">' . $no++ . "</td>";
                                                        echo "<td>" . $row['nama_peminjam'] . "</td>";
                                                        echo "<td>" . $row['alamat'] . "</td>";
                                                        echo "<td>" . $row['no_identitas'] . "</td>";
                                                        echo "<td>" . $row['nama_barang'] . "</td>";
                                                        echo "<td id='waktu_pinjam$no'>" . $row['waktu_pinjam'] . "</td>";
                                                        echo "<td id='waktu_kembali$no'>" . $row['waktu_kembali'] . "</td>";
                                                        echo "<td id='kondisi_sebelum$no'>" . $row['kondisi_sebelum'] . "</td>";
                                                        echo "<td id='kondisi_sesudah{$row['id_luar_sekolah']}'>" . $row['kondisi_sesudah'] . "</td>";
                                                        echo "<td id='status_peminjaman{$row['id_luar_sekolah']}'>" . $row['status'] . "</td>";
                                                    ?>
                                                        <td>
                                                            <div class="d-grid gap-2 col-5">

                                                                <?php
                                                                if ($row['is_confirmed'] == 1) { ?>
                                                                    <a href="#" class="btn btn-sm btn-secondary disabled"><i class="bi bi-trash"></i> Konfirmasi</a>
                                                                    <a href="#" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#modaldelete<?= $no ?>"><i class="bi bi-trash"></i> Delete</a>
                                                                <?php
                                                                } else { ?>
                                                                    <a href="#" class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#kondisiSesudahModal<?= $no ?>"><i class="bi bi-trash"></i> Konfirmasi</a>
                                                                <?php
                                                                }
                                                                ?>
                                                            </div>
                                                        </td>
                                                        </tr>

                                                        <!-- Modal Kondisi Sesudah -->
                                                        <div class="modal fade" id="kondisiSesudahModal<?= $no ?>" tabindex="-1" role="dialog" aria-labelledby="kondisiSesudahModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="kondisiSesudahModalLabel">Ubah Status Sesudah Dipinjam</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Apakah Anda yakin ingin mengubah status ini?
                                                                        <div class="form-group">
                                                                            <form method="post" action="confirm.php">
                                                                                <input type="hidden" name="nama_peminjam" value="<?= $row['nama_peminjam'] ?>">
                                                                                <input type="hidden" name="id_luar_sekolah" value="<?= $row['id_luar_sekolah'] ?>">
                                                                                <input type="hidden" name="id_barang" value="<?= $row['id_barang'] ?>">
                                                                                <label for="kondisi_sesudah">Status Sesudah:</label>
                                                                                <select class="form-select" name="kondisi_sesudah" id="kondisi_sesudah" required="">
                                                                                    <option value="" disabled selected hidden>--PILIH KONDISI SESUDAH--</option>
                                                                                    <option value="Baik">Baik</option>
                                                                                    <option value="Rusak">Rusak</option>
                                                                                </select>
                                                                        </div>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                        <button type="submit" class="btn btn-primary" id="modalSaveButton">Submit</button>
                                                                    </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Modal Delete -->
                                                        <div class="modal fade" id="modaldelete<?= $no; ?>" tabindex="-1" role="dialog" aria-labelledby="modaldelete<?= $no; ?>LongTitle" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="modaldelete<?= $no; ?>">Delete</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <form name="contact-form" action="delete.php" method="post">

                                                                            <p>Yakin untuk menghapus data dari Peminjam : <?= $row['nama_peminjam'] ?> ?</p>
                                                                            <input type="hidden" name="id_luar_sekolah" id="id_luar_sekolah" value="<?= $row['id_luar_sekolah'] ?>">
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button name="submitinsert" type="submit" onclick="submitForm()" class="btn btn-danger">Delete</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <?php endwhile ?>
                                            </table>

                                            <!-- Modal Insert -->
                                            <div class="modal fade" id="insertModalLong" tabindex="-1" role="dialog" aria-labelledby="insertModalLongTitle" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="insertModalLongTitle">Insert</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                        </div>
                                                        <div class="modal-body">
                                                            <form class="needs-validation" novalidate id="siswaForm" action="insert_luar_sekolah.php" method="post" autocomplete="off">
                                                                <div class="form-group">
                                                                    <input class="form-control" type="hidden" name="id_luar_sekolah" id="id_luar_sekolah" required="">
                                                                    <div class="invalid-feedback">
                                                                        Harus Diisi
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="nama_peminjam">Nama Peminjam</label>
                                                                    <input class="form-control" type="text" name="nama_peminjam" id="nama_peminjam" required="">
                                                                    <div class="invalid-feedback">Harus Diisi</div>
                                                                </div><br>

                                                                <div class="form-group">
                                                                    <label for="alamat">Alamat</label>
                                                                    <textarea class="form-control" type="text" name="alamat" id="alamat" required=""></textarea>
                                                                    <div class="invalid-feedback">Harus Diisi</div>
                                                                </div><br>
                                                                <div class="form-group">
                                                                    <label for="no_identitas">No. Identitas</label>
                                                                    <input class="form-control" type="text" name="no_identitas" id="no_identitas">
                                                                    <div class="invalid-feedback">Harus Diisi</div>
                                                                </div><br>
                                                                <div class="form-group">
                                                                    <label for="id_barang">Barang </label>
                                                                    <select class="form-control" name="id_barang" id="id_barang" placeholder="---Pilih Barang---" required="">
                                                                        <option value="" disabled selected hidden>--PILIH BARANG--</option>
                                                                        <?php
                                                                        $ambildata_barang = "SELECT * FROM tbl_barang WHERE status = 'Tersedia' AND kondisi_sebelum = 'Baik'";
                                                                        $query_barang = mysqli_query($connect, $ambildata_barang);

                                                                        while ($barang = mysqli_fetch_assoc($query_barang)) {
                                                                            echo '<option value="' . $barang['id_barang'] . '">' . $barang['nama_barang'] . '</option>';
                                                                        }
                                                                        ?>
                                                                    </select>
                                                                </div><br>

                                                                <div class="form-group">
                                                                    <label for="kondisi_sebelum">Kondisi Sebelum</label>
                                                                    <input class="form-control" type="text" name="kondisi_sebelum" id="kondisi_sebelum" readonly>
                                                                    <input class="form-control" type="hidden" name="barang_id" id="barang_id" readonly>
                                                                </div><br>

                                                                <?php
                                                                // Mendapatkan waktu saat ini dalam format yang sesuai
                                                                date_default_timezone_set('Asia/Jakarta');
                                                                $timezone = date('Y-m-d H:i:s');
                                                                ?>
                                                                <div class="form-group">
                                                                    <label for="waktu_pinjam">Waktu Pinjam</label>
                                                                    <div class="input-group date">
                                                                        <input type="datetime-local" class="form-control" id="waktu_pinjam" name="waktu_pinjam" readonly value="<?= $timezone ?>">
                                                                        <div class="input-group-append">
                                                                        </div>
                                                                    </div>
                                                                </div><br>

                                                                <div class="form-group">
                                                                    <label for="waktu_kembali">Waktu Kembali</label>
                                                                    <div class="input-group date">
                                                                        <input type="datetime-local" class="form-control" id="waktu_kembali" name="waktu_kembali" required="">
                                                                        <div class="input-group-append">
                                                                        </div>
                                                                    </div>
                                                                </div><br>

                                                                <div class="form-group">
                                                                    <input class="form-control" type="hidden" name="status_peminjaman" id="status_peminjaman" value="Dipinjam" required="" readonly>
                                                                </div><br>

                                                                <div class="form-group">
                                                                    <input class="form-control" type="hidden" name="kondisi_sesudah" id="kondisi_sesudah" value="Pending" required="" readonly>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button name="submitinsert" type="submit" class="btn btn-primary">Insert</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <script>
                                                // Paste your JavaScript code here
                                                $(document).ready(function() {
                                                    // Your existing JavaScript code here

                                                    // Function to toggle active class and change URL
                                                    function toggleActiveButton(buttonId, url) {
                                                        $('.toggle-btn').removeClass('active');
                                                        $('#' + buttonId).addClass('active');
                                                        window.location.href = url; // Change URL
                                                    }

                                                    // Toggle switch buttons
                                                    $('#siswaToggle').click(function() {
                                                        toggleActiveButton('siswaToggle', '/inventaris/dashboard/peminjaman/siswa/index.php');
                                                    });

                                                    $('#guruToggle').click(function() {
                                                        toggleActiveButton('guruToggle', '/inventaris/dashboard/peminjaman/guru/index.php');
                                                    });

                                                    $('#luarSekolahToggle').click(function() {
                                                        toggleActiveButton('luarSekolahToggle', '/inventaris/dashboard/peminjaman/luar_sekolah/index.php');
                                                    });
                                                    // Your form submission code here
                                                    $('#submitButton').click(function() {
                                                        var formUrl = isSiswaForm ? '/inventaris/dashboard/peminjaman/luar_sekolah/index.php' : ($('#siswaToggle').hasClass('active') ? '/inventaris/dashboard/peminjaman/siswa/index.php' : '/inventaris/dashboard/peminjaman/guru/index.php');
                                                        window.location.href = formUrl;
                                                    });

                                                    // Handle initial URL
                                                    var currentPath = window.location.pathname;
                                                    if (currentPath.includes('/inventaris/dashboard/peminjaman/siswa/index.php')) {
                                                        $('#siswaToggle').click();
                                                    } else if (currentPath.includes('/inventaris/dashboard/peminjaman/guru/index.php')) {
                                                        $('#guruToggle').click();
                                                    }
                                                });
                                            </script>

                                            <!-- <script>
                                                function updateStatusOnServer(id_luar_sekolah, newStatus, kondisiSesudahUpdate) {
                                                var statusSesudah = $("#statusSesudahHidden").val();

                                                $.ajax({
                                                type: "POST",
                                                url: "confirm.php",
                                                data: {
                                                peminjaman_id: id_luar_sekolah,
                                                new_status: newStatus,
                                                update_kondisi_sesudah: kondisiSesudahUpdate // Mengirim status sesudah ke server
                                                },
                                                success: function(response) {
                                                if (response === "success") {

                                                var buttonId = "confirmButton" + id_luar_sekolah;
                                                var button = document.getElementById(buttonId);

                                                if (button) {
                                                if (newStatus === "Selesai") {
                                                button.classList.remove("btn-success");
                                                button.classList.add("btn-outline-danger");
                                                button.innerHTML = '<i class="bi bi-x"></i> Cancel';
                                                } else if (newStatus === "Dipinjam") {
                                                button.classList.remove("btn-outline-danger");
                                                button.classList.add("btn-success");
                                                button.innerHTML = '<i class="bi bi-check"></i> Confirm';
                                                }
                                                }
                                                } else {
                                                alert("Terjadi kesalahan saat memperbarui status di server.");
                                                }
                                                },
                                                error: function() {
                                                alert("Terjadi kesalahan saat mengirim permintaan ke server.");
                                                }
                                                });
                                                }

                                                function toggleConfirmStatus(id_luar_sekolah) {
                                                var buttonId = "confirmButton" + id_luar_sekolah;
                                                var button = $("#" + buttonId);

                                                if (button.length > 0) {
                                                var currentStatus = button.hasClass("btn-success") ? "Dipinjam" : "Selesai";

                                                // Mengatur pesan konfirmasi di dalam modal
                                                var confirmModal = $("#confirmModal");
                                                var modalYesButton = $("#confirmYesButton");

                                                if (confirmModal.length > 0 && modalYesButton.length > 0) {
                                                if (currentStatus === "Dipinjam") {
                                                confirmModal.find(".confirm-body").text("Apakah Anda yakin ingin mengonfirmasi peminjaman ini?");
                                                } else if (currentStatus === "Selesai") {
                                                confirmModal.find(".confirm-body").text("Apakah Anda yakin ingin membatalkan konfirmasi ini?");
                                                }

                                                confirmModal.attr("data-peminjaman-id", id_luar_sekolah);
                                                confirmModal.modal("show");

                                                // Menambahkan event listener untuk tombol "Yes"
                                                modalYesButton.on("click", function() {
                                                var newStatus = currentStatus === "Dipinjam" ? "Selesai" : "Dipinjam";
                                                var peminjamanId = confirmModal.attr("data-peminjaman-id");

                                                // Tampilkan pop-up untuk mengubah status sesudah
                                                var kondisiSesudahModal = $("#kondisiSesudahModal");

                                                var modalSaveButton = $("#modalSaveButton");

                                                kondisiSesudahModal.modal("show");

                                                modalSaveButton.on("click", function() {
                                                var selectedStatusSesudah = $("#kondisi_sesudah").val();
                                                if (selectedStatusSesudah === "Cancel") {
                                                selectedStatusSesudah = "Pending";
                                                }
                                                // Lakukan permintaan AJAX untuk mengubah status dan status sesudah di server
                                                $.ajax({
                                                type: "POST",
                                                url: "confirm.php",
                                                data: {
                                                peminjaman_id: peminjamanId,
                                                new_status: newStatus,
                                                update_kondisi_sesudah: selectedStatusSesudah
                                                },
                                                success: function(response) {
                                                if (response === "success") {
                                                // Perbarui tombol Confirm/Cancel sesuai dengan status baru
                                                if (newStatus === "Selesai") {
                                                button.removeClass("btn-success");
                                                button.addClass("btn-outline-danger");
                                                button.html('<i class="bi bi-x"></i> Cancel');
                                                } else if (newStatus === "Dipinjam") {
                                                button.removeClass("btn-outline-danger");
                                                button.addClass("btn-success");
                                                button.html('<i class="bi bi-check"></i> Confirm');
                                                }

                                                // Perbarui status_sesudah
                                                $("#kondisi_sesudah" + id_luar_sekolah).text(selectedStatusSesudah);

                                                // Perbarui status_peminjaman
                                                $("#status_peminjaman" + id_luar_sekolah).text(newStatus);

                                                // Sembunyikan modal dan modal kondisi sesudah
                                                kondisiSesudahModal.modal("hide");
                                                confirmModal.modal("hide");

                                                autoRefreshStatus(id_luar_sekolah);
                                                } else {
                                                alert("Terjadi kesalahan saat memperbarui status di server.");
                                                }
                                                },
                                                error: function() {
                                                alert("Terjadi kesalahan saat mengirim permintaan ke server.");
                                                }
                                                });
                                                });

                                                confirmModal.modal("hide");
                                                });
                                                }
                                                }
                                                }
                                                </script> -->

                                            <script>
                                                // Menampilkan kondisi sebelum saat pengguna memilih barang
                                                $('#id_barang').change(function() {
                                                    var selectedBarangId = $(this).val();

                                                    // Ambil data kondisi dari tabel tbl_barang
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "fetch_kondisi_barang.php", // Sesuaikan dengan URL yang sesuai
                                                        data: {
                                                            id_barang: selectedBarangId
                                                        },
                                                        success: function(response) {
                                                            var barangData = JSON.parse(response);
                                                            $('#barang_id').val(barangData.id_barang);
                                                            $('#kondisi_sebelum').val(barangData.kondisi_sebelum);
                                                        }
                                                    });
                                                });
                                            </script>

                                            <script>
                                                let forms = document.querySelectorAll(".needs-validation");

                                                Array.prototype.slice.call(forms).forEach(function(form) {
                                                    form.addEventListener("submit", function(event) {
                                                        if (!form.checkValidity()) {
                                                            event.preventDefault();
                                                            event.stopPropagation();
                                                        }
                                                        form.classList.add("was-validated");
                                                    });
                                                });

                                                new DataTable('#tabel-crud', {
                                                    responsive: true,
                                                    rowReorder: {
                                                        selector: 'td:nth-child(2)'
                                                    }
                                                });
                                            </script>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- / Content -->

                    </div>

                    <script>
                        function password_show_hide() {
                            var x = document.getElementById("password");
                            var show = document.getElementById("show");
                            var hide = document.getElementById("hide");
                            hide.classList.remove("d-none");
                            if (x.type === "password") {
                                x.type = "text";
                                show.style.display = "none";
                                hide.style.display = "block";
                            } else {
                                x.type = "password";
                                show.style.display = "block";
                                hide.style.display = "none";
                            }
                        }
                    </script>

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                © Powered By <b>Sneat</b>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->


                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
        </div>
        <!-- / Layout wrapper -->

        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="../../sneat/assets/vendor/libs/jquery/jquery.js"></script>
        <script src="../../sneat/assets/vendor/libs/popper/popper.js"></script>
        <script src="../../sneat/assets/vendor/js/bootstrap.js"></script>
        <script src="../../sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="../../sneat/assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="../../sneat/assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="../../sneat/assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="../../sneat/assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>

    </body>

    </html>
<?php
} else {
    header("location: ../");
}
