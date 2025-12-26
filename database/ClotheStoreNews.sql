-- 1. Tạo Database
CREATE DATABASE IF NOT EXISTS clothestore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE clothestore;

-- 2. Tạo bảng Category
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255)
);

-- 3. Tạo bảng Users
CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    verify BIT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    Phone VARCHAR(50),
    birthday DATE,
    gender INT DEFAULT -1,
    createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Role INT DEFAULT 1
);

-- 4. Tạo bảng Address (Liên kết với Users)
CREATE TABLE Address (
    addressID INT AUTO_INCREMENT PRIMARY KEY,
    fulladdress VARCHAR(255),
    district VARCHAR(255),
    city VARCHAR(255),
    ward VARCHAR(255),
    phone VARCHAR(50),
    userID INT NOT NULL,
    isDefault BIT DEFAULT 0,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- 5. Tạo bảng Products (Liên kết với Category)
CREATE TABLE Products (
    ProductsID INT AUTO_INCREMENT PRIMARY KEY,
    productsName VARCHAR(255),
    categoryID INT,
    price DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'active',
    img VARCHAR(255),
    DESCRIPTION TEXT,
    createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL
);

-- 6. Tạo bảng Products_Variants (Liên kết với Products)
CREATE TABLE Products_Variants (
    variantID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    size VARCHAR(50),
    color VARCHAR(50),
    sku VARCHAR(100),
    priceAdjustment DECIMAL(10,2) DEFAULT 0,
    stock INT,
    status VARCHAR(50),
    FOREIGN KEY (productID) REFERENCES Products(ProductsID) ON DELETE CASCADE
);

-- 7. Tạo bảng Orders (Liên kết với Users và Address)
CREATE TABLE Orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    addressID INT,
    status VARCHAR(50),
    totalAmount DECIMAL(10,2),
    paymentMethod VARCHAR(50),
    note TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (addressID) REFERENCES Address(addressID)
);

-- 8. Tạo bảng ORDER_DETAILS (Liên kết với Orders, Products, Products_Variants)
CREATE TABLE ORDER_DETAILS (
    orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    variantID INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES Products(ProductsID),
    FOREIGN KEY (variantID) REFERENCES Products_Variants(variantID)
);