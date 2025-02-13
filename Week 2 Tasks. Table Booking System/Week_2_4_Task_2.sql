USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATE)
BEGIN
    DECLARE row_count INT;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Bookings WHERE BookingID = booking_id) THEN
        SELECT CONCAT("Booking ", booking_id, " does not exist.") AS `Message`;
        ROLLBACK;
    ELSE
        UPDATE Bookings 
        SET BookingDate = booking_date 
        WHERE BookingID = booking_id;
        
        SET row_count = ROW_COUNT();
        IF row_count = 0 THEN
            SELECT CONCAT("Booking ", booking_id, " was not changed (same date).") AS `Message`;
            ROLLBACK;
        ELSE
            COMMIT;
            SELECT CONCAT("Booking ", booking_id, " updated successfully.") AS `Message`;
        END IF;
    END IF; 
END //

DELIMITER ;

CALL UpdateBooking(3, '2024-03-20');