	// import mysql from 'mysql2/promise'
	// const	connect = mysql.createPool
	// ({
	// 	host: "localhost",
	// 	user: "root",
	// 	password: "123456",
	// 	database: "app_food",
	// 	port: "3306"
	// })
	// export default connect;
//> Thay Đổi Cách Import Để Giảm Dung Lượng
	// import {createPool} from 'mysql2/promise'
	// const	connect = createPool
	// ({
	// 	host: "localhost",
	// 	user: "root",
	// 	password: "123456",
	// 	database: "app_food",
	// 	port: "3306"
	// })
	// export default connect;
//> Sau Khi Tạo File .env Dùng Đoạn Script Sau
	import {createPool} from 'mysql2/promise'
	import dotenv from 'dotenv'
	dotenv.config();
	const connect = createPool
	({
		host: DB_HOST,
		user: DB_USER,
		password: DB_PASS,
		port: DB_PORT,
		database: DB_DATABASE
	});
	export default connect;