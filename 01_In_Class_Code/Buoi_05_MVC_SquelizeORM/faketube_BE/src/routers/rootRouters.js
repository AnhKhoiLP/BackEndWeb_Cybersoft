//> Lưu Ý: 
	//+ Còn rootRouters.js Có Công Việc Tổng Hợp Các Routers Khác

import express from 'express';
	//| Define Object rootRouters
		const rootRouters = express.Router();
	//| Import userRouters Vào rootRouters
		import userRouters from './userRouters.js';
		rootRouters.use("/user", userRouters)
export default rootRouters;

