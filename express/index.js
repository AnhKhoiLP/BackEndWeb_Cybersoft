import express from 'express';

// Tạo object tổng của express
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

	app.get ("/get-user/:id", (request, response) =>
	{
		//Lấy ID Từ URL
			let {id}= request.params;
			response.send(id);
	})
// Define Port Cho BE
app.listen(8080, () => {
	console.log("BE starting with port 8080");
})
