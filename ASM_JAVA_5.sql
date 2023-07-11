CREATE DATABASE ASM_JAVA_5
GO

USE ASM_JAVA_5
GO

SELECT * FROM Product

INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Snack', 232, 30000, N'VietNam', '2023-05-20', 'bimbim.png', 4);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Okamoto', 222, 30000, N'Korea', '2023-04-14', 'cream.png', 6);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Banana Cake', 867, 30000, N'China', '2023-05-20', 'drychicken.png', 7);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Butterfly', 200, 50000, N'VietNam', '2023-05-04', 'instantNoodle.png', 0);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Omachi', 232, 2000, N'VietNam', '2023-05-20', 'instantNoodle.png', 0);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Chicken', 222, 3888, N'Korea', '2023-04-14', 'drychicken.png', 14);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Cake', 867, 283, N'China', '2023-05-20', 'cream.png', 12);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Meat', 200, 1000, N'VietNam', '2023-05-04', 'bimbim.png', 20);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Inova', 232, 2000, N'VietNam', '2023-05-20', 'bimbim.png', 0);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Olo', 222, 3888, N'Korea', '2023-04-14', 'drychicken.png', 23);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Rocmen', 867, 283, N'China', '2023-05-20', 'cream.png', 0);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'Performa', 200, 1000, N'VietNam', '2023-05-04', 'cream.png' , 1);

INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'AAA', 232, 30000, N'VietNam', '2023-05-20', 'instantNoodle.png', 6);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'FFFFF', 222, 30000, N'Korea', '2023-04-14', 'bimbim.png', 20);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'GGGGGG', 867, 30000, N'China', '2023-05-20', 'bimbim.png', 22);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'HHHHH', 200, 50000, N'VietNam', '2023-05-04', 'cream.png', 7);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'IIIIII', 232, 2000, N'VietNam', '2023-05-20', 'drychicken.png', 40);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'KKKKKK', 222, 3888, N'Korea', '2023-04-14', 'instantNoodle.png', 20);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'LLLLLL', 867, 283, N'China', '2023-05-20', 'drychicken.png', 1);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'MMMMM', 200, 1000, N'VietNam', '2023-05-04', 'cream.png', 3);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'NNNN', 232, 2000, N'VietNam', '2023-05-20', 'cream.png', 5);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'OOOOO', 222, 3888, N'Korea', '2023-04-14', 'cream.png', 10);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'PPPPPP', 867, 283, N'China', '2023-05-20', 'drychicken.png', 13);
INSERT INTO Product(Product_Name, Quantity, Price, Origin, Manufacture_Date, Image, quantity_Buy) VALUES (N'RRRRRR', 200, 1000, N'VietNam', '2023-05-04', 'cream.png', 30);


SELECT * FROM Product 
ORDER BY productId DESC

INSERT INTO Account(Username, Password, Role, Email, Name, Phone, Address) 
VALUES ('TungTT', '123', 'admin', 'tungttph27337@fpt.edu.vn', 'Tung', '0943670235', 'ThaiBinh');
INSERT INTO Account(Username, Password, Role, Email, Name, Phone, Address) 
VALUES ('toan', '1', 'admin', 'nanhtrang110397@gmail.com', 'Toan', '0961616592', 'PhuTho');
INSERT INTO Account(Username, Password, Role, Email, Name, Phone, Address) 
VALUES ('hehe', '123', 'customer', 'hehe@fpt.edu.vn', 'He', '02828328236','HaNoi');
INSERT INTO Account(Username, Password, Role, Email, Name, Phone, Address) 
VALUES ('hihi', '123', 'customer', 'tungtran962003@g.com', 'Ha', '02828328236','HaNoi');

SELECT * FROM Account

SELECT * FROM BILL
SELECT * FROM bill_detail
DELETE FROM Account WHERE Id = 6

INSERT INTO Bill (order_date, account_id) VALUES ('2020-06-11', 3)
INSERT INTO Bill (order_date, account_id) VALUES ('2019-11-12', 1)
INSERT INTO Bill (order_date, account_id) VALUES ('2000-10-05', 3)
INSERT INTO Bill (order_date, account_id) VALUES ('2022-03-12', 4)
INSERT INTO Bill (order_date, account_id) VALUES ('2021-06-01', 2)


INSERT INTO bill_detail (quantity, bill_id, product_id) VALUES (10, 1, 10);
INSERT INTO bill_detail (quantity, bill_id, product_id) VALUES (20, 5, 11);
INSERT INTO bill_detail (quantity, bill_id, product_id) VALUES (30, 4, 12);
INSERT INTO bill_detail (quantity, bill_id, product_id) VALUES (5, 3, 13);
INSERT INTO bill_detail (quantity, bill_id, product_id) VALUES (11, 2, 14);

INSERT INTO Discount (name, start_date, end_date, Value, Description) 
VALUES ('Supper sale', '2023-06-20', '2023-06-22', 10, 'aaaaaa');
INSERT INTO Discount (name, start_date, end_date, Value, Description) 
VALUES ('Sale Off', '2023-07-20', '2023-07-22', 20, 'bbbbb');
INSERT INTO Discount (name, start_date, end_date, Value, Description) 
VALUES ('Amazing', '2023-08-05', '2023-09-22', 46, 'ccccc');
INSERT INTO Discount (name, start_date, end_date, Value, Description) 
VALUES ('Discount', '2023-10-20', '2023-06-22', 23, 'ddddd');

SELECT * FROM Discount

DROP TABLE Discount

SELECT * FROM Bill b
INNER JOIN bill_detail bd ON bd.bill_id = b.id
INNER JOIN Product p ON p.productId = bd.product_id



SELECT * FROM PRODUCT WHERE quantitybuy = 0 and manufacturedate between ('2023-05-19') and ('2023-05-21') ORDER BY manufacturedate ASC



SELECT * FROM Product p inner join discount d on p.discount_id = d.id


