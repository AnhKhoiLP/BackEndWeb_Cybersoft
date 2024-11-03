import express, {query, request, response} from "express";
import connect from "./1_database.js";

const app = express()
app.listen(8080, () =>
	{
		console.log("BE Starting With Port 8080");
	})
app.get("/get-user-from-database", async (request, response) =>
	{
		const[data] = await connect.query
		(`
			SELECT
				*
			FROM users
		`)
		response.send(data);
	})
