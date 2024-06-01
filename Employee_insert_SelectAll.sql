INSERT INTO
	"Employee" (
		"FirstName",
		"LastName",
		"Email",
		"Password",
		"PhoneNumber",
		"RoleId"
	)
VALUES
	(
	'Derek',
	'Trotter',
	'onlyfoolsandhorses@yahoo.com',
	'this will be encrypted',
	'001-01-123456789',
	'2'
	),
	(
	'Rodney',
	'Trotter',
	'cheeplawnmowers@gmail.com',
	'123456789',
	'001-01-123456789',
	'3'
	),
	(
	'Colin',
	'Ball',
	'trigger@gmail.com',
	'mypassword',
	'001-01-123456789',
	'1'
	);

select * from "Employee";