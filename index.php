<?php 
include 'header.php';
?>
<!-- IMAGE -->
<div class="container-fluid" style="margin: 0;padding: 0;">
	<div class="col-4" style="margin-top: -21px">
		<div class="text-center">
		 <img src="image/home/image1.jpg" style="width: 90%;  height: 580px;">
		</div>

	</div>
</div>
<br>
<br>

<!-- PRODUK TERBARU -->
<div class="container">
    <h2 style="width: 100%; border-bottom: 4px solid #ff8680"><b>Produk Kami</b></h2>

    <div class="row">
        <?php 
        // Menggunakan prepared statement untuk mengambil data produk
        $stmt = $conn->prepare("SELECT * FROM produk");
        $stmt->execute();
        $result = $stmt->get_result();

        while ($row = mysqli_fetch_assoc($result)) {
            $_SESSION['produk_'.$row['kode_produk']] = $row['kode_produk'];
            ?>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img src="image/produk/<?= htmlspecialchars($row['image']); ?>" >
                    <div class="caption">
                        <h3><?= htmlspecialchars($row['nama']); ?></h3>
                        <h4>Rp.<?= number_format($row['harga']); ?></h4>
                        <div class="row">
                            <div class="col-md-6">
                                <a href="detail_produk.php?produk=<?= htmlspecialchars($row['kode_produk']); ?>" class="btn btn-warning btn-block">Detail</a> 
                            </div>
                            <?php if(isset($_SESSION['kd_cs'])){ ?>
                                <div class="col-md-6">
                                    <form method="post" action="proses/add.php">
                                        <input type="hidden" name="produk" value="<?= htmlspecialchars($row['kode_produk']); ?>">
                                        <input type="hidden" name="kd_cs" value="<?= htmlspecialchars($_SESSION['kd_cs']); ?>">
                                        <input type="hidden" name="hal" value="1">
                                        <button type="submit" class="btn btn-success btn-block"><i class="glyphicon glyphicon-shopping-cart"></i> Tambah</button>
                                    </form>
                                </div>
                                <?php 
                            }
                            else{
                                ?>
                                <div class="col-md-6">
                                    <a href="keranjang.php" class="btn btn-success btn-block" role="button"><i class="glyphicon glyphicon-shopping-cart"></i> Tambah</a>
                                </div>
                                <?php 
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php 
        }
        ?>
    </div>
</div>
<br>
<?php 
include 'footer.php';
?>