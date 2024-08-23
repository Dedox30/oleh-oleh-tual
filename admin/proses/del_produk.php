<?php 
include '../../koneksi/koneksi.php';

// Mengambil data kode yang dikirim melalui POST
$kode = $_POST['kode'];

// Mencegah SQL Injection
$kode = mysqli_real_escape_string($conn, $kode);

// Ambil data produk berdasarkan kode
$produk = mysqli_query($conn, "SELECT * FROM produk WHERE kode_produk = '$kode'");
$row = mysqli_fetch_assoc($produk);

// Hapus file gambar produk jika ada
if ($row && file_exists("../../image/produk/" . $row['image'])) {
    unlink("../../image/produk/" . $row['image']);
} else {
    echo "
    <script>
    alert('File gambar tidak ditemukan atau data produk tidak ada');
    window.location = '../m_produk.php';
    </script>
    ";
    exit;
}

// Hapus data dari tabel bom_produk dan produk
mysqli_query($conn, "DELETE FROM bom_produk WHERE kode_produk = '$kode'");
$del = mysqli_query($conn, "DELETE FROM produk WHERE kode_produk = '$kode'");

// Periksa apakah ada baris yang terhapus
if(mysqli_affected_rows($conn) > 0){
    echo "
    <script>
    alert('DATA BERHASIL DIHAPUS');
    window.location = '../m_produk.php';
    </script>
    ";
} else {
    // Tampilkan pesan error jika penghapusan gagal
    echo "
    <script>
    alert('GAGAL MENGHAPUS DATA');
    window.location = '../m_produk.php';
    </script>
    ";
    echo "Error: " . mysqli_error($conn);
    exit;
}

?>
