import express from 'express';

// Tạo Object Tổng Của Express
const app = express();

// Viết API Hello World
	app.get("/hello-world", (request, response) => 
	{
		response.send("hello world1")
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
			response.send({id, hoTen, queryString});
	})
// Define Port Cho BE
app.listen(8080, () => {
	console.log("BE starting with port 8080");
})
