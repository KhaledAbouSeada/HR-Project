/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Requests : Codable {
	let description : String?
	let employee : Employee?
	let type : String?
	let from : String?
	let to : String?
	let status : String?
	let reply : String?
	let employee_id : Int?
	let id : Int?

	enum CodingKeys: String, CodingKey {

		case description = "description"
		case employee = "employee"
		case type = "type"
		case from = "from"
		case to = "to"
		case status = "status"
		case reply = "reply"
		case employee_id = "employee_id"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		employee = try values.decodeIfPresent(Employee.self, forKey: .employee)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		from = try values.decodeIfPresent(String.self, forKey: .from)
		to = try values.decodeIfPresent(String.self, forKey: .to)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		reply = try values.decodeIfPresent(String.self, forKey: .reply)
		employee_id = try values.decodeIfPresent(Int.self, forKey: .employee_id)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
	}

}