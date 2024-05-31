Create table "Warehouse"(
	
	"AdressStreet" varchar(100) not null,
	"AdressMunicipality" varchar(100) not null,
	"AdressCountry" varchar(100) not null,
	"Name" varchar(100) not null
	
);



Create table "Category"(

	"Id" serial primary key,
	"Name" varchar(100) not null,
	"Description" varchar(300) 
	
);

create table "Producer"(

	"Id" serial primary key,
	"Name" varchar not null,
	"Description" varchar(500),
	"AdressHQ" varchar(200) not null,
	"Abbreviation" varchar(16),
	"SoftDelete" bool,
	"DeleteDate" Date
	
);

create table "Country" (
	"Id" serial primary key,
	"Name" varchar(100) not null
);

create table "Tax"(
	"Id" serial primary key,
	"Name" varchar(100) not null,
	"CountryId" int not null ,
	"Percentage" decimal(3,2) not null,

	Constraint FK_Tax_Country_CountryId Foreign key ("CountryId") references "Country"("Id")
);

create table "Product"(
	"Id" serial primary key,
	"Name" varchar(100) not null,
	"Description" varchar(1200),
	"PrinceNoTax" decimal (5,2) not null,
	"PriceWTax" decimal (5,2),
	"ProducerId" int not null,
	"SoftDelete" bool,
	"DeleteDate" date,
	"UpdateDate" date,
	"WarehouseId" int not null,
	"TaxId" int,
	"CategoryId" int not null,


	Constraint FK_Product_Producer_ProducerId Foreign key ("ProducerId") references "Producer"("Id"),
	Constraint FK_Product_Warehouse_WarehouseId Foreign key ("WarehouseId") references "Warehouse"("Id"),
    Constraint FK_Product_Tax_TaxId Foreign key ("TaxId") references "Tax"("Id"),
	Constraint FK_Product_Category_CategoryId Foreign key ("CategoryId") references "Category"("Id")


);

create table "Image" (

	"Id" serial primary key,
	"Link" varchar(255) not null,
	"Name" varchar(100),
	"ProductId" int not null,

	Constraint FK_Image_Product_ProductId Foreign key ("ProductId") references "Product"("Id")
);

create table "Role"(
	"Id" serial primary key,
	"Name" varchar(50) not null
);

create table "Employee"(
	"Id" serial primary key,
	"FirstName" varchar(20) not null,
	"LastName" varchar(20) not null,
	"Email" varchar(255) not null,
	"Password" varchar(255) not null,
	"PhoneNumber" varchar(30) not null,
	"RoleId" int not null,

	Constraint FK_Employee_Role_RoleId Foreign key ("RoleId") references "Role"("Id")
		
);

create table "Costumer"(

	"Id" serial primary key,
	"FirstName" varchar(20) not null,
	"LastName" varchar(20) not null,
	"Email" varchar(255) not null,
	"Password" varchar(255) not null,
	"PhoneNumber" varchar(30) not null,
	"AdressStreet" varchar(100) not null,
	"AdressCity" varchar(100) not null,
	"AdressCountry" varchar(30) not null
	
);


create table "Order"(
	"Id" serial primary key,
	"OrderNumber" varchar(30) not null,
	"CostumerId" int not null,
	"OrderDate" date not null,
	"ShipmentDate" date not null,
	"IsFinished" bool,
	"EmployeeId" int,

	Constraint FK_Order_Employee_EmployeeId Foreign key ("EmployeeId") references "Employee"("Id"),
	Constraint FK_Order_Costumer_CostumerId Foreign key ("CostumerId") references "Costumer"("Id")
	
);


create table "Discount"(
	"Id" serial primary key,
	"Name" varchar(30),
	"Percentage" decimal(2,1),
	"OrderId" int,

	Constraint FK_Order_Order_OrderId Foreign key ("OrderId") references "Order"("Id")
	
);

------------------ TABLICE VISE NA VISE -----------------------

create table "WarehouseProduct"(

	"Id" serial primary key,
	"WarehouseId" int not null,
	"ProductId" int not null,
	"Quantity" int not null,
	
	Constraint FK_WarehouseProduct_Warehouse_WarehouseId Foreign key ("WarehouseId") references "Warehouse"("Id"),
	Constraint FK_WarehouseProduct_Product_ProductId Foreign key ("ProductId") references "Product"("Id")
	
);

create table "ProductOrder"(
	"Id" serial primary key,
	"OrderId" int not null,
	"ProductId" int not null,
	Constraint FK_ProductOrder_Product_ProductId Foreign key ("ProductId") references "Product"("Id"),
	Constraint FK_ProductOrder_Order_OrderId Foreign key ("OrderId") references "Order"("Id")
	
);