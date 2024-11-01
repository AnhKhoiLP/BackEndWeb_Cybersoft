//> Lưu Ý: 
	//+ Tất Cả Các API Về User Hoặc Có Liên Quan Tới User Để Trong userRouters.js Hết
	//+ Còn rootRouters.js Chỉ Có Công Việc Tổng Hợp Các Routers Khác
import express from 'express';
import { addUsers, getUsers, getUsersDB } from '../controllers/userControllers.js';
const userRouters = express.Router();

//* Define API Get List Users
userRouters.use("/get-users", getUsers);
userRouters.use("/get-user-database", getUsersDB);
userRouters.use("/add-user-database", addUsers);

export default userRouters;
