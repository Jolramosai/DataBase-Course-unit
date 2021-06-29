-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
USE Project_database;

INSERT INTO City
	(Id, City)
    VALUES
    (1, 'Braga'),
    (2, 'Lisboa'),
    (3, 'Porto'),
    (4, 'Guimarães'),
    (5, 'Viana do Castelo'),
    (6, 'Vila do Conde'),
    (7, 'Funchal'),
    (8, 'Évora'),
    (9, 'Viseu');
   
INSERT INTO Address
	(Id , Postal_Code,	Street,					House_Number, City_Id)
	VALUES 
		(1,'4230-223', 'Rua das Quintas',		13,		1),
		(2,'4240-234', 'Primeira rua',			19,		2),
		(3,'4222-340', 'Avenida dos Congregados',5,		3),
		(4,'4315-120', 'Rua de Santa-Marta',	12,		1),
		(5,'4903-090', 'Segunda Rua',			21,		1),
		(6,'4020-890', 'Avenida das ameixas',	9,		3),
		(7,'4730-710', 'Rua do lado',			4,		9),
		(8,'4330-100', 'Avenida Pimenta',		120,	1),
		(9,'4044-220', 'Rua do meio',			18,		2),
		(10,'4208-310','Rua torta', 			31,		4);
-- 		(11,'4195-520', 'Rua ao lado da praia',	25,		7),
-- 		(12,'4200-180', 'Avenida Mondela',		194,	8),
-- 		(13,'4443-020', 'Avenida do Hospital',	116,	4),
-- 		(14,'4101-033', 'Rua Verde',			23,		1);
-- Povoamento da tabela "Cliente"
INSERT INTO Customer
		(Id, First_Name, Last_Name, Email, 					Date_of_Birth, 	NIB, 	Address_Id)
	VALUES 
		(1,	'António',	'Ramalho',	'ramas@gmail.com',		'1980/03/10',	495031257,2),
		(2,	'Tomas',	'Taveira',	'totavas@gmail.com',	'1975/07/25',	454738342,2),
		(3,	'Rui',		'Torres',	'rTorres2000@gmail.com','2000/01/17',	365672511,8),
		(4,	'André',	'Carvalho',	'andcarva@gmail.com',	'1993/08/02',	035645301,3),
		(5,	'Lionel',	'Pereira',	'lionira@gmail.com',	'1990/12/30',	446563304,9),
		(6,	'Bruna',	'Ribeiro',	'brRibeiro@gmail.com',	'1990/08/10',	498491264,1),
		(7,	'Tommie',	'Waever',	'tWeave@gmail.com',		'1985/02/04',	396134274,1),
		(8,	'Francisco','Azevedo',	'xico25Az@gmail.com',	'1991/10/25',	457057832,4),
		(9,	'José',		'Fontes',	'joFont24@gmail.com',	'1980/08/24',	420841211,2),
		(10,'Lionel',	'Silva',	'lionSil13@gmail.com',	'1992/12/13',	390278223,6),
        (11,'Cristiano','Ronaldo',	'sii@amail.com',		'1985/09/10',	254180787,7),
		(12,'Jorge',	'Jesus',	'trident@bmail.com',	'1971/02/25',	454738352,6),
		(13,'José',		'Sócrates',	'autoestrada@cmail.com','2020/05/27',	365672625,5),
		(14,'Sá',		'Pinto',	'porrada@dmail.com',	'1973/01/24',	133701337,10),
		(15,'Rita',		'Catita',	'ritinha123@email.com',	'1994/11/10',	123456789,5);
        
INSERT INTO Phone
	(Customer_Id, Phone_Number)
	VALUES 
		(1, 223244561 ),
		(2, 253601105 ),
		(3, 223241231 ),
		(4, 920223123 ),
		(5, 912444544 ),
		(6, 242345679 ),
		(7, 218345732 ),
		(8, 920284349 ),
		(9, 939475618 ),
		(10, 962581891 ),
		(10, 911234092 ),
		(11, 961238257 ),
		(11, 923459989 ),
		(12, 962843849 ),
		(12, 915758282 ),
		(13, 964728123 ),
		(13, 253601154 ),
		(13, 223561363 );

