-- #01 - TẠO CƠ SỞ DỮ LIỆU
	-- + OPEN MYSQL 8.0 COMMAND LINE CLIENT
	-- + CREATE DATABASE <TÊN DATABASE>
	-- + SHOW DATABASES
-- #02 - TẠO TABLE, DATA
	-- > TABLE USERS
		CREATE TABLE users(
			full_name		VARCHAR		(100)	,
			email			VARCHAR		(200)	,
			age				INT					,
			pass_word		VARCHAR		(200)	 
			);
	-- > DATA USERS
		INSERT INTO users (full_name, email, age, pass_word) VALUES
			('John Doe'			,'john.doe@example.com'				,23		,'password123'	),
			('Jane Smith'		,'jane.smith@example.com'			,28		,'password123'	),
			('Michael Johnson'	,'michael.johnson@example.com'		,30		,'password123'	),
			('Emily Davis'		,'emily.davis@example.com'			,21		,'password123'	),
			('David Brown'		,'david.brown@example.com'			,45		,'password123'	),
			('Sophia Wilson'	,'sophia.wilson@example.com'		,33		,'password123'	),
			('James Taylor'		,'james.taylor@example.com'			,37		,'password123'	),
			('Olivia Martinez'	,'olivia.martinez@example.com'		,31		,'password123'	),
			('Daniel White'		,'daniel.white@example.com'			,46		,'password123'	),
			('Isabella Harris'	,'isabella.harris@example.com'		,83		,'password123'	),
			('Matthew Clark'	,'matthew.clark@example.com'		,74		,'password123'	),
			('Ava Rodriguez'	,'ava.rodriguez@example.com'		,47		,'password123'	),
			('Lucas Lewis'		,'lucas.lewis@example.com'			,29		,'password123'	),
			('Mia Walker'		,'mia.walker@example.com'			,18		,'password123'	),
			('Alexander Hall'	,'alexander.hall@example.com'		,10		,'password123'	),
			('Amelia Allen'		,'amelia.allen@example.com'			,39		,'password123'	),
			('Ethan Scott'		,'ethan.scott@example.com'			,41		,'password123'	),
			('Abigail Young'	,'abigail.young@example.com'		,48		,'password123'	),
			('William King'		,'william.king@example.com'			,58		,'password123'	),
			('Charlotte Wright'	,'charlotte.wright@example.com'		,15		,'password123'	);
	-- > QUERY DATA OF TABLE USERS
		--+ QUERY HẾT TẤT CẢ TRONG TABLE USER
			SELECT *
			FROM users
		--+ QUERY CỘT 'full_name' VÀ CỘT 'email'
			SELECT full_name AS 'Họ Tên', email from users
