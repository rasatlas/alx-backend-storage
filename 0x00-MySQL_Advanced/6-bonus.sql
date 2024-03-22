-- A SQL script that creates a stored procedure AddBonus that adds a new
-- correction for a student.

/* DELIMITER //

CREATE PROCEDURE AddBonus(user_id INT, project_name VARCHAR(255), score INT)
BEGIN
    -- Start a transaction
    START TRANSACTION;
    -- Declare a variable to hold the value
    DECLARE p_id INT;
    SET p_id = NULL;

    -- Select the value from the table
    SELECT project_id INTO p_id
    FROM projects
    WHERE project_name = project_name;

    -- Check if the value exists in the table
    IF p_id IS NULL THEN
        INSERT INTO projects (project_name) VALUES (project_name);
        -- Select the value after insertion
        SELECT LAST_INSERT_ID() INTO p_id;
    END IF;

    -- Commit the transaction
    COMMIT;

    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, p_id, score);
END //

DELIMITER ; */

DELIMITER //

CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    DECLARE project_id INT;
    
    -- Check if the project exists
    SELECT id INTO project_id FROM projects WHERE name = project_name;
    
    -- If project doesn't exist, create it
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;
    
    -- Add correction
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END //

DELIMITER ;
