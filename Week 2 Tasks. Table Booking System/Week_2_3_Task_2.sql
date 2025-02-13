USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_no INT)
BEGIN
    DECLARE booking_count INT;
    
    -- Check if the table is booked
    SELECT COUNT(*) INTO booking_count 
    FROM Bookings 
    WHERE BookingDate = booking_date AND TableNumber = table_no;
    
    -- Output message based on count
    IF booking_count > 0 THEN
        SELECT CONCAT("Table ", table_no, " is already booked.") AS `Booking Status`;
    ELSE
        SELECT CONCAT("Table ", table_no, " is not yet booked.") AS `Booking Status`;
    END IF;
END //

DELIMITER ;

CALL CheckBooking("2022-11-12", 3)