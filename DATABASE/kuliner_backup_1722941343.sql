

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO admin VALUES("1","admin","$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626");



CREATE TABLE `bom_produk` (
  `kode_bom` varchar(100) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

INSERT INTO bom_produk VALUES("B0001","M0002","P0001","Roti Sobek","2");
INSERT INTO bom_produk VALUES("B0001","M0001","P0001","Roti Sobek","4");
INSERT INTO bom_produk VALUES("B0001","M0004","P0001","Roti Sobek","3");
INSERT INTO bom_produk VALUES("B0002","M0001","P0002","Maryam","4");
INSERT INTO bom_produk VALUES("B0002","M0004","P0002","Maryam","3");
INSERT INTO bom_produk VALUES("B0002","M0003","P0002","Maryam","2");
INSERT INTO bom_produk VALUES("B0003","M0002","P0003","Kue tart coklat","2");
INSERT INTO bom_produk VALUES("B0003","M0003","P0003","Kue tart coklat","5");
INSERT INTO bom_produk VALUES("B0003","M0005","P0003","Kue tart coklat","5");



CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`kode_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO customer VALUES("C0002","Rafi Akbar","a.rafy@gmail.com","rafi","$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.","0856748564","user");
INSERT INTO customer VALUES("C0003","Nagita Silvana","bambang@gmail.com","Nagita","$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C","087804616097","user");
INSERT INTO customer VALUES("C0004","Nadiya","nadiya@gmail.com","nadiya","$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG","0898765432","user");
INSERT INTO customer VALUES("C0005","Agus","agus@gmail.com","agus","$2y$10$nMpGeqG9bvq7HTnHR6TKjeTKkv7vOcXdaWtVsGT.YRzWSf671MiEO","+62812345678","user");
INSERT INTO customer VALUES("C0006","Dedy Sahuleka","dora@gmail.com","dedox","$2y$10$h1hNbKcWOp7c9617QBtNwe/45RdAW8WkUoeAKLcJkrZRLHH1b4osC","0812459734157","user");



CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`kode_bk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO inventory VALUES("M0001","Embal","9999963","pcs","10000","2024-08-06");
INSERT INTO inventory VALUES("M0002","Enbal Crispy","899984","pcs","25000","2024-08-06");
INSERT INTO inventory VALUES("M0003","Enbal Semprong","9999983","pcs","20000","2024-08-06");
INSERT INTO inventory VALUES("M0004","Enbal Stick Rula","99999972","pcs","25000","2024-08-06");
INSERT INTO inventory VALUES("M0005","Enbal Stick","899990","pcs","25000","2024-08-06");



CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

INSERT INTO keranjang VALUES("16","C0003","P0002","Maryam","5","15000");
INSERT INTO keranjang VALUES("17","C0003","P0003","Kue tart coklat","2","100000");
INSERT INTO keranjang VALUES("40","C0090","","","1","0");
INSERT INTO keranjang VALUES("55","C0007","P0001","Enbal","1","10000");
INSERT INTO keranjang VALUES("56","C00010","P0001","Enbal","1","10000");
INSERT INTO keranjang VALUES("57","C00090","P0001","Enbal","1","10000");
INSERT INTO keranjang VALUES("58","C00091","P0001","Enbal","3","10000");



CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO produk VALUES("P0001","Enbal","669dbd48e19fa.jpeg","Enbal adalah makanan khas Tual yang terbuat dari singkong parut yang difermentasi dan dimasak dengan cara dipanggang. Embal memiliki tekstur yang kenyal dan rasa yang gurih.
																																										","10000");
INSERT INTO produk VALUES("P0002","Enbal Crispy","669ca82fdf21f.jpg","																Enbal Stick Rulla
																					","25000");
INSERT INTO produk VALUES("P0003","Enbal Semprong","669ca84b7054f.jpg","												enbal semprong
															","20000");
INSERT INTO produk VALUES("P0004","Enbal Stick Rula","669ca86b83099.jpg","Enbal stick dengan varian rasa gula merah
																					","25000");
INSERT INTO produk VALUES("P0005","Enbal Stick","669ca8ca0c47f.jpg","								enbal stick
									","25000");
INSERT INTO produk VALUES("P0006","Piece Enbal","669ca8e777c7f.jpg","								Enbal dengan varian rasa kelapa
									","25000");
INSERT INTO produk VALUES("P0007","Enbal Kacang","669ca8f820bd0.jpg","								enbal dengan varian rasa kacang
									","20000");
INSERT INTO produk VALUES("P0008","gula gula","66a21f803de82.jpg","dhdjd
			","1200");



CREATE TABLE `produksi` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

INSERT INTO produksi VALUES("15","INV0006","C0006","P0004","Embal","1","10000","Pesanan Baru","2424-07-11","maluku","ambon","kelurahan benteng","97111","2","1","0");
INSERT INTO produksi VALUES("16","INV0007","C0006","P0004","Embal","2","10000","Pesanan Baru","2424-07-11","Maluku Utara","Ternate","Ternate","95111","2","1","0");
INSERT INTO produksi VALUES("17","INV0008","C0006","P0004","Embal","2","10000","Pesanan Baru","2424-07-20","Maluku","Ambon","OSM","97112","2","1","0");
INSERT INTO produksi VALUES("18","INV0009","C0006","P0002","Maryam","3","15000","0","2424-07-20","Maluku","Ambon","OSM","97112","1","0","0");
INSERT INTO produksi VALUES("19","INV0010","C0006","P0002","Enbal Crispy","1","25000","0","2424-07-23","Maluku","Ambon","karpan","97112","1","0","0");
INSERT INTO produksi VALUES("20","INV0011","C0006","P0006","Piece Enbal","1","25000","0","2424-07-24","Maluku","Ambon","karpan","97112","1","0","0");
INSERT INTO produksi VALUES("21","INV0011","C0006","P0002","Enbal Crispy","1","25000","0","2424-07-24","Maluku","Ambon","karpan","97112","1","0","0");
INSERT INTO produksi VALUES("22","INV0011","C0006","P0007","Enbal Kacang","1","20000","0","2424-07-24","Maluku","Ambon","karpan","97112","1","0","0");
INSERT INTO produksi VALUES("23","INV0012","C0006","P0001","Enbal","4","10000","0","2424-07-24","Maluku","Ambon","Batu Merah","97814","1","0","0");
INSERT INTO produksi VALUES("24","INV0012","C0006","P0002","Enbal Crispy","2","25000","0","2424-07-24","Maluku","Ambon","Batu Merah","97814","1","0","0");
INSERT INTO produksi VALUES("25","INV0012","C0006","P0006","Piece Enbal","1","25000","0","2424-07-24","Maluku","Ambon","Batu Merah","97814","1","0","0");
INSERT INTO produksi VALUES("26","INV0012","C0006","P0007","Enbal Kacang","3","20000","0","2424-07-24","Maluku","Ambon","Batu Merah","97814","1","0","0");
INSERT INTO produksi VALUES("27","INV0013","C0006","P0003","Enbal Semprong","1","20000","0","2424-07-24","Maluku","Ambon","Batu Merah","97814","1","0","0");
INSERT INTO produksi VALUES("28","INV0014","C0006","P0005","Enbal Stick","1","25000","Pesanan Baru","2424-07-24","Maluku","Ambon","Mangga Dua","97112","2","1","0");
INSERT INTO produksi VALUES("29","INV0015","C0006","","","1","0","Pesanan Baru","2424-07-24","Maluku","1","1","1","0","0","0");
INSERT INTO produksi VALUES("30","INV0015","C0006","","","1","0","Pesanan Baru","2424-07-24","Maluku","1","1","1","0","0","0");
INSERT INTO produksi VALUES("31","INV0016","C0006","P0008","gula gula","1","1200","Pesanan Baru","2424-07-31","Ambon","Ambon","Jln dr malaiholo","97111","0","0","0");
INSERT INTO produksi VALUES("32","INV0016","C0006","P0005","Enbal Stick","1","25000","Pesanan Baru","2424-07-31","Ambon","Ambon","Jln dr malaiholo","97111","0","0","0");
INSERT INTO produksi VALUES("33","INV0016","C0006","P0004","Enbal Stick Rula","1","25000","Pesanan Baru","2424-07-31","Ambon","Ambon","Jln dr malaiholo","97111","0","0","0");
INSERT INTO produksi VALUES("34","INV0017","C0006","P0002","Enbal Crispy","1","25000","0","2424-08-06","Ambon","Ambon","Jln dr malaiholo","97111","1","0","0");
INSERT INTO produksi VALUES("35","INV0017","C0006","P0003","Enbal Semprong","1","20000","0","2424-08-06","Ambon","Ambon","Jln dr malaiholo","97111","1","0","0");
INSERT INTO produksi VALUES("36","INV0017","C0006","P0004","Enbal Stick Rula","1","25000","0","2424-08-06","Ambon","Ambon","Jln dr malaiholo","97111","1","0","0");
INSERT INTO produksi VALUES("37","INV0017","C0006","P0005","Enbal Stick","1","25000","0","2424-08-06","Ambon","Ambon","Jln dr malaiholo","97111","1","0","0");
INSERT INTO produksi VALUES("38","INV0017","C0006","P0001","Enbal","2","10000","0","2424-08-06","Ambon","Ambon","Jln dr malaiholo","97111","1","0","0");



;




CREATE TABLE `report_cancel` (
  `id_report_cancel` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_cancel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE `report_inventory` (
  `id_report_inv` int(11) NOT NULL AUTO_INCREMENT,
  `kode_bk` varchar(100) NOT NULL,
  `nama_bahanbaku` varchar(100) NOT NULL,
  `jml_stok_bk` int(11) NOT NULL,
  `tanggal` varchar(11) NOT NULL,
  PRIMARY KEY (`id_report_inv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE `report_omset` (
  `id_report_omset` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_omset` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_omset`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE `report_produksi` (
  `id_report_prd` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_prd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE `report_profit` (
  `id_report_profit` int(11) NOT NULL AUTO_INCREMENT,
  `kode_bom` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(11) NOT NULL,
  `total_profit` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_report_profit`),
  UNIQUE KEY `kode_bom` (`kode_bom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


