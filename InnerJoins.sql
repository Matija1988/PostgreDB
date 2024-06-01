SELECT
	"Product"."Name",
	"Image"."Name"
FROM
	"Product"
	INNER JOIN "Image" ON "Product"."Id" = "Image"."ProductId";

SELECT
	"Product"."Name",
	"Warehouse"."AddressStreet",
	"Warehouse"."AddressCity",
	"WarehouseProduct"."Quantity"
FROM
	"Product"
	INNER JOIN "WarehouseProduct" ON "Product"."Id" = "WarehouseProduct"."ProductId"
	INNER JOIN "Warehouse" ON "Warehouse"."Id" = "WarehouseProduct"."WarehouseId";

Select * from "Country";
Select * from "Tax";

SELECT
	"Product"."Name",
	"Tax"."Name",
	"Tax"."Percentage",
	"Country"."Name"
FROM
	"Product"
	INNER JOIN "Tax" ON "Product"."TaxId" = "Tax"."Id"
	INNER JOIN "Country" ON "Country"."Id" = "Tax"."CountryId";

SELECT 
"Category"."Name",
"Product"."Name",
"Producer"."Name"
FROM 
"Product"
Inner join "Category" on "Product"."CategoryId" = "Category"."Id"
Inner join "Producer" on "Producer"."Id" = "Product"."ProducerId"
	where "Producer"."Name" like '%Nvi%';

SELECT 
"Category"."Name",
"Product"."Name",
"Producer"."Name"
FROM 
"Product"
Inner join "Category" on "Product"."CategoryId" = "Category"."Id"
Inner join "Producer" on "Producer"."Id" = "Product"."ProducerId"
	where "Producer"."Name" like '%Int%';

