USE clothestore;

-- 1. Thêm dữ liệu vào bảng Category trước (Để có ID cho Products tham chiếu)
-- Lưu ý: ID sẽ tự động tăng. 'short' sẽ là 1, 'pants' là 2, 'T-shirts' là 3
INSERT INTO Category (categoryName) VALUES ('short');
INSERT INTO Category (categoryName) VALUES ('pants');
INSERT INTO Category (categoryName) VALUES ('T-shirts');

-- 2. Thêm dữ liệu vào bảng Products
-- Chỉ sửa: productsName, price, DESCRIPTION (các cột còn lại giữ nguyên)
INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Họa Tiết Tropical Art Shirt", 3, 299.000, "ACTIVE", "/assert/img/products/f1.jpg",
"Áo sơ mi tay ngắn họa tiết tropical nghệ thuật với tông màu nổi bật, mang phong cách trẻ trung và hiện đại.
 Chất vải mềm nhẹ, thoáng mát, ít nhăn, phù hợp mặc trong thời tiết nóng. Form regular dễ mặc, dễ phối cùng quần short,
 quần kaki hoặc jean, thích hợp đi chơi, du lịch, dạo phố hoặc đi biển..");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Hoa Lá Vintage Nature Shirt", 3, 319.000, "ACTIVE", "/assert/img/products/f2.jpg",
"Áo sơ mi tay ngắn họa tiết hoa lá phong cách vintage với gam màu kem nhã nhặn, tạo cảm giác thanh lịch nhưng vẫn trẻ trung.
 Chất vải mềm mịn, thoáng khí, mặc mát và thoải mái suốt cả ngày. Thiết kế cổ bẻ, form regular dễ mặc, dễ phối cùng quần short,
 quần kaki hoặc jean, phù hợp đi chơi, du lịch, dạo phố hoặc đi cà phê cuối tuần..");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Hoa Nhí Vintage Floral Shirt", 3, 329.000, "ACTIVE", "/assert/img/products/f3.jpg",
"Áo sơ mi tay ngắn họa tiết hoa nhí phong cách vintage với nền màu be ấm, mang lại cảm giác cổ điển nhưng vẫn rất thời trang. 
Họa tiết hoa phối màu tinh tế, nổi bật mà không quá rực. Chất vải mềm, nhẹ và thoáng mát, phù hợp mặc trong thời tiết nóng. 
Form regular dễ mặc, dễ phối cùng quần short, kaki hoặc jean, thích hợp đi chơi, dạo phố, du lịch hoặc đi cà phê.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Hoa Anh Đào Blossom Shirt", 3, 309.000, "ACTIVE", "/assert/img/products/f4.jpg",
"Áo sơ mi tay ngắn họa tiết hoa anh đào với nền trắng tinh tế, mang phong cách nhẹ nhàng và thanh lịch. Họa tiết hoa màu hồng nhạt 
tạo điểm nhấn vừa đủ, phù hợp với nhiều phong cách khác nhau. Chất vải mỏng nhẹ, thoáng mát, mặc dễ chịu trong thời tiết nóng.
 Form regular dễ mặc, dễ phối cùng quần short, kaki hoặc jean, thích hợp đi chơi, dạo phố, du lịch hoặc đi cà phê.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Hoa Hồng Đêm Midnight Rose Shirt", 3, 339.000, "ACTIVE", "/assert/img/products/f5.jpg",
"Áo sơ mi tay ngắn họa tiết hoa hồng nổi bật trên nền xanh navy trầm, mang phong cách sang trọng và cuốn hút. 
Họa tiết hoa phối màu hồng – trắng tạo điểm nhấn mạnh mẽ nhưng vẫn tinh tế. Chất vải mềm, mát, ít nhăn, 
mặc thoải mái suốt cả ngày. Form regular dễ mặc, dễ phối với quần tối màu, kaki hoặc jean, phù hợp đi chơi tối, 
dạo phố, du lịch hoặc các buổi gặp gỡ cuối tuần.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Nhung Tăm Color Block Casual Shirt", 3, 359.000, "ACTIVE", "/assert/img/products/f6.jpg",
"Áo sơ mi dài tay chất nhung tăm mềm mại với thiết kế color block độc đáo phối hai tông cam đất và xanh denim.
 Form regular thoải mái, có thể mặc riêng hoặc layer cùng áo thun bên trong. Chất vải dày vừa, giữ form tốt 
nhưng vẫn thoáng, phù hợp mặc thu–đông hoặc những ngày thời tiết mát. Dễ phối với quần jean, kaki hoặc chinos
 cho phong cách casual, streetwear hiện đại.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Quần Linen Thêu Hoa Relaxed Fit Pants", 2, 389.000, "ACTIVE", "/assert/img/products/f7.jpg",
