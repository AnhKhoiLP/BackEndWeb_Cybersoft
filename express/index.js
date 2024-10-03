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
// Define port cho Be
app.listen(8080, () => {
	console.log("BE starting with port 8080");
})
