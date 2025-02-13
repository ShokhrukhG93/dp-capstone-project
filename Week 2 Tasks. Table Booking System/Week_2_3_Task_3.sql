USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_no INT, IN customer INT)
BEGIN
    IF booking_date IS NULL OR table_no IS NULL OR customer IS NULL THEN
        SELECT "Error: Missing required booking information." AS `Booking status`;
    ELSE
        START TRANSACTION;
        
        IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_no) THEN
            SELECT CONCAT("Table ", table_no, " is already booked - booking cancelled.") AS `Booking status`;
            ROLLBACK;
        ELSE
            INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
            VALUES (booking_date, table_no, customer);
            
            COMMIT;
            SELECT CONCAT("Booking for table ", table_no, " is successful.") AS `Booking status`;
        END IF;
    END IF;
END //

DELIMITER ;


CALL AddValidBooking("2022-12-17", 6, 4);