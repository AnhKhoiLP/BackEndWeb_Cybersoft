--#01 - TẠO CƠ SỞ DỮ LIỆU
	--+ OPEN MYSQL 8.0 COMMAND LINE CLIENT
	--+ CREATE DATABASE <TÊN DATABASE>
	--+ SHOW DATABASES
--#02 - TẠO TABLE, DATA
	--> TABLE users
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
		)
		;
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
		--+ QUERY HẾT TẤT CẢ TRONG TABLE 'users'
			SELECT *
			FROM users;
		--+ QUERY CỘT 'full_name' VÀ CỘT 'email'
			SELECT full_name AS 'Họ Tên', email
			FROM users;
		--+ LẤY NHỮNG NGƯỜI CÓ TUỔI TỪ 20-30 TUỔI
			--* Cách 01: Regular Way, Sắp Xếp TĂNG Dần
				SELECT *
				FROM users
				WHERE age >= 20 AND age <= 30
				ORDER BY age ASC;
			--* Cách 02: BETWEEN, Sắp Xếp GIẢM Dần
				SELECT *
				FROM users
				WHERE age BETWEEN 20 AND 30
				ORDER BY age DESC;
		--+ ALTER TABLE => UPDATE TABLE THAY VÌ XÓA VÀ TẠO LẠI
			--* THÊM COLUMN 'address' VÀ 'phone' CHO TABLE 'users'
				ALTER TABLE users
				ADD COLUMN 		address 		VARCHAR		(255),
				ADD COLUMN 		phone 			VARCHAR		(15);
			--* THAY ĐỔI KIỂU DỮ LIỆU
				ALTER TABLE users
				MODIFY 			address			VARCHAR		(100);
			--* THÊM RÀNG BUỘC (CONSTRAINT)
				ALTER TABLE users
				MODIFY 			full_name		VARCHAR		(100)		NOT NULL;
			--*
		--+ LIỆT KÊ NHỮNG NGƯỜI CÓ TUỔI LỚN NHẤT
			--* CÁCH 01: SUB QUERIES
				SELECT *
				FROM users
				WHERE age =
					(
						SELECT MAX(age)
						FROM users
					)
				;
			--* CÁCH 02: CTEs
				WITH MaxAgeCTE AS
					(
						SELECT MAX(age) AS MaxAge
						FROM users
					)
				SELECT *
				FROM users
				WHERE age =
					(
						SELECT MaxAge
						FROM MaxAgeCTE
					)
				;
			--* CÁCH 03: DÙNG JOIN
				SELECT u.*
				FROM users u
				JOIN
				(
					SELECT MAX(age) AS MaxAge
					FROM users
				) AS MaxAgeTable
				ON u.age = MaxAgeTable.MaxAge
				;
			--* CÁCH 04: WINDOW FUNCTION
				SELECT *
				FROM
				(
					SELECT *, MAX(age) OVER () AS MaxAge
					FROM users
				) AS T
				WHERE age = MaxAge
				;
			--* CÁCH 05: HAVING
				SELECT *
				FROM users
				GROUP BY email, age, full_name, pass_word, address, phone
				HAVING age =
					(
						SELECT MAX(age)
						FROM users
					)
				;
		--+ LIỆT KÊ 'full_name' CÓ HỌ 'Le'
			SELECT *
			FROM users
			WHERE full_name LIKE '%Le%';
			--* 'Le%'	: 'Le' Ở ĐẦU CHUỖI 			VD: LE1, LE VAN, LE THI, ...
			--* '%Le'	: 'Le' Ở CUỐI CHUỖI 		VD: NGUYEN VAN LE, TRAI LE, ...
			--* '%Le%'	: 'Le' Ở TRONG CHUỖI		VD: NGUYEN VAN LE, LE VAN VO TRI, ...
		--+ ĐẾM CÓ BAO NHIÊU NGƯỜI TRONG 1 ĐỘ TUỔI
			SELECT DISTINCT age, COUNT(full_name)
			FROM users
			GROUP BY age

		
