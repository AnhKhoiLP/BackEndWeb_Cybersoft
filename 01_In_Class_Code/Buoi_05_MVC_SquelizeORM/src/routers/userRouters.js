//> Lưu Ý: 
	//+ Tất Cả Các API Về User Hoặc Có Liên Quan Tới User Để Trong userRouters.js Hết
	//+ Còn rootRouters.js Chỉ Có Công Việc Tổng Hợp Các Routers Khác
import express, { request, response } from 'express';
const userRouters = express.Router();
//* Define API Get List Users
userRouters.use("/get-users", (request, response) =>
{
	response.status(200).json
	({
		message: "get-users"
	});
});
export default userRouters;
