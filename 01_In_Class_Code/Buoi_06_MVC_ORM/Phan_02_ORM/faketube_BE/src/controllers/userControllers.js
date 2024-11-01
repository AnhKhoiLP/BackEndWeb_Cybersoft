import connect from "../../database.js"

const getUsers = (request, response) =>
{
	response.status(200).json
	({
		message: "get-users"
	})
}

const getUsersDB = async(request, response) =>
	{
		const [database] = await connect.query
		(`
			SELECT
				full_name,
				email
			FROM users
		`)
		response.send(database);
	}

const addUsers = async (request, response) => 
	{
		const query = 
			`
				INSERT INTO app_food.users (full_name, email, pass_word) VALUES (?, ?, ?)
			`
		let body = request.body;
		let {full_name, email, pass_word} = body;
		const [data] = await connect.execute(query, [full_name, email, pass_word])
		return response.send(data);
	}
export
{
	getUsers,
	getUsersDB,
	addUsers
}