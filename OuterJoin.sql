SELECT
	"Product"."Name",
	"Image"."Name"
FROM
	"Product"
 	FULL OUTER JOIN "Image" ON "Product"."Id" = "Image"."ProductId";


SELECT 
"Category"."Name",
"Product"."Name",
"Producer"."Name"
FROM 
"Product"
FULL OUTER JOIN "Category" on "Product"."CategoryId" = "Category"."Id"
FULL OUTER JOIN "Producer" on "Producer"."Id" = "Product"."ProducerId"
	where "Product"."Name" like '%Ge%';

