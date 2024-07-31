<?php 
include 'header.php';
?>

<div class="container">
    <h2 style="width: 100%; border-bottom: 4px solid gray"><b>Master Produk</b></h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Kode Produk</th>
                <th scope="col">Nama Produk</th>
                <th scope="col">Image</th>
                <th scope="col">Harga</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $result = mysqli_query($conn, "SELECT * FROM produk");
            $no = 1;
            while ($row = mysqli_fetch_assoc($result)) {
            ?>
                <tr>
                    <td><?= $no; ?></td>
                    <td><?= $row['kode_produk']; ?></td>
                    <td><?= $row['nama']; ?></td>
                    <td><img src="../image/produk/<?= $row['image']; ?>" width="100"></td>
                    <td>Rp.<?= number_format($row['harga']); ?></td>
                    <td>
                        <!-- Form untuk Edit Produk -->
                        <form action="edit_produk.php" method="POST" style="display:inline;">
                            <input type="hidden" name="kode" value="<?= $row['kode_produk']; ?>">
                            <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i></button>
                        </form>
                        
                        <!-- Form untuk Hapus Produk -->
                        <form action="proses/del_produk.php" method="POST" style="display:inline;">
                            <input type="hidden" name="kode" value="<?= $row['kode_produk']; ?>">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menghapus Data?')"><i class="glyphicon glyphicon-trash"></i></button>
                        </form>
                        
                        <!-- Link untuk BOM Produk -->
                      
                    </td>
                </tr>
            <?php
                $no++;
            }
            ?>
        </tbody>
    </table>
    <a href="tm_produk.php" class="btn btn-success"><i class="glyphicon glyphicon-plus-sign"></i> Tambah Produk</a>
</div>

<?php 
include 'footer.php';
?>
