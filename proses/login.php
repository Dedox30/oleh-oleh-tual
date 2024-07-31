<?php 
session_start();
include '../koneksi/koneksi.php';

$username = $_POST['user'];
$pass = $_POST['pass'];

// Cek login admin
$result_admin = mysqli_query($conn, "SELECT * FROM admin WHERE username = '$username'");
$row_admin = mysqli_fetch_assoc($result_admin);
var_dump($row_admin);
if ($row_admin) {
    // Jika ditemukan di tabel admin
    if (password_verify($pass, $row_admin['password'])) {
        $_SESSION["admin"] = true;
        header('Location: ../admin/halaman_utama.php'); // Arahkan ke halaman admin
        exit;
    } else {
        echo "
        <script>
        alert('USERNAME/PASSWORD SALAH');
        window.location = '../index.php';
        </script>
        ";
        die;
    }
}

// Cek login customer
$result_customer = mysqli_query($conn, "SELECT * FROM customer WHERE username = '$username'");
$row_customer = mysqli_fetch_assoc($result_customer);


if ($row_customer) {
    // Jika ditemukan di tabel customer
    if (password_verify($pass, $row_customer['password'])) {
        $_SESSION["user"] = $row_customer['nama'];
        $_SESSION["kd_cs"] = $row_customer['kode_customer'];
        $_SESSION["role"] = 'user'; // Set role untuk customer
        header('Location: ../index.php'); // Arahkan ke halaman pengguna
        exit;
    } else {
        echo "
        <script>
        alert('USERNAME/PASSWORD SALAH');
        window.location = '../index.php';
        </script>
        ";
        die;
    }
}

// Jika tidak ada kecocokan
echo "
<script>
alert('USERNAME/PASSWORD SALAH');
window.location = '../index.php';
</script>
";
die;
?>
