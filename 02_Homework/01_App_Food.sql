	--> APP FOOD DATABASE
		--+ TẠO DATABASE 'app_food'
			CREATE DATABASE app_food
		--+ USE 'app_food'
			USE app_food
		--+ CREATE TABLE 'users', 'restaurant', 'food_type' VÌ 3 TABLE NÀY KHÔNG CÓ FK
			--* CREATE TABLE 'users'
				CREATE TABLE app_food.users
				(
					user_id			INT				PRIMARY KEY		AUTO_INCREMENT	,
					full_name		VARCHAR(100)									,
					email			VARCHAR(100)									,
					pass_word		VARCHAR(100)									
				)
			--* DATA TABLE 'users'
				INSERT INTO app_food.users (full_name, email, pass_word) VALUES
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
				CREATE TABLE app_food.restaurant
				(
					res_id			INT					PRIMARY KEY		AUTO_INCREMENT	,
					res_name		VARCHAR		(100)									,
					res_image		VARCHAR		(255)									,
					res_desc		VARCHAR		(255)									
				)
			--* DATA TABLE 'restaurant'
				INSERT INTO app_food.restaurant (res_name, res_image, res_desc) VALUES
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
				CREATE TABLE app_food.food_type
				(
					type_id		INT				PRIMARY KEY		AUTO_INCREMENT	,
					type_name	VARCHAR(50)
				)
			--* DATA TABLE 'food_type'
				INSERT INTO app_food.food_type (type_name) VALUES
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
				CREATE TABLE app_food.rate_res
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
				INSERT INTO app_food.rate_res (user_id, res_id, amount, date_rate) VALUES
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
				CREATE TABLE app_food.like_res
				(
					like_res_id		INT			PRIMARY KEY		AUTO_INCREMENT	,
					date_like		DATE										,
					user_id			INT											,
					FOREIGN KEY(user_id) REFERENCES users(user_id)				,
					res_id 		INT											,
					FOREIGN KEY(res_id) REFERENCES restaurant(res_id)			
				)
			--* DATA TABLE 'like_res'
				INSERT INTO app_food.like_res (user_id, res_id, date_like) VALUES
				(1		, 12	,'2024-09-01'	),
				(2		, 5		,'2024-09-02'	),
				(3		, 7		,'2024-09-03'	),
				(4		, 18	,'2024-09-04'	),
				(5		, 3		,'2024-09-05'	),
				(6		, 9		,'2024-09-06'	),
				(7		, 1		,'2024-09-07'	),
				(8		, 14	,'2024-09-08'	),
				(9		, 11	,'2024-09-09'	),
				(10		, 6		,'2024-09-10'	),
				(11		, 16	,'2024-09-11'	),
				(12		, 4		,'2024-09-12'	),
				(13		, 2		,'2024-09-13'	),
				(14		, 8		,'2024-09-14'	),
				(15		, 15	,'2024-09-15'	),
				(16		, 19	,'2024-09-16'	),
				(17		, 10	,'2024-09-17'	),
				(18		, 17	,'2024-09-18'	),
				(19		, 13	,'2024-09-19'	),
				(20		, 20	,'2024-09-20'	),
				(1		, 6		,'2024-09-21'	),
				(2		, 9		,'2024-09-22'	),
				(3		, 5		,'2024-09-23'	),
				(4		, 11	,'2024-09-24'	),
				(5		, 4		,'2024-09-25'	),
				(6		, 18	,'2024-09-26'	),
				(7		, 2		,'2024-09-27'	),
				(8		, 16	,'2024-09-28'	),
				(9		, 3		,'2024-09-29'	),
				(10		, 8		,'2024-09-30'	),
				(11		, 12	,'2024-10-01'	),
				(12		, 1		,'2024-10-02'	),
				(13		, 17	,'2024-10-03'	),
				(14		, 14	,'2024-10-04'	),
				(15		, 20	,'2024-10-05'	),
				(16		, 19	,'2024-10-06'	),
				(17		, 15	,'2024-10-07'	),
				(18		, 7		,'2024-10-08'	),
				(19		, 10	,'2024-10-09'	),
				(20		, 13	,'2024-10-10'	),
				(1		, 5		,'2024-10-11'	),
				(2		, 9		,'2024-10-12'	),
				(3		, 2		,'2024-10-13'	),
				(4		, 16	,'2024-10-14'	),
				(5		, 3		,'2024-10-15'	),
				(6		, 18	,'2024-10-16'	),
				(7		, 4		,'2024-10-17'	),
				(8		, 6		,'2024-10-18'	),
				(9		, 11	,'2024-10-19'	),
				(10		, 8		,'2024-10-20'	)
			--* CREATE TABLE 'foods'
				CREATE TABLE app_food.foods
				(
					food_id 				INT 		PRIMARY KEY 	AUTO_INCREMENT	,
					food_name 				VARCHAR		(100)							,
					price 					INT											,
					description 			VARCHAR		(255)							,
					image 					VARCHAR		(255)							,
					type_id 				INT											,
					FOREIGN KEY(type_id) REFERENCES food_type(type_id)					
				)
			--* DATA TABLE 'foods'
				INSERT INTO app_food.foods (food_name, type_id, price, image, description) VALUES
				('Margherita Pizza'			, 1		, 150000	, 'https://example.com/images/margherita-pizza.jpg'		, 'Classic Italian pizza with tomatoes and mozzarella.'			),
				('General Tso''''s Chicken'	, 2		, 120000	, 'https://example.com/images/general-tsos-chicken.jpg'	, 'Spicy, tangy, and sweet Chinese-style fried chicken.'		),
				('Tacos al Pastor'			, 3		, 90000		, 'https://example.com/images/tacos-al-pastor.jpg'		, 'Mexican tacos with marinated pork and pineapple.'			),
				('Sushi Roll'				, 4		, 180000	, 'https://example.com/images/sushi-roll.jpg'			, 'Fresh sushi rolls with salmon, avocado, and rice.'			),
				('Chicken Curry'			, 5		, 160000	, 'https://example.com/images/chicken-curry.jpg'		, 'Rich and flavorful Indian chicken curry.'					),
				('Pad Thai'					, 6		, 130000	, 'https://example.com/images/pad-thai.jpg'				, 'Popular Thai stir-fried noodles with shrimp and peanuts.'	),
				('Croissant'				, 7		, 50000		, 'https://example.com/images/croissant.jpg'			, 'Buttery and flaky French pastry.'							),
				('Pho'						, 8		, 100000	, 'https://example.com/images/pho.jpg'					, 'Traditional Vietnamese beef noodle soup.'					),
				('Gyro'						, 9		, 120000	, 'https://example.com/images/gyro.jpg'					, 'Greek pita filled with seasoned lamb and vegetables.'		),
				('Paella'					, 10	, 180000	, 'https://example.com/images/paella.jpg'				, 'Spanish rice dish with seafood and saffron.'					),
				('Cheeseburger'				, 11	, 140000	, 'https://example.com/images/cheeseburger.jpg'			, 'Juicy American cheeseburger with lettuce and tomato.'		),
				('Lamb Kebab'				, 12	, 170000	, 'https://example.com/images/lamb-kebab.jpg'			, 'Grilled Turkish lamb skewers with spices.'					),
				('Bibimbap'					, 13	, 150000	, 'https://example.com/images/bibimbap.jpg'				, 'Korean rice bowl with vegetables, beef, and egg.'			),
				('Falafel Wrap'				, 14	, 110000	, 'https://example.com/images/falafel-wrap.jpg'			, 'Mediterranean wrap with falafel, hummus, and veggies.'		),
				('Hummus'					, 15	, 80000		, 'https://example.com/images/hummus.jpg'				, 'Traditional Lebanese chickpea dip served with pita.'			),
				('Churrasco'				, 16	, 200000	, 'https://example.com/images/churrasco.jpg'			, 'Brazilian grilled beef steak with chimichurri.'				),
				('Jerk Chicken'				, 17	, 150000	, 'https://example.com/images/jerk-chicken.jpg'			, 'Spicy Caribbean jerk chicken with rice and peas.'			),
				('Doro Wat'					, 18	, 130000	, 'https://example.com/images/doro-wat.jpg'				, 'Ethiopian spicy chicken stew with injera.'					),
				('Tagine'					, 19	, 160000	, 'https://example.com/images/tagine.jpg'				, 'Moroccan slow-cooked meat and vegetable stew.'				),
				('Bratwurst'				, 20	, 100000	, 'https://example.com/images/bratwurst.jpg'			, 'German sausage served with mustard and sauerkraut.'			)
			--* CREATE TABLE 'orders'
				CREATE TABLE app_food.orders
				(
					order_id 		INT 		PRIMARY KEY 	AUTO_INCREMENT	,
					amount 			INT											,
					arr_sub_id 		VARCHAR		(255)							,
					food_id 		INT											,
					FOREIGN KEY(food_id) REFERENCES foods(food_id)				,
					user_id 		INT											,
					FOREIGN KEY(user_id) REFERENCES users(user_id)				
				)
			--* DATA TABLE 'orders'
				INSERT INTO app_food.orders (food_id, user_id, amount, arr_sub_id) VALUES
				(1		, 1		, 2		, 'SUB123, SUB456'	),
				(2		, 2		, 1		, 'SUB789'			),
				(3		, 3		, 3		, 'SUB101, SUB102'	),
				(4		, 4		, 2		, 'SUB103, SUB104'	),
				(5		, 5		, 1		, 'SUB105'			),
				(6		, 6		, 4		, 'SUB106, SUB107'	),
				(7		, 7		, 2		, 'SUB108'			),
				(8		, 8		, 3		, 'SUB109, SUB110'	),
				(9		, 9		, 1		, 'SUB111'			),
				(10		, 10	, 2		, 'SUB112, SUB113'	),
				(11		, 11	, 1		, 'SUB114'			),
				(12		, 12	, 2		, 'SUB115, SUB116'	),
				(13		, 13	, 3		, 'SUB117'			),
				(14		, 14	, 4		, 'SUB118, SUB119'	),
				(15		, 15	, 1		, 'SUB120'			),
				(16		, 16	, 3		, 'SUB121, SUB122'	),
				(17		, 17	, 2		, 'SUB123'			),
				(18		, 18	, 4		, 'SUB124, SUB125'	),
				(19		, 19	, 1		, 'SUB126'			),
				(20		, 20	, 2		, 'SUB127, SUB128'	)
			--* CREATE TABLE 'sub_food'
				CREATE TABLE app_food.sub_food
				(
					sub_food_id 				INT 		PRIMARY KEY 	AUTO_INCREMENT	,
					sub_food_name 				VARCHAR		(100)							,
					sub_food_price 				INT											,
					food_id 					INT											,
					FOREIGN KEY(food_id) REFERENCES foods(food_id)					
				)
			--* DATA TABLE 'sub_food' - EMPTY
		--+ HIỂN THỊ 5 NGƯỜI ĐÃ LIKE NHÀ HÀNG NHIỀU NHẤT
			SELECT DISTINCT
				user_id,
				COUNT(user_id) OVER (PARTITION BY user_id) AS User_Like,
				(
					SELECT full_name
					FROM app_food.users
					WHERE like_res.user_id = user_id
				)  AS Full_Name
			FROM app_food.like_res
			ORDER BY User_Like DESC
			LIMIT 5
		--+ TÌM 2 NHÀ HÀNG CÓ LƯỢT LIKE NHIỀU NHẤT
			SELECT 
				app_food.like_res.res_id,
				(
					SELECT res_name
					FROM app_food.restaurant
					WHERE res_id = app_food.like_res.res_id
				) AS Rest_Name,
				COUNT(app_food.like_res.user_id) AS Count_Like
			FROM app_food.like_res
			GROUP BY app_food.like_res.res_id
			ORDER BY Count_Like DESC
			LIMIT 2
		--+ ĐẶT HÀNG NHIỀU NÈ
			SELECT u.user_id, u.full_name, COUNT(o.order_id) AS order_count
			FROM users u
			JOIN orders o ON u.user_id = o.user_id
			GROUP BY u.user_id, u.full_name
			ORDER BY order_count DESC
			LIMIT 1
		--+ MR.NOBODY NÈ. ẨN DANH NÈ, KO ĂN KO UỐNG NÈ
			--* TẠO THÊM USER KHÔNG HOẠT ĐỘNG
				INSERT INTO app_food.users (full_name, email, pass_word) VALUES
					('Mr.Nobody'			, 'Nobody.MR@example.com'		, 'password123'		)
			--* TÌM RA THẰNG ẨN DANH
				SELECT 
					user_id, 
					full_name 
				FROM 
					app_food.users u
				WHERE 
					app_food.users.user_id NOT IN (SELECT user_id FROM app_food.orders) AND
					app_food.users.user_id NOT IN (SELECT user_id FROM app_food.like_res) AND
					app_food.users.user_id NOT IN (SELECT user_id FROM app_food.rate_res)