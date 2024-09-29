--#01 - TẠO CƠ SỞ DỮ LIỆU
	--+ OPEN MYSQL 8.0 COMMAND LINE CLIENT
	--+ CREATE DATABASE <TÊN DATABASE>
	--+ SHOW DATABASES
--#02 - TẠO TABLE, DATA
	--> TABLE USERS
		--+ Có 3 Kiểu Dữ Liệu Chính
			--? Number: INTTEGER, FLOAT, ...
			--? String: VARCHAR, TEXT, ...
			--? Datetime: TIMESTAMP, DAY, ...
		CREATE TABLE users
		(
			full_name		VARCHAR		(100)	,
			email			VARCHAR		(200)	,
			age				INT					,
			pass_word		VARCHAR		(200)	 
		);
	--> DATA USERS
		INSERT INTO users (full_name, email, age, pass_word) VALUES 
			('Nguyen Van A'		, 'nguyenvana@example.com'	, 25	, 'password123'			),
			('Le Thi B'			, 'lethib@example.com'		, 30	, 'passw0rd!'			),
			('Tran Van C'		, 'tranvanc@example.com'	, 22	, 'mypassword456'		),
			('Pham Thi D'		, 'phamthid@example.com'	, 27	, 'abc123xyz'			),
			('Do Quang Khai'	, 'khaidq@example.com'		, 23	, 'KhaiPassword!'		),
			('Nguyen Thi E'		, 'nguyenthie@example.com'	, 26	, 'securepass789'		),
			('Le Van F'			, 'levanf@example.com'		, 21	, 'strongpass111'		),
			('Tran Thi G'		, 'tranthig@example.com'	, 29	, 'passkey2021'			),
			('Nguyen Van H'		, 'nguyenvanh@example.com'	, 24	, 'password789'			),
			('Le Thi I'			, 'lethii@example.com'		, 31	, 'passme2022'			),
			('Tran Van J'		, 'tranvanj@example.com'	, 28	, 'jpasspassword!'		),
			('Pham Van K'		, 'phamvank@example.com'	, 22	, 'vank_pass432'		),
			('Do Thi L'			, 'dothil@example.com'		, 27	, 'secretpass100'		),
			('Nguyen Van M'		, 'nguyenvanm@example.com'	, 24	, 'mypassword999'		),
			('Le Thi N'			, 'lethin@example.com'		, 25	, 'newpassword123'		),
			('Tran Van O'		, 'tranvano@example.com'	, 26	, 'opassword567'		),
			('Pham Thi P'		, 'phamthip@example.com'	, 30	, 'strongpassp@ss'		),
			('Do Van Q'			, 'dovanq@example.com'		, 28	, 'quypasspass!'		),
			('Nguyen Thi R'		, 'nguyenthir@example.com'	, 23	, 'securepassR@123'		),
			('Le Van S'			, 'levans@example.com'		, 21	, 'Spasswordstrong!'	);
	--> QUERY DATA OF TABLE USERS
		--+ QUERY HẾT TẤSELECT *
			FROM users
			WHERE age >= 20 AND age <= 30T CẢ TRONG TABLE USER
			SELECT *
			FROM users
		--+ QUERY CỘT 'full_name' VÀ CỘT 'email'
			SELECT full_name AS 'Họ Tên', email from users
		--+ Lấy Những Người Có Tuổi Từ 20-30 Tuổi
			--* Cách 01:
				SELECT *
				FROM users
				WHERE age >= 20 AND age <= 30
			--* Cách 02:
				SELECT *
				FROM users
				WHERE age BETWEEN 20 AND 30