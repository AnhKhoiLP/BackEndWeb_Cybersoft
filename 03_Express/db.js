// // Tạo Object Để Kết Nối Tới Database'
// 	import mysql from 'mysql2/promise'

// 	const connect = mysql.createPool(
// 	{
// 		host: "localhost",
// 		user: "root",
// 		password: "123456",
// 		database: "MySQL_NodeJS47",
// 		port: 3306
// 	});

// 	export default connect;
import mysql from 'mysql2/promise'
import dotenv from 'dotenv';
dotenv.config();

	const connect = mysql.createPool
	(
		{
			host: process.env.DB_HOST,
			user: process.env.DB_USER,
			password: process.env.DB_PASS,
			database: process.env.DB_DATABASE,
			port: process.env.DB_PORT,
		}
	);

	export default connect;