"Quần dài chất linen mềm nhẹ, thoáng mát, mang phong cách tối giản và tự nhiên. Điểm nhấn thêu hoa tinh tế ở gấu quần
 tạo cảm giác nhẹ nhàng, nữ tính nhưng vẫn rất thời trang. Form ống suông relaxed fit giúp thoải mái khi vận động và 
dễ che khuyết điểm. Phù hợp mặc hằng ngày, đi dạo, du lịch hoặc phối cùng áo sơ mi/áo thun cho phong cách casual thanh lịch.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Blouse Họa Tiết Art Line Oversize Top", 3, 349.000, "ACTIVE", "/assert/img/products/f8.jpg",
"Áo blouse form rộng oversize với họa tiết vẽ tay phong cách art line độc đáo, mang hơi hướng nghệ thuật và cá tính. 
Thiết kế cổ tim nhẹ kết hợp nút trang trí tạo điểm nhấn tinh tế. Chất vải mềm, rũ nhẹ, mặc thoải mái và thoáng mát. 
Phù hợp phối cùng quần suông, jean hoặc chân váy cho phong cách casual – artistic, thích hợp đi làm sáng tạo, dạo phố
hoặc cà phê cuối tuần.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Cổ Trụ Linen Minimal Shirt", 3, 329.000, "ACTIVE", "/assert/img/products/n1.jpg",
"Áo sơ mi dài tay cổ trụ thiết kế tối giản với gam màu xanh nhạt trang nhã. Chất vải linen pha cotton mềm nhẹ,
 thoáng mát và thấm hút tốt, phù hợp mặc cả ngày dài. Form regular gọn gàng, dễ phối cùng quần kaki, chinos hoặc 
jean cho phong cách casual – smart casual. Thích hợp đi làm, đi học hoặc các dịp gặp gỡ hằng ngày.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Caro Nhỏ Classic Check Shirt", 3, 319.000, "ACTIVE", "/assert/img/products/n2.jpg",
"Áo sơ mi dài tay họa tiết caro nhỏ cổ điển với tông màu xanh xám trung tính, dễ mặc và không lỗi mốt.
 Chất vải cotton mềm, thoáng khí, ít nhăn, mang lại cảm giác thoải mái khi mặc cả ngày. Form regular chuẩn, 
phù hợp phối cùng quần tây, kaki hoặc jean, thích hợp đi làm, đi học hoặc các buổi gặp gỡ thường ngày.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Trắng Cổ Trụ Essential White Shirt", 3, 349.000, "ACTIVE", "/assert/img/products/n3.jpg",
"Áo sơ mi trắng cổ trụ thiết kế tối giản, mang phong cách thanh lịch và hiện đại. Chất vải cotton cao cấp mềm mịn,
thoáng khí và thấm hút tốt, tạo cảm giác thoải mái khi mặc cả ngày. Form regular chuẩn dáng, dễ phối cùng quần tây,
 kaki hoặc jean, phù hợp đi làm, đi học hoặc các dịp trang trọng nhẹ.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Họa Tiết Urban Military Shirt", 3, 369.000, "ACTIVE", "/assert/img/products/n4.jpg",
"Áo sơ mi tay ngắn họa tiết urban kết hợp cảm hứng military với gam màu be – nâu trung tính mạnh mẽ. 
Thiết kế form regular gọn gàng, điểm nhấn họa tiết chữ và bản đồ tạo phong cách cá tính, bụi bặm. 
Chất vải cotton dày vừa, thoáng và bền, phù hợp mặc hằng ngày. Dễ phối cùng quần cargo, jean hoặc 
short cho phong cách streetwear năng động, hiện đại.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Denim Xanh Nhạt Classic Denim Shirt", 3, 349.000, "ACTIVE", "/assert/img/products/n5.jpg",
"Áo sơ mi denim dài tay màu xanh nhạt với thiết kế basic, dễ mặc và không bao giờ lỗi mốt. Chất vải denim mềm,
dày vừa, giữ form tốt nhưng vẫn thoải mái khi vận động. Form regular chuẩn dáng, có thể mặc riêng hoặc layer cùng 
áo thun bên trong. Dễ phối với quần jean, kaki hoặc chinos, phù hợp đi làm, đi học hoặc dạo phố hằng ngày.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Quần Short Kaki Sọc Nhỏ Smart Casual Shorts", 1, 299.000, "ACTIVE", "/assert/img/products/n6.jpg",
"Quần short kaki họa tiết sọc nhỏ tinh tế, mang phong cách smart casual gọn gàng và lịch sự. Chất vải kaki mềm, 
thoáng mát, giữ form tốt, tạo cảm giác thoải mái khi mặc cả ngày. Thiết kế cạp vừa, dáng regular fit dễ mặc, 
dễ phối cùng áo sơ mi, áo polo hoặc áo thun. Phù hợp đi làm môi trường thoải mái, đi chơi, du lịch hoặc dạo phố cuối tuần.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Khoác Sơ Mi Kaki Utility Overshirt", 3, 429.000, "ACTIVE", "/assert/img/products/n7.jpg",
"Áo khoác sơ mi chất kaki dày vừa với thiết kế utility mạnh mẽ, hai túi hộp trước ngực tạo điểm nhấn nam tính và tiện dụng.
 Chất vải bền, đứng form nhưng vẫn thoải mái khi mặc, phù hợp mặc khoác ngoài hoặc mặc như sơ mi dày. Dễ phối cùng áo thun, 
