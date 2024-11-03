import express, {query, request, response} from "express";
import connect from "./1_database.js";

const app = express()
app.listen(8080, () =>
	{
		console.log("BE Starting With Port 8080");
	})

//+ Get User From Database 
	app.get("/get-user-from-database", async (request, response) =>
	{
		const[data] = await connect.query
		(`
			SELECT
				user_id AS "User ID",
				full_name As "Full Name",
				email AS "User Emall",
				pass_word AS "Password"
			FROM users
		`)
		response.send(data);
	})
	//> http://localhost:8080/get-user-from-database