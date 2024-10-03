import express, { request, response } from 'express';
import connect from './db.js';

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

	app.get("/get-user-db",async (request,response) =>
	{
		const [data] = await connect.query('SELECT * FROM appfood.users')
		request.send(data);
	})