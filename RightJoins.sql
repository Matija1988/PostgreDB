SELECT 
"Role"."Name",
"Employee"."FirstName",
"Employee"."LastName",
"Employee"."Email"
From
"Employee"
right join "Role" on "Employee"."RoleId" = "Role"."Id"
	where "Employee"."LastName" like '%rot%';
