<?php 
include '../koneksi/koneksi.php';

// Mengambil kode terakhir dari database
$kode = mysqli_query($conn, "SELECT kode_customer from customer order by kode_customer desc");
if (!$kode) {
    die('Query Failed: ' . mysqli_error($conn));
}
$data = mysqli_fetch_assoc($kode);
$num = substr($data['kode_customer'], 1, 4);
$add = (int) $num + 1;

if(strlen($add) == 1){
    $format = "C000".$add;
} else if(strlen($add) == 2){
    $format = "C00".$add;
} else if(strlen($add) == 3){
    $format = "C0".$add;
} else {
    $format = "C".$add;
}

// Mengambil data dari form
$nama = $_POST['nama'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$tlp = $_POST['telp'];
$konfirmasi = $_POST['konfirmasi'];

// Mengenkripsi password
$hash = password_hash($password, PASSWORD_DEFAULT);

if ($password == $konfirmasi) {
    // Memeriksa apakah username sudah digunakan
    $cek = mysqli_query($conn, "SELECT username from customer where username = '$username'");
    if (!$cek) {
        die('Query Failed: ' . mysqli_error($conn));
    }
    $jml = mysqli_num_rows($cek);

    if ($jml == 1) {
        echo "
        <script>
        alert('USERNAME SUDAH DIGUNAKAN');
        window.location = '../register.php';
        </script>
        ";
        die;
    }

    // Memasukkan data ke database
    $result = mysqli_query($conn, "INSERT INTO customer (kode_customer, nama, email, username, password, telp) VALUES('$format','$nama', '$email', '$username', '$hash', '$tlp')");
    var_dump($result); // Menampilkan hasil query
    if (!$result) {
        die('Query Failed: ' . mysqli_error($conn));
    }

    if ($result) {
        echo "
        <script>
        alert('REGISTER BERHASIL');
        window.location = '../user_login.php';
        </script>
        ";
    }
} else {
    echo "
    <script>
    alert('KONFIRMASI PASSWORD TIDAK SAMA');
    window.location = '../register.php';
    </script>
    ";
}
?>
