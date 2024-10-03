import express from 'express';

// tạo object tổng của express
const app = express();

//  define port cho Be
app.listen(8080, () => {
	console.log("BE starting with port 8080");
})
