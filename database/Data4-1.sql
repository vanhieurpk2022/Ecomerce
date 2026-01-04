USE clothestore;

-- 1. Thêm dữ liệu vào bảng Category trước (Để có ID cho Products tham chiếu)
-- Lưu ý: ID sẽ tự động tăng. 'short' sẽ là 1, 'pants' là 2, 'T-shirts' là 3
INSERT INTO Category (categoryName) VALUES ('short');
INSERT INTO Category (categoryName) VALUES ('pants');
INSERT INTO Category (categoryName) VALUES ('T-shirts');

-- 2. Thêm dữ liệu vào bảng Products
-- Đã loại bỏ giá trị '100' (stock) vì cột này nằm ở bảng Products_Variants
INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f1.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f2.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f3.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f4.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f5.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f6.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 2, 78, "ACTIVE", "/assert/img/products/f7.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/f8.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n1.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n2.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n3.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n4.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n5.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 1, 78, "ACTIVE", "/assert/img/products/n6.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n7.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES 
("Cartoon Astronaut T-Shirts", 3, 78, "ACTIVE", "/assert/img/products/n8.jpg", "The Gildan Ultra Cotton T-shirt is made from a substantial 6.0 oz. per sq. yd. fabric constructed from 100% cotton, this classic fit preshrunk jersey knit provides unmatched comfort with each wear.");

-- 3. (Tùy chọn) Tạo dữ liệu Variants để lưu số lượng Stock (100)
-- Nếu bạn muốn lưu số lượng tồn kho 100 như dữ liệu cũ, bạn cần insert vào bảng Products_Variants
-- Ví dụ tạo variant mặc định cho tất cả các sản phẩm vừa tạo (ID từ 1 đến 16)
INSERT INTO Products_Variants (productID, size, sku, stock, status)
SELECT ProductsID, 'L', CONCAT('SKU-', ProductsID), 100, 'active'
FROM products;


 -- shipping fee
INSERT INTO shipping (city_name, price, city_code) VALUES
('Hà Nội', 30000.00, 'HN'),
('TP Hồ Chí Minh', 35000.00, 'HCM'),
('Đà Nẵng', 28000.00, 'DN'),
('Hải Phòng', 32000.00, 'HP'),
('Cần Thơ', 30000.00, 'CT'),
('Bình Dương', 33000.00, 'BD'),
('Đồng Nai', 33000.00, 'DNai'),
('Nghệ An', 35000.00, 'NA'),
('Thanh Hóa', 34000.00, 'TH'),
('Quảng Ninh', 36000.00, 'QN'),
('Khánh Hòa', 37000.00, 'KH'),
('Lâm Đồng', 38000.00, 'LD'),
('Bà Rịa - Vũng Tàu', 34000.00, 'BRVT'),
('Bắc Ninh', 31000.00, 'BN'),
('Thừa Thiên Huế', 29000.00, 'TTH');

INSERT INTO vouchers(voucherID,`code`,discount,quantity,used,`status`)
VALUES(1,'FREESHIP',30000,20,0,'active');