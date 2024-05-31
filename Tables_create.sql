CREATE TABLE "Warehouse" (
	"Id" SERIAL PRIMARY KEY,
	"AddressStreet" VARCHAR(100) NOT NULL,
	"AddressCity" VARCHAR(100) NOT NULL,
	"AddressCountry" VARCHAR(100) NOT NULL,
	"Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Category" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"Description" VARCHAR(300)
);

CREATE TABLE "Producer" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR NOT NULL,
	"Description" VARCHAR(500),
	"AddressHQ" VARCHAR(200) NOT NULL,
	"Abbreviation" VARCHAR(16),
	"SoftDelete" BOOL,
	"DeleteDate" DATE
);

CREATE TABLE "Country" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Tax" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"CountryId" INT NOT NULL,
	"Percentage" DECIMAL(3, 2) NOT NULL,
	CONSTRAINT FK_TAX_COUNTRY_COUNTRYID FOREIGN KEY ("CountryId") REFERENCES "Country" ("Id")
);

CREATE TABLE "Product" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"Description" VARCHAR(1200),
	"PrinceNoTax" DECIMAL(5, 2) NOT NULL,
	"PriceWTax" DECIMAL(5, 2),
	"ProducerId" INT NOT NULL,
	"SoftDelete" BOOL,
	"DeleteDate" DATE,
	"UpdateDate" DATE,
	"WarehouseId" INT NOT NULL,
	"TaxId" INT,
	"CategoryId" INT NOT NULL,
	CONSTRAINT FK_PRODUCT_PRODUCER_PRODUCERID FOREIGN KEY ("ProducerId") REFERENCES "Producer" ("Id"),
	CONSTRAINT FK_PRODUCT_WAREHOUSE_WAREHOUSEID FOREIGN KEY ("WarehouseId") REFERENCES "Warehouse" ("Id"),
	CONSTRAINT FK_PRODUCT_TAX_TAXID FOREIGN KEY ("TaxId") REFERENCES "Tax" ("Id"),
	CONSTRAINT FK_PRODUCT_CATEGORY_CATEGORYID FOREIGN KEY ("CategoryId") REFERENCES "Category" ("Id")
);

CREATE TABLE "Image" (
	"Id" SERIAL PRIMARY KEY,
	"Link" VARCHAR(255) NOT NULL,
	"Name" VARCHAR(100),
	"ProductId" INT NOT NULL,
	CONSTRAINT FK_IMAGE_PRODUCT_PRODUCTID FOREIGN KEY ("ProductId") REFERENCES "Product" ("Id")
);

CREATE TABLE "Role" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL
);

CREATE TABLE "Employee" (
	"Id" SERIAL PRIMARY KEY,
	"FirstName" VARCHAR(20) NOT NULL,
	"LastName" VARCHAR(20) NOT NULL,
	"Email" VARCHAR(255) NOT NULL,
	"Password" VARCHAR(255) NOT NULL,
	"PhoneNumber" VARCHAR(30) NOT NULL,
	"RoleId" INT NOT NULL,
	CONSTRAINT FK_EMPLOYEE_ROLE_ROLEID FOREIGN KEY ("RoleId") REFERENCES "Role" ("Id")
);

CREATE TABLE "Costumer" (
	"Id" SERIAL PRIMARY KEY,
	"FirstName" VARCHAR(20) NOT NULL,
	"LastName" VARCHAR(20) NOT NULL,
	"Email" VARCHAR(255) NOT NULL,
	"Password" VARCHAR(255) NOT NULL,
	"PhoneNumber" VARCHAR(30) NOT NULL,
	"AddressStreet" VARCHAR(100) NOT NULL,
	"AddressCity" VARCHAR(100) NOT NULL,
	"AddressCountry" VARCHAR(30) NOT NULL
);

CREATE TABLE "Order" (
	"Id" SERIAL PRIMARY KEY,
	"OrderNumber" VARCHAR(30) NOT NULL,
	"CostumerId" INT NOT NULL,
	"OrderDate" DATE NOT NULL,
	"ShipmentDate" DATE NOT NULL,
	"IsFinished" BOOL,
	"EmployeeId" INT,
	CONSTRAINT FK_ORDER_EMPLOYEE_EMPLOYEEID FOREIGN KEY ("EmployeeId") REFERENCES "Employee" ("Id"),
	CONSTRAINT FK_ORDER_COSTUMER_COSTUMERID FOREIGN KEY ("CostumerId") REFERENCES "Costumer" ("Id")
);

CREATE TABLE "Discount" (
	"Id" SERIAL PRIMARY KEY,
	"Name" VARCHAR(30),
	"Percentage" DECIMAL(2, 1),
	"OrderId" INT,
	CONSTRAINT FK_ORDER_ORDER_ORDERID FOREIGN KEY ("OrderId") REFERENCES "Order" ("Id")
);

------------------ TABLICE VISE NA VISE -----------------------
CREATE TABLE "WarehouseProduct" (
	"Id" SERIAL PRIMARY KEY,
	"WarehouseId" INT NOT NULL,
	"ProductId" INT NOT NULL,
	"Quantity" INT NOT NULL,
	CONSTRAINT FK_WAREHOUSEPRODUCT_WAREHOUSE_WAREHOUSEID FOREIGN KEY ("WarehouseId") REFERENCES "Warehouse" ("Id"),
	CONSTRAINT FK_WAREHOUSEPRODUCT_PRODUCT_PRODUCTID FOREIGN KEY ("ProductId") REFERENCES "Product" ("Id")
);

CREATE TABLE "ProductOrder" (
	"Id" SERIAL PRIMARY KEY,
	"OrderId" INT NOT NULL,
	"ProductId" INT NOT NULL,
	CONSTRAINT FK_PRODUCTORDER_PRODUCT_PRODUCTID FOREIGN KEY ("ProductId") REFERENCES "Product" ("Id"),
	CONSTRAINT FK_PRODUCTORDER_ORDER_ORDERID FOREIGN KEY ("OrderId") REFERENCES "Order" ("Id")
);