insert into "Tax"("Name","CountryId", "Percentage") values
	(
	'VAT',
	'1',
	'20.10'
	),
	('Tax on products from China',
	'1',
	'100.00'),
	('PDV',
	'3',
	'25.00'),
	('PDV po članku 38.',
	'3',
	'5.00');

Select * from "Tax";

Select * from "Country";