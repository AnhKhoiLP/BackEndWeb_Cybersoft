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
			('Le Van S'			, 'levans@example.com'		, 21	, 'Spasswordstrong!'	)
	--> QUERY DATA OF TABLE USERS
		--+ QUERY HẾT TẤT CẢ TRONG TABLE 'users'
			SELECT *
			FROM users
		--+ QUERY CỘT 'full_name' VÀ CỘT 'email'
			SELECT full_name AS 'Họ Tên', email
			FROM users
		--+ LẤY NHỮNG NGƯỜI CÓ TUỔI TỪ 20-30 TUỔI
			--* Cách 01: Regular Way, Sắp Xếp TĂNG Dần
				SELECT *
				FROM users
				WHERE age >= 20 AND age <= 30
				ORDER BY age ASC
			--* Cách 02: BETWEEN, Sắp Xếp GIẢM Dần
				SELECT *
				FROM users
				WHERE age BETWEEN 20 AND 30
				ORDER BY age DESC
		--+ ALTER TABLE => UPDATE TABLE THAY VÌ XÓA VÀ TẠO LẠI
			--* THÊM COLUMN 'address' VÀ 'phone' CHO TABLE 'users'
				ALTER TABLE users
				ADD COLUMN 		address 		VARCHAR		(255),
				ADD COLUMN 		phone 			VARCHAR		(15)
			--* THAY ĐỔI KIỂU DỮ LIỆU
				ALTER TABLE users
				MODIFY 			address			VARCHAR		(100)
			--* THÊM RÀNG BUỘC (CONSTRAINT)
				ALTER TABLE users
				MODIFY 			full_name		VARCHAR		(100)		NOT NULL
		--+ LIỆT KÊ NHỮNG NGƯỜI CÓ TUỔI LỚN NHẤT
			--* CÁCH 01: SUB QUERIES
				SELECT *
				FROM users
				WHERE age =
					(
						SELECT MAX(age)
						FROM users
					)
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
			--* CÁCH 03: DÙNG JOIN
				SELECT u.*
				FROM users u
				JOIN
				(
					SELECT MAX(age) AS MaxAge
					FROM users
				) AS MaxAgeTable
				ON u.age = MaxAgeTable.MaxAge
			--* CÁCH 04: WINDOW FUNCTION
				SELECT *
				FROM
				(
					SELECT *, MAX(age) OVER () AS MaxAge
					FROM users
				) AS T
				WHERE age = MaxAge
			--* CÁCH 05: HAVING
				SELECT *
				FROM users
				GROUP BY email, age, full_name, pass_word, address, phone
				HAVING age =
					(
						SELECT MAX(age)
						FROM users
					)
		--+ LIỆT KÊ 'full_name' CÓ HỌ 'Le'
			SELECT *
			FROM users
			WHERE full_name LIKE '%Le%'
			--* 'Le%'	: 'Le' Ở ĐẦU CHUỖI 			VD: LE1, LE VAN, LE THI, ...
			--* '%Le'	: 'Le' Ở CUỐI CHUỖI 		VD: NGUYEN VAN LE, TRAI LE, ...
			--* '%Le%'	: 'Le' Ở TRONG CHUỖI		VD: NGUYEN VAN LE, LE VAN VO TRI, ...
		--+ ĐẾM CÓ BAO NHIÊU NGƯỜI TRONG 1 ĐỘ TUỔI
			SELECT DISTINCT age, COUNT(full_name)
			FROM users
			GROUP BY age
		--+ UPDATE
			UPDATE users
			SET age = 30
			WHERE full_name = "Nguyen Van A"
		--+ DELETE
			--* SOFT DELETE: SET CỜ DELETE LÀ FALSE VÀ SẼ KHÔNG SHOW LÊN UI NHƯNG DATA VẪN CÒN TỒN TẠI TRONG DATABASE
			--* HARD DELETE: XÓA HẲN DATA KHỎI DATABASE
				--> BẮT BUỘC PHẢI CÓ KHI DÙNG HARD DELETE
				DELETE FROM users
				WHERE full_name = "Nguyen Van A"
	--> DATA RELATIONSHIP
		--+ TỔ CHỨC VÀ QUẢN LÝ DỮ LIỆU TỐT HƠN THAY VÌ VIẾT TẤT CẢ DATA TRONG 1 TABLE DUY NHẤT
		--+ GIẢM THIỂU TRÙNG LẶP DỮ LIỆU
		--+ TĂNG HIỆU QUẢ TRUY VẤN
		--+ TÍNH TOÀN VẸN DỮ LIỆU
			--* VÍ DỤ: KHÔNG THỂ XÓA USER NẾU USER ĐÓ VẪN CÓ CÁC ĐƠN HÀNG TRONG TABLE ORDERS
	--> APP FOOD DATABASE
		--+ TẠO DATABASE 'app_food'
			CREATE DATABASE app_food
		--+ USE 'app_food'
			USE app_food
		--+ CREATE TABLE 'users', 'restaurant', 'food_type' VÌ 3 TABLE NÀY KHÔNG CÓ FK
			--* CREATE TABLE 'users'
				CREATE TABLE users
				(
					user_id			INT				PRIMARY KEY		AUTO_INCREMENT	,
					full_name		VARCHAR(100)									,
					email			VARCHAR(100)									,
					pass_word		VARCHAR(100)									
				)
			--* DATA TABLE 'users'
				INSERT INTO users (full_name, email, pass_word) VALUES
					('John Doe'			, 'john.doe@example.com'		, 'password123'		),
					('Jane Smith'		, 'jane.smith@example.com'		, 'password123'		),
					('Michael Johnson'	, 'michael.johnson@example.com'	, 'password123'		),
					('Emily Davis'		, 'emily.davis@example.com'		, 'password123'		),
					('David Brown'		, 'david.brown@example.com'		, 'password123'		),
					('Sophia Wilson'	, 'sophia.wilson@example.com'	, 'password123'		),
					('James Taylor'		, 'james.taylor@example.com'	, 'password123'		),
					('Olivia Martinez'	, 'olivia.martinez@example.com'	, 'password123'		),
					('Daniel White'		, 'daniel.white@example.com'	, 'password123'		),
					('Isabella Harris'	, 'isabella.harris@example.com'	, 'password123'		),
					('Matthew Clark'	, 'matthew.clark@example.com'	, 'password123'		),
					('Ava Rodriguez'	, 'ava.rodriguez@example.com'	, 'password123'		),
					('Lucas Lewis'		, 'lucas.lewis@example.com'		, 'password123'		),
					('Mia Walker'		, 'mia.walker@example.com'		, 'password123'		),
					('Alexander Hall'	, 'alexander.hall@example.com'	, 'password123'		),
					('Amelia Allen'		, 'amelia.allen@example.com'	, 'password123'		),
					('Ethan Scott'		, 'ethan.scott@example.com'		, 'password123'		),
					('Abigail Young'	, 'abigail.young@example.com'	, 'password123'		),
					('William King'		, 'william.king@example.com'	, 'password123'		),
					('Charlotte Wright'	, 'charlotte.wright@example.com', 'password123'		)
			--* CREATE TABLE 'restaurant'
				CREATE TABLE restaurant
				(
					res_id			INT					PRIMARY KEY		AUTO_INCREMENT	,
					res_name		VARCHAR		(100)									,
					res_image		VARCHAR		(255)									,
					res_desc		VARCHAR		(255)									
				)
			--* DATA TABLE 'restaurant'
				INSERT INTO restaurant (res_name, res_image, res_desc) VALUES
					('Sunset Grill'			, 'https://example.com/images/sunset-grill.jpg'			, 'A cozy beachside grill with the best sunsets.'				),
					('Ocean Breeze'			, 'https://example.com/images/ocean-breeze.jpg'			, 'A seafood lover’s paradise, fresh from the sea.'				),
					('Urban Eatery'			, 'https://example.com/images/urban-eatery.jpg'			, 'Trendy dishes for city dwellers with a love for food.'		),
					('Green Garden'			, 'https://example.com/images/green-garden.jpg'			, 'Farm-to-table vegetarian delights.'							),
					('Sushi Dreams'			, 'https://example.com/images/sushi-dreams.jpg'			, 'Fresh and innovative sushi dishes with a modern twist.'		),
					('Taco Fiesta'			, 'https://example.com/images/taco-fiesta.jpg'			, 'A vibrant spot for the best tacos and margaritas.'			),
					('Pizza Palace'			, 'https://example.com/images/pizza-palace.jpg'			, 'Stone-baked pizzas with a variety of fresh toppings.'		),
					('BBQ Nation'			, 'https://example.com/images/bbq-nation.jpg'			, 'A mecca for barbecue enthusiasts, smoky and spicy.'			),
					('El Rancho'			, 'https://example.com/images/el-rancho.jpg'			, 'Tex-Mex flavors with a touch of Southwest charm.'			),
					('Street Bites'			, 'https://example.com/images/street-bites.jpg'			, 'Street food classics from around the world.'					),
					('The Spice Route'		, 'https://example.com/images/spice-route.jpg'			, 'Exotic flavors from across Asia and the Middle East.'		),
					('La Dolce Vita'		, 'https://example.com/images/la-dolce-vita.jpg'		, 'Authentic Italian cuisine in a romantic setting.'			),
					('The Steakhouse'		, 'https://example.com/images/steakhouse.jpg'			, 'Premium steaks and a wide selection of wines.'				),
					('Burgers & Brews'		, 'https://example.com/images/burgers-brews.jpg'		, 'Gourmet burgers paired with the best craft beers.'			),
					('Café de Paris'		, 'https://example.com/images/cafe-de-paris.jpg'		, 'A quaint French café offering pastries and coffee.'			),
					('The Vegan Corner'		, 'https://example.com/images/vegan-corner.jpg'			, 'Innovative plant-based dishes for the conscious eater.'		),
					('The Noodle House'		, 'https://example.com/images/noodle-house.jpg'			, 'Authentic noodle dishes from all over Asia.'					),
					('Mountain View Bistro'	, 'https://example.com/images/mountain-view.jpg'		, 'Rustic dishes with an incredible view of the mountains.'		),
					('The Breakfast Club'	, 'https://example.com/images/breakfast-club.jpg'		, 'Start your day right with delicious breakfast options.'		),
					('The Golden Dragon'	, 'https://example.com/images/golden-dragon.jpg'		, 'Traditional Chinese dishes in a modern setting.'				)
			--* CREATE TABLE 'food_type'
				CREATE TABLE food_type
				(
					type_id		INT				PRIMARY KEY		AUTO_INCREMENT	,
					type_name	VARCHAR(50)
				)
			--* DATA TABLE 'food_type'
				INSERT INTO food_type (type_name) VALUES
					('Italian'		),
					('Chinese'		),
					('Mexican'		),
					('Japanese'		),
					('Indian'		),
					('Thai'			),
					('French'		),
					('Vietnamese'	),
					('Greek'		),
					('Spanish'		),
					('American'		),
					('Turkish'		),
					('Korean'		),
					('Mediterranean'),
					('Lebanese'		),
					('Brazilian'	),
					('Caribbean'	),
					('Ethiopian'	),
					('Moroccan'		),
					('German'		)
			--* CREATE TABLE 'rate_res'
				CREATE TABLE rate_res
				(
					rate_res_id		INT			PRIMARY KEY		AUTO_INCREMENT	,
					amount			INT											,
					date_rate		DATE										,
					
					user_id			INT											,
					FOREIGN KEY(user_id) REFERENCES users(user_id)				,

					res_id 			INT											,
					FOREIGN KEY(res_id) REFERENCES restaurant(res_id)			
				)
			--* DATA TABLE 'rate_res'
				INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
					( 1		, 1		,5		,'2024-09-01'),
					( 2		, 2		,4		,'2024-09-02'),
					( 3		, 3		,3		,'2024-09-03'),
					( 4		, 4		,5		,'2024-09-04'),
					( 5		, 5		,4		,'2024-09-05'),
					( 6		, 6		,5		,'2024-09-06'),
					( 7		, 7		,3		,'2024-09-07'),
					( 8		, 8		,4		,'2024-09-08'),
					( 9		, 9		,5		,'2024-09-09'),
					(10		,10		,4		,'2024-09-10'),
					(11		,11		,5		,'2024-09-11'),
					(12		,12		,3		,'2024-09-12'),
					(13		,13		,4		,'2024-09-13'),
					(14		,14		,5		,'2024-09-14'),
					(15		,15		,3		,'2024-09-15'),
					(16		,16		,4		,'2024-09-16'),
					(17		,17		,5		,'2024-09-17'),
					(18		,18		,4		,'2024-09-18'),
					(19		,19		,3		,'2024-09-19'),
					(20		,20		,5		,'2024-09-20')
			--* CREATE TABLE 'like_res'
				CREATE TABLE like_res
				(
					like_res_id		INT			PRIMARY KEY		AUTO_INCREMENT	,
					date_like		DATE										,

					user_id			INT											,
					FOREIGN KEY(user_id) REFERENCES users(user_id)				,

					res_id 		INT											,
					FOREIGN KEY(res_id) REFERENCES restaurant(res_id)			
				)
			--* DATA TABLE 'like_res'
				INSERT INTO like_res (user_id, res_id, date_like) VALUES
					(1		, 1		, '2024-09-01'	),
					(2		, 2		, '2024-09-02'	),
					(3		, 3		, '2024-09-03'	),
					(4		, 4		, '2024-09-04'	),
					(5		, 5		, '2024-09-05'	),
					(6		, 6		, '2024-09-06'	),
					(7		, 7		, '2024-09-07'	),
					(8		, 8		, '2024-09-08'	),
					(9		, 9		, '2024-09-09'	),
					(10		, 10	, '2024-09-10'	),
					(11		, 11	, '2024-09-11'	),
					(12		, 12	, '2024-09-12'	),
					(13		, 13	, '2024-09-13'	),
					(14		, 14	, '2024-09-14'	),
					(15		, 15	, '2024-09-15'	),
					(16		, 16	, '2024-09-16'	),
					(17		, 17	, '2024-09-17'	),
					(18		, 18	, '2024-09-18'	),
					(19		, 19	, '2024-09-19'	),
					(20		, 20	, '2024-09-20'	);