<?php 
include '../koneksi/koneksi.php';

session_start(); // Pastikan session dimulai
$hal = $_POST['hal'];
$kode_cs = $_POST['kd_cs'];
$kode_produk = $_POST['produk'];
if(isset($_POST['jml'])){
    $qty = $_POST['jml'];
}

// Validasi input
if(!isset($_SESSION['produk_'.$kode_produk]) || $kode_produk !== $_SESSION['produk_'.$kode_produk]) {
    die('Produk tidak valid.');
}

$stmt = $conn->prepare("SELECT * FROM produk WHERE kode_produk = ?");
$stmt->bind_param("s", $kode_produk);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

if(!$row) {
    die('Produk tidak ditemukan.');
}

$nama_produk = $row['nama'];
$kd = $row['kode_produk'];
$harga = $row['harga'];

if($hal == 1){
    $cek = $conn->prepare("SELECT * from keranjang where kode_produk = ? and kode_customer = ?");
    $cek->bind_param("ss", $kode_produk, $kode_cs);
    $cek->execute();
    $result_cek = $cek->get_result();
    $jml = $result_cek->num_rows;
    $row1 = $result_cek->fetch_assoc();
    if($jml > 0){
        $set = $row1['qty'] + 1;
        $update = $conn->prepare("UPDATE keranjang SET qty = ? WHERE kode_produk = ? and kode_customer = ?");
        $update->bind_param("iss", $set, $kode_produk, $kode_cs);
        if($update->execute()){
            echo "
            <script>
            alert('BERHASIL DITAMBAHKAN KE KERANJANG');
            window.location = '../keranjang.php';
            </script>
            ";
            die;
        }
    }else{
        $insert = $conn->prepare("INSERT INTO keranjang (kode_customer, kode_produk, nama_produk, qty, harga) VALUES (?, ?, ?, ?, ?)");
        $qty_default = 1;
        $insert->bind_param("sssii", $kode_cs, $kd, $nama_produk, $qty_default, $harga);
        if($insert->execute()){
            echo "
            <script>
            alert('BERHASIL DITAMBAHKAN KE KERANJANG');
            window.location = '../keranjang.php';
            </script>
            ";
            die;
        }
    }
}else{
    $cek = $conn->prepare("SELECT * from keranjang where kode_produk = ? and kode_customer = ?");
    $cek->bind_param("ss", $kode_produk, $kode_cs);
    $cek->execute();
    $result_cek = $cek->get_result();
    $jml = $result_cek->num_rows;
    $row1 = $result_cek->fetch_assoc();
    if($jml > 0){
        $set = $row1['qty'] + $qty;
        $update = $conn->prepare("UPDATE keranjang SET qty = ? WHERE kode_produk = ? and kode_customer = ?");
        $update->bind_param("iss", $set, $kode_produk, $kode_cs);
        if($update->execute()){
            echo "
            <script>
            alert('BERHASIL DITAMBAHKAN KE KERANJANG');
            window.location = '../detail_produk.php?produk=".$kode_produk."';
            </script>
            ";
            die;
        }
    }else{
        $insert = $conn->prepare("INSERT INTO keranjang (kode_customer, kode_produk, nama_produk, qty, harga) VALUES (?, ?, ?, ?, ?)");
        $insert->bind_param("sssii", $kode_cs, $kd, $nama_produk, $qty, $harga);
        if($insert->execute()){
            echo "
            <script>
            alert('BERHASIL DITAMBAHKAN KE KERANJANG');
            window.location = '../detail_produk.php?produk=".$kode_produk."';
            </script>
            ";
            die;
        }
    }
}
?>
