
import mysql from 'mysql2/promise'

const	connect = mysql.createPool
({
	host: "localhost",
	user: "root",
	password: "123456",
	database: "app_food",
	port: "3306"
})

export default connect;