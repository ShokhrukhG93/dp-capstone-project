USE LittleLemonDB;

SELECT
	c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.MenuName,
    i.Courses 
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN Menus AS m
ON o.MenuID = m.MenuID
INNER JOIN MenuItems AS i
ON m.MenuItemsID = i.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;