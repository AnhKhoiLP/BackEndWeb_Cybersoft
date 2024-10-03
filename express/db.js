// Tạo Object Để Kết Nối Tới Database'
	import mysql from 'mysql2/promise'

	const connect = mysql.createPool(
	{
		host: "localhost",
		user: "root",
		password: "123456",
		database: "MySQL_NodeJS47",
		port: 3306
	});

	export default connect;