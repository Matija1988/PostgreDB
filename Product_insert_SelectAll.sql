INSERT INTO
	"Product" (
		"CategoryId",
		"Name",
		"Description",
		"PriceNoTax",
		"ProducerId",
		"WarehouseId",
		"TaxId"
	)
VALUES
	('1',
	'GeForce 1080Ti GTX',
	'GPU Engine Specs CUDA Cores 3584 Graphics Clock (MHz)1480 Processor Clock (MHz) 1582 Graphics Performance high-20000 Memory Specs Standard Memory Config 11 GB GDDR5X Memory Interface Width 352-bit Memory Bandwidth (GB/sec) 11 Gbps Feature Support Supported Technologies SLI, CUDA, 3D Vision, PhysX, NVIDIA G-SYNC™, Virtual Reality, DirectX 12, Ansel Thermal and Power Specs Maximum Graphics Card Power (W) 250',
	'150.00',
	'1',
	'1',
	'1'),
	(
	'2',
	'i7-13700k',
	'CPU Specifications Total Cores 16 Number of Performance-cores 8 Number of Efficient-cores 8 Total Threads 24 Max Turbo Frequency 5.40 GHz Intel® Turbo Boost Max Technology 3.0 Frequency ‡ 5.40 GHz Performance-core Max Turbo Frequency 5.30 GHz Efficient-core Max Turbo Frequency 4.20 GHz Performance-core Base Frequency3.40 GHz Efficient-core Base Frequency2.50 GHz Cache 30 MB Intel Smart Cache Total L2 Cache24 MB Processor Base Power 125 W Maximum Turbo Power 253 W Memory Specifications Max Memory Size (dependent on memory type) 128 GB Memory Types Up to DDR5 5600 MT/s Up to DDR4 3200 MT/s',
	'500.75',
	'2',
	'2',
	'1'),
	('1',
	'GeForce 4090Ti RTX',
	'GPU clock speed 2325 MHzvs1424.92 MHz Floating-point performance 93.24 TFLOPSvs13.78 TFLOPS Pixel rate 492.5 GPixel/svs105.94 GPixel/s VRAM 24GBvs8.19GB Texture rate 1457 GTexels/svs280.41 GTexels/s Effective memory speed 24000 MHzvs12045.55 MHz Maximum memory bandwidth 1152 GB/svs380.2 GB/s Memory bus width 384-bitvs243.49-bit',
	'1650.00',
	'1',
	'2',
	'1');

drop table "Product";

Truncate "ProductOrder", "WarehouseProduct", "Image", "Product" Restart identity;

select * from "Product";

Select * from "Category";

Select * from "Producer";	