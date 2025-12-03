create database clothestore;


USE clothestore;

CREATE TABLE PRODUCTS(
	productID INT AUTO_INCREMENT PRIMARY KEY,
	productName VARCHAR(255),
	categoryID INT,
	price DECIMAL(10,2),
	stock INT,
	status VARCHAR(100),
	img VARCHAR(255),
	quanity INT DEFAULT 0,
	DESCRIPTION text
	
	
);
CREATE TABLE CATEGORY(
	categoryID INT AUTO_INCREMENT PRIMARY KEY,
	categoryName VARCHAR(255)
);
CREATE TABLE ADDRESS(
	addressID  INT AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255),
	district NVARCHAR(255),
	city NVARCHAR(255),
	country NVARCHAR(255),
	postalCode VARCHAR(100)
);
CREATE TABLE USERS(
	role int default 1,
	userID INT AUTO_INCREMENT PRIMARY KEY,
	firstName NVARCHAR(255),
	lastName NVARCHAR(255),
	email VARCHAR(255),
	addressID INT,
	verify BIT,
	username VARCHAR(255),
	password VARCHAR(255)
);

CREATE TABLE ORDERS(
	orderID INT AUTO_INCREMENT PRIMARY KEY,
	userID INT,
	orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	status NVARCHAR(255)
);
CREATE TABLE ORDER_DETAILS(
    orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT,
    productID INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (orderID) REFERENCES ORDERS(orderID),
    FOREIGN KEY (productID) REFERENCES PRODUCTS(productID)
);


ALTER TABLE USERS
ADD CONSTRAINT fk_USER_ADDRESS
FOREIGN KEY (addressID) REFERENCES ADDRESS(addressID);

ALTER TABLE PRODUCTS
ADD CONSTRAINT fk_PRODUCTS_CATEGORY
FOREIGN KEY (categoryID) REFERENCES CATEGORY(categoryID);

ALTER TABLE ORDERS ADD CONSTRAINT fk_ORDER_USER 
FOREIGN KEY (userID) REFERENCES USERS(userID);


insert into CATEGORY
values (null,"short");

insert into CATEGORY
values (null,"pants");

insert into CATEGORY
values (null,"T-shirts");




INSERT INTO PRODUCTS
VALUES (
    NULL,                           -- productID (auto)
    "Cartoon Astronaut T-Shirts",   -- productName
    3,                              -- categoryID
    78,                             -- price
    100,                            -- stock
    "Good",                         -- status
    "/assert/img/products/f1.jpg",  -- img
    0,                              -- quanity ← THÊM CỘT NÀY
    "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it offers it all in the ultimate head-turning package."  -- DESCRIPTION
);
                
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f2.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f3.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
			
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f4.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f5.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f6.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",2,78,100,"Good","/assert/img/products/f7.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/f8.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                       
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n1.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n2.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n3.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                
         insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n4.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                
insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n5.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
	insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",1,78,100,"Good","/assert/img/products/n6.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n7.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                
                insert into PRODUCTS
values (null,"Cartoon Astronaut T-Shirts",3,78,100,"Good","/assert/img/products/n8.jpg",0,"The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from
                100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear. Featuring
                a taped neck and shoulder, and a seamless double-needle collar, and available in a range of colors, it
                offers it all in the ultimate head-turning package." );
                