INSERT INTO Sale
	(Id, Total, Date_Sold, Customer_Id)
	VALUES 
		(1, 210.99,'2018/09/12',2),
        (2, 1169.98,'2018/09/12',2),
        (3, 47.99,'2018/11/02',2),
        (4, 199.99,'2018/09/12',11),
		(5, 19.99,'2018/07/12',1),
		(6, 30.99,'2018/06/18',10),
		(7, 129.99,'2018/11/18',13),
        (8, 615.00,'2018/11/20',7),
		(9, 64.99,'2018/10/09',9),
        (10, 859.99,'2018/09/12',3),       
        (11, 445.00, '2018/09/12',4),
        (12, 240.98,'2018/09/12',12),
        (13, 99.99,'2018/11/02',6),
        (14, 99.09,'2018/09/12',5),
		(15, 29.99,'2018/07/12',4),
		(16, 129.99,'2018/06/18',14),
		(17, 110.99,'2018/11/18',14),
        (18, 445.00,'2018/11/20',9),
		(19, 39.99,'2018/10/09',8),
		(20, 110.99,'2018/09/12',15);


INSERT INTO Product
		(Bar_Code, Product_Type,		 Brand, 		Model, 				Color,			MSRP, Price, Release_Date, Average_Rating, Sale_Id, Aditional_Description)
	VALUES 
		(1,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'Red',			69.99,	49.99,	'2016/09/20',4.5,			null, 	'Red SAMSUNG GPU'),
        (2,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'Blue',			69.99,	49.99,	'2016/09/20',4.5,			null, 	'Blue SAMSUNG GPU'),
        (3,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'Green',		69.99,	49.99,	'2016/09/20',4.5,			null, 	'Green SAMSUNG GPU'),
        (4,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'Black',		69.99,	49.99,	'2016/09/20',4.5,			null, 	'Black SAMSUNG GPU'),
        (5,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'Brown',		69.99,	49.99,	'2016/09/20',4.5,			null, 	'Brown SAMSUNG GPU'),
        (6,		'Graphics Card',	'SAMSUNG',		'SP1D3R1',				'White',		69.99,	49.99,	'2016/09/20',4.5,			null, 	'White SAMSUNG GPU'),
        (7,		'Graphics Card',	'NVIDIA',		'GeForce GTX 1080 Ti',	'Grey',			599.99,	615.00,	'2017/03/10',4.8,			8, 		'expensive but worth it'),
		(8,		'Graphics Card',	'NVIDIA',		'GeForce GTX 1070',		'Red',			332.99,	340.00,	'2016/06/10',4.2,			null, 	'good value'),
		(9,		'Graphics Card',	'NVIDIA',		'GeForce RTX 2080 Ti',	'Blue',			869.99,	880.00,	'2018/09/20',4.5,			2, 		'waste of money'),
		(10,	'Graphics Card',	'AMD',			'Radeon RX 580G',		'Red',			449.99,	445.00,	'2018/10/15',4.4,			18, 	'Decent'),
		(11,	'Graphics Card',	'AMD',			'Radeon RX Vega 64',	'Orange',		779.90,	750.90,	'2017/08/07',4.5,			null, 	'Manly GPU'),
        (12,	'Sound Card',		'WesternBold',	'AXE42',				'Red',			19.99,	19.99,	'2016/09/16',4.0,			5, 		null),
        (13,	'Sound Card',		'WesternBold',	'AXE42',				'Blue',			39.99,	29.99,	'2016/09/20',4.0,			null, 	null),
        (14,	'Sound Card',		'WesternBold',	'AXE42',				'Black',		39.99,	29.99,	'2016/09/20',4.0,			null, 	null),
        (15,	'Sound Card',		'WesternBold',	'AXE42',				'Green',		39.99,	39.99,	'2016/09/20',4.0,			19, 	null),
        (16,	'CPU',				'DataQuill',	'INK323-b',				'Blue',			129.99,	129.99,	'2016/09/20',4.5,			12, 	null),
		(17,	'CPU',				'DataQuill',	'INK323-b',				'Red',			129.99,	129.99,	'2016/09/20',4.5,			7, 		null),
		(18,	'CPU',				'DataQuill',	'INK323-b',				'Black',		129.99,	129.99,	'2016/09/20',4.5,			16, 	null),
        (19,	'Sound Card',		'OceanGate',	'ATL53-R',				'Black',		29.99,	29.99,	'2016/09/20',3.5,			null, 	null),
        (20,	'Sound Card',		'SouthSide',	'X1342',				'Black',		29.99,	29.99,	'2016/09/20',3.5,			15, 	null),
        (21,	'Sound Card',		'DataQuill',	'INK323-S',				'White',		29.99,	29.99,	'2016/09/20',3.5,			null, 	null),
        (22,	'Cooling',			'SouthSide',	'AXE43',				'Gold',			119.99,	114.99,	'2016/09/20',4.5,			null, 	null),
        (23,	'Cooling',			'SouthSide',	'INK323-Premium',		'Gold',			119.99,	119.99,	'2016/09/20',4.5,			null, 	null),
        (24,	'Motherboard',		'SAMSUNG',		'INK323-Premium',		'Red',			199.99,	199.99,	'2016/09/20',5.0,			4, 		null),
        (25,	'Motherboard',		'SAMSUNG',		'INK323-Premium',		'Blue',			199.99,	199.99,	'2016/09/20',5.0,			null, 	null),
        (26,	'Graphics Card',	'NVIDIA',		'GeForce GTX 1080 Ti',	'Grey',			599.99,	599.99,	'2017/03/10',4.8,			null, 	null),
		(27,	'Graphics Card',	'NVIDIA',		'GeForce GTX 1070',		'Red',			339.99,	340.00,	'2016/06/10',4.2,			null, 	null),
		(28,	'Graphics Card',	'NVIDIA',		'GeForce RTX 2080 Ti',	'Blue',			869.99,	859.99,	'2018/09/20',4.5,			10, 	null),
		(29,	'Graphics Card',	'AMD',			'AMD Radeon RX 580G',	'Red',			449.99,	445.00,	'2018/10/15',4.4,			11, 	null),
		(30,	'Graphics Card',	'AMD',			'Radeon RX Vega 64',	'Orange',		779.90,	750.90,	'2017/08/07',4.5,			null, 	null),
		(31,	'Motherboard',		'Asus',			'Prime Z370-A',			'Black',		159.99,	140.00,	'2017/10/05',4.7,			null, 	null),
		(32,	'Motherboard',		'Asus',			'STRIX B350-F',			'Purple',		109.99,	100.00,	'2017/06/01',4.8,			1, 		null),
		(33,	'Motherboard',		'Gigabyte',		'X470 AORUS',			'Orange',		99.99,	109.99,	'2018/04/14',4.7,			null, 	null),
		(34,	'Motherboard',		'Gigabyte',		'B450M',				'Grey',			69.99,	79.99,	'2018/07/26',4.3,			2, 		null),
		(35,	'Motherboard',		'MSI',			'B450 TOMAHAWK',		'Red',			109.9,	110.63,	'2018/07/25',4.8,			1, 		null),
		(36,	'Storage',			'Seagate',		'Barracuda',			'Green',		39.99,	47.99,	'2016/06/13',4.3,			3, 		null),
		(37,	'Storage',			'Seagate',		'IronWolf',				'Green',		49.99,	60.99,	'2017/02/19',4.5,			null, 	null),
		(38,	'Storage',			'WD',			'VelociRaptor',			'Black',		54.99,	64.99,	'2016/08/20',4.5,			9, 		null),
		(39,	'Storage',			'WD',			'Blue',					'Blue',			21.99,	31.99,	'2017/04/30',4.4,			null, 	null),
		(40,	'Storage',			'Toshiba',		'X300',					'Grey',			109.99,	110.99,	'2017/10/16',4.7,			12,		null),
		(41,	'Cooling',			'Cooler Master','RR-212L-16PR-R1',		'Red',			34.99,	24.95,	'2016/08/13',4.4,			null,	null),
		(42,	'Cooling',			'Noctua',		'NH-D15',				'Brown',		99.99,	85.95,	'2014/04/08',4.8,			null,	null),
		(43,	'Cooling',			'Kraken',		'NZXT ',				'Black',		34.99,	30.99,	'2017/05/10',4.3,			6, 		null),
		(44,	'Cooling',			'Corsair',		'Hydro Series H100i v2','Grey',			129.99,	94.09,	'2016/01/04',3.7,			null, 	null),
		(45,	'Cooling',			'NZXT',			'Kraken RL-KRX62-02',	'Purple',		159.99,	145.99,	'2017/03/02',4.0,			null,	null),
		(46,	'CPU',				'AMD',			'RYZEN 7 1800X',		'Grey',			249.99,	209.99,	'2017/07/25',4.8,			2, 		'Team red'),
        (47,	'CPU',				'AMD',			'RYZEN 7 1700X',		'Grey',			229.99,	229.99,	'2017/07/25',4.7,			null, 	'Team red'),
		(48,	'CPU',				'AMD',			'RYZEN 7 1600X',		'Grey',			179.99,	179.99,	'2017/07/25',4.6,			null, 	'Team red'),
		(49,	'CPU',				'AMD',			'RYZEN 7 1500X',		'Grey',			165.99,	169.99,	'2017/07/25',4.5,			null, 	'Team red'),
		(50,	'CPU',				'AMD',			'RYZEN 7 1400X',		'Grey',			109.99,	110.99,	'2017/07/25',4.4,			17, 	'Team red'),
		(51,	'Case',				'FractalDesign','Nano Define S',		'Red',			34.99,	24.95,	'2018/08/14',4.4,			null, 	'Scandinavian box'),
		(52,	'Case',				'NOX',			'Hummer ATX',			'Brown',		99.99,	85.95,	'2014/04/08',4.8,			null, 	'Cheap box made in China'),
		(53,	'Case',				'Corsair',		'Crystal ATX',			'Black',		35.97,	30.99,	'2017/08/10',4.3,			null, 	'Pirate black box'),
		(54,	'Case',				'Cooler Master','MasterBox ITX',		'Black',		129.99,	99.99,	'2016/02/04',3.7,			13, 	'Black box'),
		(55,	'Case',				'Cooler Master','MasterBox ITX',		'White',		129.99,	99.09,	'2016/03/04',3.7,			14, 	'White box'),
		(56,	'RAM',				'Kingston',		'ValueRAM',				'Blue',			19.99,	19.99,	'2017/06/30',4.4,			null, 	'Cheap'),
        (57,	'RAM',				'G.Skill',		'Ripjaws',				'Black',		49.99,	49.99,	'2018/11/10',4.5,			null, 	'Very nice'),
		(58,	'RAM',				'HyperX',		'Fury',					'Red',			54.99,	54.99,	'2016/08/02',4.5,			null, 	'RGB lights'),
		(59,	'RAM',				'Crucial',		'Ballistix',			'Blue',			59.99,	58.99,	'2017/04/30',4.4,			null, 	'Blue'),
		(60,	'RAM',				'Corsair',		'Vengeance',			'Red',			109.99,	110.99,	'2017/10/16',4.7,			20, 	'SPEEEEEEED');    
						
INSERT INTO Returned
		(Id, Date_Returned, 	Product_Bar_Code, 	Sale_Id,	Customer_Id)
	VALUES 
		(1,	'2018/11/05',	36,					3,			2),
        (2,	'2018/11/22',	7,					8,			7),
        (3,	'2018/11/01',	15,					19,			8),
        (4,	'2018/11/05',	54,					13,			6),
        (5,	'2018/09/14',	16,					12,			12),
        (6,	'2018/09/16',	24,					4,			11),
        (7,	'2018/09/13',	32,					1,			2),
        (8,	'2018/11/20',	50,					17,			14),
        (9,	'2018/09/13',	9,					2,			2),
        (10,'2018/09/20',	29,					11,			4);
        
select * from Phone;
select * from Product;
select * from Sale;
select * from Returned;
select * from City;
select * from Adress;	
select * from Customer;
        
-- grant all privileges on Product to 'Customer';