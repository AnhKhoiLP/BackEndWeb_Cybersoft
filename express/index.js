import express, { request, response } from 'express';
import connect from './db.js';

// Load Biến Môi Trường Từ File .env


// Tạo Object Tổng Của Express
	const app = express();

// Thêm Middlware Để Convert String Sang JSON Với API POST Và PUT
	app.use(express.json());

// Viết API Hello World
	app.get("/hello-world", (request, response) => 
	{
		response.send("hello world")
	})
	
	app.get("/health-check", (request, response) =>
	{
		response.send("Server is normally")
	})
	app.get ("/get-user/:id/:hoTen", (request, response) =>
	{
		//Lấy ID Từ URL
			let {id, hoTen}= request.params;
			let {queryString} = request.query;
			let {token, authorization} = request.headers;
			let headers = request.headers
			response.send({id, hoTen, queryString, token, authorization});
	})
// Define Port Cho BE
	app.listen(8080, () => {
		console.log("BE starting with port 8080");
	})

// Lấy Body Từ API POST(CREATE) Và PUT(UPDATE)
	app.post("/create-user",(request,response) => 
	{
		let body = request.body;
		response.send(body);
	})

	// app.post("/create-user-db", async (request,response) => 
	// {
	// 	const query = 'INSERT INTO users (full_name, email, pass_word) VALUES (?, ?, ?)';
	// 	let body = request.body;
	// 	let {full_name, email, pass_word} = body;
	// 	await connect.execute(query, [full_name, email, pass_word], (err, result))
	// 		if (err)
	// 		{
	// 			return response.send("error");
	// 		}
	// 		return response.send(result);
	// })

	// app.post("/create-user-db", async (request,response) => 
	// {
	// 	const query = `INSERT INTO app_food.users (full_name, email, pass_word) VALUES (?, ?, ?)`;
	// 	let body = request.body;
	// 	let {full_name, email, pass_word} = body;
	// 	const [data] = await connect.execute(query, [full_name, email, pass_word]);
	// 	return response.send(data);
	// });

	app.post("/create-user-db", async (req, res) => {
		const query = `
			INSERT INTO app_food.users (full_name, email, pass_word) VALUES
			(?, ?, ?)
		`;
		let body = req.body;
		let {full_name, email, pass_word} = body;
		const [data] = await connect.execute(query, [full_name, email, pass_word])
		return res.send(data);
	})

	// app.post("/create-user-db", async (request, response) => {
	// 	const query = 'INSERT INTO app_food.users (full_name, email, pass_word) VALUES (?, ?, ?)';
	// 	let { full_name, email, pass_word } = request.body;
	
	// 	try {
	// 		const [result] = await connect.execute(query, [full_name, email, pass_word]);
	// 		return response.send(result);
	// 	} catch (err) {
	// 		return response.status(500).send("Error: " + err.message);
	// 	}
	// });

	app.get("/get-user-db",async (request,response) =>
	{
		const [data] = await connect.query('SELECT * FROM app_food.users')
		response.send(data);
	})