-- #01 - TẠO CƠ SỞ DỮ LIỆU
	-- + OPEN MYSQL 8.0 COMMAND LINE CLIENT
	-- + CREATE DATABASE <TÊN DATABASE>
	-- + SHOW DATABASES
-- #02 - TẠO TABLE, DATA
	-- > TABLE USERS
		CREATE TABLE users(
			full_name		VARCHAR		(100),
			email			VARCHAR		(200),
			age				INT,
			pass_word		VARCHAR		(200)
			);
	-- > DATA USERS
		INSERT INTO users (full_name, email, pass_word) VALUES
			('John Doe'			,'john.doe@example.com'				,23		,'password123'	),
			('Jane Smith'		,'jane.smith@example.com'			,23		,'password123'	),
			('Michael Johnson'	,'michael.johnson@example.com'		,23		,'password123'	),
			('Emily Davis'		,'emily.davis@example.com'			,23		,'password123'	),
			('David Brown'		,'david.brown@example.com'			,23		,'password123'	),
			('Sophia Wilson'	,'sophia.wilson@example.com'		,23		,'password123'	),
			('James Taylor'		,'james.taylor@example.com'			,23		,'password123'	),
			('Olivia Martinez'	,'olivia.martinez@example.com'		,23		,'password123'	),
			('Daniel White'		,'daniel.white@example.com'			,23		,'password123'	),
			('Isabella Harris'	,'isabella.harris@example.com'		,23		,'password123'	),
			('Matthew Clark'	,'matthew.clark@example.com'		,23		,'password123'	),
			('Ava Rodriguez'	,'ava.rodriguez@example.com'		,23		,'password123'	),
			('Lucas Lewis'		,'lucas.lewis@example.com'			,23		,'password123'	),
			('Mia Walker'		,'mia.walker@example.com'			,23		,'password123'	),
			('Alexander Hall'	,'alexander.hall@example.com'		,23		,'password123'	),
			('Amelia Allen'		,'amelia.allen@example.com'			,23		,'password123'	),
			('Ethan Scott'		,'ethan.scott@example.com'			,23		,'password123'	),
			('Abigail Young'	,'abigail.young@example.com'		,23		,'password123'	),
			('William King'		,'william.king@example.com'			,23		,'password123'	),
			('Charlotte Wright'	,'charlotte.wright@example.com'		,23		,'password123'	);
	-- > QUERY DATA OF TABLE USERS
	SELECT * FROM users
	SELECT full_name AS 'Họ Tên', email from users
