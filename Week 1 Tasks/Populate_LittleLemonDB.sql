USE LittleLemonDB;

INSERT INTO customers (FullName, ContactNumber)
VALUES 
    ("Alice Johnson", 9876543),
    ("Bob Smith", 8765432),
    ("Charlie Davis", 7654321),
    ("David Lee", 6543210),
    ("Emma Wilson", 5432109),
    ("Frank Harris", 4321098),
    ("Grace Martinez", 3210987),
    ("Hannah Brown", 2109876),
    ("Isaac White", 1098765),
    ("Jack Green", 9988776);

INSERT INTO staff (StaffName, StaffRole, Salary)
VALUES
    ("Michael Scott", "Manager", 75000),    
    ("Jim Halpert", "Waiter", 42000),
    ("Pam Beesly", "Receptionist", 46000);

INSERT INTO menuitems (Starters, Courses, Desserts)
VALUES
	("Bruschetta", "Spaghetti Carbonara", "Panna Cotta"),
	("French Onion Soup", "Grilled Salmon", "Chocolate Lava Cake"),
	("Greek Salad", "Beef Stroganoff", "Strawberry Cheesecake"),
	("Spring Rolls", "Kung Pao Chicken", "Mango Sticky Rice");

INSERT INTO menus (MenuName, MenuItemsID)
VALUES
    ("Italian Feast", 1),
    ("French Delight", 2),
    ("Mediterranean Special", 3),
    ("Asian Fusion", 4);

INSERT INTO bookings (BookingDate, TableNumber, CustomerID)
VALUES 
	("2023-05-15", 4, 2),
	("2023-06-18", 6, 5),
	("2023-07-20", 1, 7),
	("2023-08-10", 3, 9);

INSERT INTO orders (OrderDate, CustomerID, MenuID, Quantity, TotalCost, StaffID)
VALUES 
	("2024-01-05", 2, 1, 1, 22.50, 2),
	("2024-01-10", 5, 2, 2, 45.00, 3),
	("2024-01-15", 7, 3, 1, 33.00, 1),
	("2024-01-20", 9, 4, 2, 60.00, 2),
	("2024-02-01", 10, 1, 1, 25.00, 3),
	("2024-02-05", 3, 2, 3, 80.00, 1),
	("2024-02-10", 4, 3, 2, 55.00, 2),
	("2024-02-15", 6, 4, 4, 120.00, 3),
	("2024-02-20", 8, 2, 1, 30.00, 1),
	("2024-02-22", 3, 3, 5, 175.00, 2),
	("2024-02-25", 7, 4, 6, 220.00, 1),
	("2024-02-28", 9, 1, 8, 190.00, 3);

INSERT INTO deliverystatus (DeliveryDate, DeliveryStatus, OrderID)
VALUES
	("2024-01-06",1,1),
	("2024-01-11",1,2),
	("2024-01-16",1,3),
	("2024-01-21",1,4),
	("2024-02-02",1,5),
	("2024-02-06",1,6),
	("2024-02-11",1,7),
	("2024-02-16",1,8),
	("2024-02-21",0,9);