quần jean, cargo hoặc kaki cho phong cách casual – workwear hiện đại. Thích hợp mặc đi làm, đi chơi hoặc những ngày thời tiết mát.");

INSERT INTO Products (productsName, categoryID, price, status, img, DESCRIPTION)
VALUES
("Áo Sơ Mi Cổ Trụ Dark Minimal Shirt", 3, 319.000, "ACTIVE", "/assert/img/products/n8.jpg",
"Áo sơ mi tay ngắn cổ trụ với gam màu xám đậm tối giản, mang phong cách hiện đại và tinh tế. Chất vải mềm, thoáng mát, ít nhăn, 
tạo cảm giác thoải mái khi mặc hằng ngày. Form regular gọn gàng, dễ phối cùng quần kaki, jean hoặc chinos cho phong cách casual – smart casual.
Phù hợp đi làm môi trường năng động, đi học hoặc dạo phố.");


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

-- Thêm trường avatar để thay đổi ảnh đại diện
ALTER TABLE Users
ADD COLUMN avatar NVARCHAR(255) DEFAULT '/assert/img/avatar.jpg';

-- Thêm trường product_detail (thể hiện thông tin của sản phẩm)
CREATE TABLE IF NOT EXISTS product_details (
  productID INT PRIMARY KEY,
  material       NVARCHAR(255),
  fabric_weight  NVARCHAR(50),
  colors         NVARCHAR(255),
  fit            NVARCHAR(255),
  care           NVARCHAR(255),
  CONSTRAINT fk_pd_product
    FOREIGN KEY (productID) REFERENCES Products(ProductsID) ON DELETE CASCADE
);


-- Seed product_details mapped by productsName.
-- Adjust text if you want different specs per item.

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Nhiều màu', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Họa Tiết Tropical Art Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Nhiều màu', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Hoa Lá Vintage Nature Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Nhiều màu', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Hoa Nhí Vintage Floral Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Trắng/Hoa hồng nhạt', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Hoa Anh Đào Blossom Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Navy/Hoa hồng', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Hoa Hồng Đêm Midnight Rose Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Corduroy (Nhung tăm)', '230gsm', 'Cam đất/Xanh denim', 'Regular fit',
       'Giặt nhẹ, lộn trái; không tẩy; hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Nhung Tăm Color Block Casual Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Linen', '200gsm', 'Màu tự nhiên', 'Relaxed fit',
       'Giặt nhẹ, không vắt mạnh; ủi nhiệt thấp'
FROM Products p WHERE p.productsName = 'Quần Linen Thêu Hoa Relaxed Fit Pants'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Polyester/Rayon blend', '170gsm', 'Đa sắc (Art line)', 'Oversize',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Blouse Họa Tiết Art Line Oversize Top'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Linen/Cotton', '180gsm', 'Xanh nhạt', 'Regular fit',
       'Giặt nhẹ, ủi nhiệt thấp'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Cổ Trụ Linen Minimal Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Carô xanh xám', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Caro Nhỏ Classic Check Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Trắng', 'Regular fit',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Trắng Cổ Trụ Essential White Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '190gsm', 'Be/Nâu (Urban)', 'Regular fit',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Họa Tiết Urban Military Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Denim (100% Cotton)', '220gsm', 'Xanh nhạt', 'Regular fit',
       'Giặt riêng màu, lộn trái; không tẩy; hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Denim Xanh Nhạt Classic Denim Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Kaki (Cotton twill)', '200gsm', 'Sọc nhỏ', 'Regular fit',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Quần Short Kaki Sọc Nhỏ Smart Casual Shorts'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, 'Kaki (Cotton twill)', '240gsm', 'Kaki', 'Regular fit',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Khoác Sơ Mi Kaki Utility Overshirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);

INSERT INTO product_details (productID, material, fabric_weight, colors, fit, care)
SELECT p.ProductsID, '100% Cotton', '180gsm', 'Xám đậm', 'Regular fit / Unisex',
       'Giặt nhiệt độ thấp, không tẩy, hạn chế sấy'
FROM Products p WHERE p.productsName = 'Áo Sơ Mi Cổ Trụ Dark Minimal Shirt'
ON DUPLICATE KEY UPDATE material=VALUES(material), fabric_weight=VALUES(fabric_weight),
  colors=VALUES(colors), fit=VALUES(fit), care=VALUES(care);