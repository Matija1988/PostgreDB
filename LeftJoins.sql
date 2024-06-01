SELECT
	"Product"."Name",
	"Producer"."Name"
FROM
	"Product"
 	left join "Producer" ON "Product"."ProducerId" = "Producer"."Id"
	where "Product"."Name" like '%i7%';

SELECT 
"Role"."Name",
"Employee"."FirstName",
"Employee"."LastName",
"Employee"."Email"
From
"Employee"
left join "Role" on "Employee"."RoleId" = "Role"."Id"
	where "Employee"."LastName" like '%rot%';
