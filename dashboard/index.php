<?php
$no = 1;
include "../koneksi.php";
session_start();
$username = $_SESSION['username'];
$result = mysqli_query($connect, "SELECT * FROM tbl_user WHERE username = '$username'");
$data = mysqli_fetch_assoc($result);
if ($_SESSION['logged_in']) {
?>
    <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="sneat/assets/" data-template="vertical-menu-template-free">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

        <title>Dashboard - Inventaris Lab Animasi</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="sneat/assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="sneat/assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="sneat/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="sneat/assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="sneat/assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="sneat/assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="sneat/assets/js/config.js"></script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="#" class="app-brand-link">
                            <span class="app-brand-text menu-text fw-bolder">Inventaris Lab Animasi</span>
                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <ul class="menu-inner py-1">
                        <!-- Dashboard -->
                        <li class="mt-3 menu-item active">
                            <a href="#" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                <div data-i18n="Analytics">Dashboard</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Data Bahan</span>
                        </li>
                        <li class="menu-item">
                            <a href="bahan/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-package"></i>
                                <div data-i18n="Basic">Bahan</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="distribusi-bahan/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-transfer-alt"></i>
                                <div data-i18n="Basic">Distribusi Bahan</div>
                            </a>
                        </li>
                        <li class="menu-header small text-uppercase">
                            <span class="menu-header-text">Data Barang</span>
                        </li>
                        <li class="menu-item">
                            <a href="barang/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-package"></i>
                                <div data-i18n="Basic">Barang</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="peminjaman/siswa/" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-transfer-alt"></i>
                                <div data-i18n="Basic">Peminjaman</div>
                            </a>
                        </li>
                        <?php
                        if ($data['role'] == "1") {
                        ?>
                            <li class="menu-item">
                                <a href="pengajuan/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-chevrons-right"></i>
                                    <div data-i18n="Basic">Pengajuan</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Aktivitas</span></li>
                            <li class="menu-item">
                                <a href="log-aktivitas/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-shuffle"></i>
                                    <div data-i18n="Basic">Log Aktivitas</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Data Nama</span></li>
                            <li class="menu-item">
                                <a href="siswa/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-user"></i>
                                    <div data-i18n="Basic">Manage Siswa</div>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="guru/" class="menu-link">
                                    <i class="menu-icon tf-icons bx bx-user"></i>
                                    <div data-i18n="Basic">Manage Guru</div>
                                </a>
                            </li>
                            <li class="menu-header small text-uppercase"><span class="menu-header-text">Admin</span></li>
                            <li class="menu-item">
                                <a href="admin/" class="menu-link">
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
                                    Welcome, <?= $_SESSION['username'] ?>
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- Place this tag where you want the button to render. -->

                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="../assets/img/<?php echo $data['foto_profil'] ?>" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="../assets/img/<?php echo $data['foto_profil'] ?>" alt class="w-px-40 h-auto rounded-circle" />
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
                                            <a class="dropdown-item" href="profil/">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">Edit Profile</span>
                                            </a>
                                        </li>
                                        <?php
                                        if ($data['role'] == "1") {
                                        ?>
                                            <li>
                                                <a class="dropdown-item" href="master-setting/">
                                                    <i class="bx bx-cog me-2"></i>
                                                    <span class="align-middle">Master Setting</span>
                                                </a>
                                            </li>
                                        <?php
                                        }
                                        ?>
                                        <li>
                                            <a class="dropdown-item" href="../logout.php">
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
                                <div class="col-lg-4 mb-4 order-0">
                                    <div class="card">
                                        <div class="d-flex align-items-end row">
                                            <div class="col-sm-7">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary">Data Bahan</h5>
                                                    <p class="mb-4">
                                                        Jumlah bahan yang terdaftar :
                                                        <br><span style="font-size: 60px;"><?php $query_view6 = mysqli_query($connect, "SELECT * FROM tbl_bahan");
                                                                                            echo mysqli_num_rows($query_view6); ?></span>
                                                    </p>

                                                    <a href="bahan/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 mb-4 order-0">
                                    <div class="card">
                                        <div class="d-flex align-items-end row">
                                            <div class="col-sm-8">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary">Data Distribusi Bahan</h5>
                                                    <p class="mb-4">
                                                        Jumlah Distribusi Bahan yang terdaftar :
                                                        <br><span style="font-size: 60px;"><?php $query_view8 = mysqli_query($connect, "SELECT * FROM tbl_distribusi");
                                                                                            echo mysqli_num_rows($query_view8); ?></span>
                                                    </p>

                                                    <a href="distribusi-bahan/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 mb-4 order-0">
                                    <div class="card">
                                        <div class="d-flex align-items-end row">
                                            <div class="col-sm-7">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary">Data Barang</h5>
                                                    <p class="mb-4">
                                                        Jumlah barang yang terdaftar :
                                                        <br><span style="font-size: 60px;"><?php $query_view3 = mysqli_query($connect, "SELECT * FROM tbl_barang");
                                                                                            echo mysqli_num_rows($query_view3); ?></span>
                                                    </p>

                                                    <a href="barang/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 mb-4 order-0">
                                    <div class="card">
                                        <div class="d-flex align-items-end row">
                                            <div class="col-sm-8">
                                                <div class="card-body">
                                                    <h5 class="card-title text-primary">Data Peminjaman</h5>
                                                    <p class="mb-4">
                                                        Jumlah barang yang dipinjam :
                                                        <br><span style="font-size: 60px;"><?php $query_view4 = mysqli_query($connect, "SELECT * FROM tbl_peminjaman");
                                                                                            echo mysqli_num_rows($query_view4); ?></span>
                                                    </p>

                                                    <a href="peminjaman/siswa/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                                if ($data['role'] == "1") {
                                ?>
                                    <div class="col-lg-4 mb-4 order-0">
                                        <div class="card">
                                            <div class="d-flex align-items-end row">
                                                <div class="col-sm-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title text-primary">Data Pengajuan</h5>
                                                        <p class="mb-4">
                                                            Jumlah data yang diajukan :
                                                            <br><span style="font-size: 60px;"><?php $query_view1 = mysqli_query($connect, "SELECT * FROM tbl_jdl_pengajuan");
                                                                                                echo mysqli_num_rows($query_view1); ?></span>
                                                        </p>

                                                        <a href="pengajuan/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 mb-4 order-0">
                                        <div class="card">
                                            <div class="d-flex align-items-end row">
                                                <div class="col-sm-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title text-primary">Data Siswa</h5>
                                                        <p class="mb-4">
                                                            Jumlah siswa yang terdaftar :
                                                            <br><span style="font-size: 60px;"><?php $query_view5 = mysqli_query($connect, "SELECT * FROM tbl_siswa");
                                                                                                echo mysqli_num_rows($query_view5); ?></span>
                                                        </p>
                                                        <a href="siswa/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 mb-4 order-0">
                                        <div class="card">
                                            <div class="d-flex align-items-end row">
                                                <div class="col-sm-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title text-primary">Data Guru</h5>
                                                        <p class="mb-4">
                                                            Jumlah Guru yang terdaftar :
                                                            <br><span style="font-size: 60px;"><?php $query_view7 = mysqli_query($connect, "SELECT * FROM tbl_guru");
                                                                                                echo mysqli_num_rows($query_view7); ?></span>
                                                        </p>
                                                        <a href="guru/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 mb-4 order-0">
                                        <div class="card">
                                            <div class="d-flex align-items-end row">
                                                <div class="col-sm-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title text-primary">Data Admin</h5>
                                                        <p class="mb-4">
                                                            Jumlah admin yang terdaftar :
                                                            <br><span style="font-size: 60px;"><?php $query_view = mysqli_query($connect, "SELECT * FROM tbl_user");
                                                                                                echo mysqli_num_rows($query_view); ?></span>
                                                        </p>
                                                        <a href="admin/" class="btn btn-sm btn-outline-primary">Manage <i class="tf-icons bx bx-right-arrow-alt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                        <!-- / Content -->

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
        <script src="sneat/assets/vendor/libs/jquery/jquery.js"></script>
        <script src="sneat/assets/vendor/libs/popper/popper.js"></script>
        <script src="sneat/assets/vendor/js/bootstrap.js"></script>
        <script src="sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="sneat/assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->
        <script src="sneat/assets/vendor/libs/apex-charts/apexcharts.js"></script>

        <!-- Main JS -->
        <script src="sneat/assets/js/main.js"></script>

        <!-- Page JS -->
        <script src="sneat/assets/js/dashboards-analytics.js"></script>

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>
    <script>
        history.pushState(null, null, null);
        window.addEventListener('popstate', function() {
            history.pushState(null, null, null);
        });
    </script>

    </html>
<?php
} else {
    header("location: ../");
}
