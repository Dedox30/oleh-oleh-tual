

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
  PRIMARY KEY (`kode_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO customer VALUES("C0002","Rafi Akbar","a.rafy@gmail.com","rafi","$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.","0856748564");
INSERT INTO customer VALUES("C0003","Nagita Silvana","bambang@gmail.com","Nagita","$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C","087804616097");
INSERT INTO customer VALUES("C0004","Nadiya","nadiya@gmail.com","nadiya","$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG","0898765432");
INSERT INTO customer VALUES("C0005","Agus","agus@gmail.com","agus","$2y$10$nMpGeqG9bvq7HTnHR6TKjeTKkv7vOcXdaWtVsGT.YRzWSf671MiEO","+62812345678");
INSERT INTO customer VALUES("C0006","Dedy Sahuleka","dora@gmail.com","dedox","$2y$10$h1hNbKcWOp7c9617QBtNwe/45RdAW8WkUoeAKLcJkrZRLHH1b4osC","0812459734157");



CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`kode_bk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO inventory VALUES("M0001","Tepung","44","Kg","1000","2020-07-26");
INSERT INTO inventory VALUES("M0002","Pengembang","-6","Kg","1000","2020-07-27");
INSERT INTO inventory VALUES("M0003","Cream","7","Kg","3000","2020-07-26");
INSERT INTO inventory VALUES("M0004","Keju","58","Kg","4000","2020-07-26");
INSERT INTO inventory VALUES("M0005","Coklat","0","Kg","5000","2020-07-27");



CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

INSERT INTO keranjang VALUES("16","C0003","P0002","Maryam","5","15000");
INSERT INTO keranjang VALUES("17","C0003","P0003","Kue tart coklat","2","100000");
INSERT INTO keranjang VALUES("28","C0006","P0006","Piece Enbal","1","25000");



CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`kode_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO produk VALUES("P0001","Enbal","669dbd48e19fa.jpeg","																				Enbal dengsn varian rasas pisang
																																							","10000");
INSERT INTO produk VALUES("P0002","Enbal Crispy","669ca82fdf21f.jpg","																Enbal Stick Rulla
																					","25000");
INSERT INTO produk VALUES("P0003","Enbal Semprong","669ca84b7054f.jpg","												enbal semprong
															","20000");
INSERT INTO produk VALUES("P0004","Enbal Stick Rula","669ca86b83099.jpg","																				Enbal adalah makanan khas Tual yang terbuat dari singkong parut yang difermentasi dan dimasak dengan cara dipanggang. Embal memiliki tekstur yang kenyal dan rasa yang gurih.
																		","25000");
INSERT INTO produk VALUES("P0005","Enbal Stick","669ca8ca0c47f.jpg","								enbal stick
									","25000");
INSERT INTO produk VALUES("P0006","Piece Enbal","669ca8e777c7f.jpg","								Enbal dengan varian rasa kelapa
									","25000");
INSERT INTO produk VALUES("P0007","Enbal Kacang","669ca8f820bd0.jpg","								enbal dengan varian rasa kacang
									","20000");
INSERT INTO produk VALUES("P0008","Enbal Crispy","669b69a20c65a.jpg","Enbal dengan rasa varian crispy
			","25000");



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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

INSERT INTO produksi VALUES("8","INV0001","C0002","P0003","Kue tart coklat","1","100000","Pesanan Baru","2020-07-27","Jawa Timur","Surabaya","Jl.Tanah Merah Indah 1","60129","2","1","0");
INSERT INTO produksi VALUES("9","INV0002","C0002","P0001","Roti Sobek","3","10000","0","2020-07-27","Jawa Barat","Bandung","Jl.Jati Nangor Blok C, 10","30712","1","0","1");
INSERT INTO produksi VALUES("10","INV0003","C0003","P0002","Maryam","2","15000","0","2020-07-27","Jawa Tengah","Yogyakarta","Jl.Malioboro, Blok A 10D","30123","1","0","0");
INSERT INTO produksi VALUES("11","INV0003","C0003","P0003","Kue tart coklat","1","100000","0","2020-07-27","Jawa Tengah","Yogyakarta","Jl.Malioboro, Blok A 10D","30123","1","0","0");
INSERT INTO produksi VALUES("12","INV0003","C0003","P0001","Roti Sobek","1","10000","0","2020-07-27","Jawa Tengah","Yogyakarta","Jl.Malioboro, Blok A 10D","30123","1","0","0");
INSERT INTO produksi VALUES("13","INV0004","C0004","P0002","Maryam","1","15000","0","2020-07-26","Jawa Timur","Sidoarjo","Jl.KH Syukur Blok C 18 A","50987","1","0","0");
INSERT INTO produksi VALUES("14","INV0005","C0005","P0001","Roti Sobek","1","10000","Pesanan Baru","2323-07-15","Jawa Barat","Bandung","Ujung Berung","40397","0","0","1");
INSERT INTO produksi VALUES("15","INV0006","C0006","P0004","Embal","1","10000","Pesanan Baru","2424-07-11","maluku","ambon","kelurahan benteng","97111","2","1","0");
INSERT INTO produksi VALUES("16","INV0007","C0006","P0004","Embal","2","10000","Pesanan Baru","2424-07-11","Maluku Utara","Ternate","Ternate","95111","2","1","0");
INSERT INTO produksi VALUES("17","INV0008","C0006","P0004","Embal","2","10000","Pesanan Baru","2424-07-20","Maluku","Ambon","OSM","97112","2","1","0");
INSERT INTO produksi VALUES("18","INV0009","C0006","P0002","Maryam","3","15000","0","2424-07-20","Maluku","Ambon","OSM","97112","1","0","0");
INSERT INTO produksi VALUES("19","INV0010","C0006","P0002","Enbal Crispy","1","25000","0","2424-07-23","Maluku","Ambon","karpan","97112","1","0","0");



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


