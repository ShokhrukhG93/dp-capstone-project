USE LittleLemonDB;

DELIMITER //

CREATE PROCEDURE AddBooking (IN booking_id INT, IN booking_date DATE, IN table_no INT, IN customer INT)
BEGIN
    DECLARE msg VARCHAR(255);
    START TRANSACTION;
    

    IF EXISTS(SELECT 1 FROM Bookings WHERE BookingID = booking_id) THEN
        SET msg = CONCAT("Booking ", booking_id, " already exists - booking cancelled.");
        ROLLBACK;

    ELSEIF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_no) THEN
        SET msg = CONCAT("Table ", table_no, " already booked - booking cancelled.");
        ROLLBACK;

    ELSE
        INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
        VALUES (booking_id, booking_date, table_no, customer);
        COMMIT;
        SET msg = "New booking added successfully.";
    END IF;

    SELECT msg AS `Booking Status`;
END //

DELIMITER ;

CALL AddBooking(10, "2022-12-30", 3, 4);