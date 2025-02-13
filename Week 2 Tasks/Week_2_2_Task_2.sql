USE LittleLemonDB;

PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost AS Cost
FROM Orders
WHERE OrderID = ?;';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
