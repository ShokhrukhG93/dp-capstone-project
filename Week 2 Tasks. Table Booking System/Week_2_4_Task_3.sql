USE LittleLemonDB;

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
    DECLARE row_count INT;
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Bookings WHERE BookingID = booking_id) THEN
        SELECT CONCAT("Booking ", booking_id, " does not exist.") AS `Message`;
        ROLLBACK;
    ELSE

        DELETE FROM Bookings WHERE BookingID = booking_id;

        SET row_count = ROW_COUNT();
        IF row_count = 0 THEN
            SELECT CONCAT("Booking ", booking_id, " was not deleted due to an error.") AS `Message`;
            ROLLBACK;
        ELSE
            COMMIT;
            SELECT CONCAT("Booking ", booking_id, " cancelled successfully.") AS `Message`;
        END IF;
    END IF;
END //

DELIMITER ;

CALL CancelBooking(9);