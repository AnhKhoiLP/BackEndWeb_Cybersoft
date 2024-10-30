import express from "express";
import connect from "./database.js";
//| Tạo Back-End Cơ Bản
	//+ Tạo Object Tổng Của Express
		const app = express()
	//+ Define Port Cho BE
		app.listen(8080, () =>
			{
				console.log("BE Starting With Port 8080");
			})
	//+ Kiểm Tra 
		//* cd Tới Đường Dẫn Thư Mục Chứa File .JS
		//* Ví Dụ: cd .\BackEndWeb_Cybersoft\01_In_Class_Code\Buoi_04_Express\
		//* Sau Đó Gõ node index.js ⇨ Enter ⇨ Sẽ Hiện Ra "BE Starting With Port 8080"
		//* Mở Browser Gõ http://localhost:8080 Ra Được "Cannot GET /" ⇨ Đã Start Được BE Thành Công
	//+ Define Script Riêng Để Chạy File JS
		//* Vào Package.json. Tại Phần Script
		//* Thêm 1 Đoạn Script: "start": "node index.js"
		//* Từ Giờ Thay Vì Gõ node index.js ⇨ Gõ npm run start
		//* Có Thể Đổi "start" Thành Bất Cứ Gì Để Rõ Nghĩa
	//+ Thư Viện Nodemon
		//* Không Thể Mỗi Lần Code Là Tắt Server Đi Để Mở Lại ⇨ Tốn Thời Gian
		//* Mỗi Lần Code Xong Chỉ Cần Save Lại Thì Server Sẽ Tự Động Start Lại Server Mới
			//# Cài Thư Viện Có Tên Là Nodemon ⇨ Câu Lệnh Cài: npm i nodemon / npm i nodemon
			//# Sau Đó Nodemon Sẽ Được Cài Trong Thư Mục node_modules Tại Đường Dẫn Của Terminal
		//* Sau Đó Sửa Lại Đoạn Script Trong Package.json
			//# "start": "node index.js" ⇨ "start": "nodemon index.js"
//| Viết API
	//? API GET
		//+ API Hello World
			app.get("/hello-world", (request, response) =>
			{
				response.send("Hello World");
			})
		//+ API Check Server
			app.get("/health-check", (request, response) =>
			{
				response.send("Server Is Normally");
			})
		//+ Lấy Thông Tin Data Từ Params, Query String, Headers, Body
			//? Params
				//> 1 Variable ID
					app.get("/get-user/:id", (request, response) => 
					{
						//* Lấy ID Từ URL
						let {id} = request.params;
							response.send(id);
					})
					// http://localhost:8080/get-user/10/
				//> 2 Variable ID, hoTen
					app.get("/get-user/:id/:hoTen", (request, response) => 
					{
						//* Lấy ID Từ URL
						let {id, hoTen} = request.params;
							response.send
							({
									id,
									hoTen
							});
					})
					// http://localhost:8080/get-user/10/LePhuocAnhKhoi
			//? Query String
				//? Giả Sử Muốn Search Họ Tên
					app.get("/get-user-query/:id/:hoTen", (request, response) => 
						{
							//* Lấy ID Từ URL
							let {id, hoTen} = request.params;
							let {queryString} = request.query;
								response.send
								({
									id,
									hoTen,
									queryString
								});
						})
						// http://localhost:8080/get-user-query/10/LePhuocAnhKhoi?queryString=Kh%C3%B4i
			//? Headers, Body
				//? Dùng Postman (Headers)
					app.get("/get-user-by-token/:id/:hoTen", (request, response) => 
						{
							//* Lấy ID Từ URL
							let {id, hoTen} = request.params;
							let {queryString} = request.query;
							let {token} = request.headers;
								response.send
								({
									id,
									hoTen,
									queryString,
									token
								});
						})
				//* Vào Postman Qua Tab Headers Nhập token Và Value
				//* http://localhost:8080/get-user-by-token/10/LePhuocAnhKhoi?queryString=Khoi
				app.get("/get-user-by-token-autho/:id/:hoTen", (request, response) => 
					{
						//* Lấy ID Từ URL
						let {id, hoTen} = request.params;
						let {queryString} = request.query;
						let {token,authorization} = request.headers;
							response.send
							({
								id,
								hoTen,
								queryString,
								token,
								authorization
							});
					})
				//* Vào Postman Qua Tab Headers Nhập token Và Value
				//* http://localhost:8080/get-user-by-token-autho/10/LePhuocAnhKhoi?queryString=Khoi
	//? API POST (Create) Và PUT (Update)
		//> Lưu Ý: Để Mà Lấy Được Thông Tin Body Từ API PUT Và POST Thì Phải Convert Từ String Sang JSON ⇨ Cần Middleware Để Convert JSON Sang String
		//? Thêm Middleware Convert String Về JSON Với API POST Và PUT
			app.use(express.json());
		//? API Create User
			app.post("/create-user", (request, response) => 
			{
				let body = request.body;
				response.send(body);
			})
			//* Body ⇨ raw ⇨ json ⇨ Nhập
			//* {"id": "01","hoTen": "Khôi","test": "test"}
			//* http://localhost:8080/create-user
//| Kết Nối Tới Database
	//? Tạo Object Để Kết Nối Tới Database
		//* B01: npm i mysql2
		//* B02: Tạo File database.js
		//* B03:
	//? API Get User From Database
		app.get("/get-user-database", async(request, response) =>
		{
			const [database] = await connect.query
			(`
				select full_name, email from users
			`)
			response.send(database);
		})
		//* http://localhost:8080/create-user