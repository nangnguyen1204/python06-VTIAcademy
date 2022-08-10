-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
WITH tb_id_name_saddles AS(
						SELECT 	psc.`ProductSubcategoryID`
						FROM 	`productsubcategory` psc
						WHERE 	psc.`Name` = 'Saddles'
)
SELECT 		p.`Name`
FROM 		`product` p JOIN `productsubcategory` psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE		p.ProductSubcategoryID IN (SELECT * FROM tb_id_name_saddles);


-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.
-- Hướng dẫn:
-- Mệnh đề WHERE trong subquery sẽ sử dụng ký tự wildcard ‘Bo%’ .

WITH tb_id_name_saddles AS(
						SELECT 	psc.`ProductSubcategoryID`
						FROM 	`productsubcategory` psc
						WHERE 	psc.`Name` LIKE 'Bo%'
)
SELECT 		p.`Name`
FROM 		`product` p JOIN `productsubcategory` psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE		p.ProductSubcategoryID IN (SELECT * FROM tb_id_name_saddles);

-- Question 3:
-- Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring
-- Bike (nghĩa là ProductSubcategoryID = 3)

WITH lowest_price AS(
					SELECT 		MIN(p.ListPrice) 
					FROM 		product p
                    WHERE 		p.ListPrice > 0
)
SELECT DISTINCT 		p.`Name`
FROM		product p
WHERE		p.ProductSubcategoryID = 3 AND p.ListPrice = (SELECT * FROM lowest_price);

-- Exercise 2: JOIN nhiều bảng
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong
-- AdventureWorks2008sample database.

