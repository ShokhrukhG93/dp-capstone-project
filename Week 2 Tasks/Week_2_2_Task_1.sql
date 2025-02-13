USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT Quantity AS 'Max Quantity in Order'
FROM orders
ORDER BY Quantity DESC
LIMIT 1;
END //

DELIMITER ;

CALL GetMaxQuantity();