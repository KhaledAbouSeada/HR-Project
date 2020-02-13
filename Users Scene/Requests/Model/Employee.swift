/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Employee : Codable {
	let id : Int?
	let first_name : String?
	let last_name : String?
	let arabic_name : String?
	let job_title : String?
	let email : String?
	let nationality : String?
	let country_id : Int?
	let city_id : Int?
	let department_id : Int?
	let phone : String?
	let photo : String?
	let emergency_number : String?
	let birth_date : String?
	let address : String?
	let marital_status : String?
	let gender : String?
	let employee_type : String?
	let home_phone : String?
	let salary : Int?
	let user_id : Int?
	let hiring_date : String?
	let created_at : String?
	let updated_at : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case first_name = "first_name"
		case last_name = "last_name"
		case arabic_name = "arabic_name"
		case job_title = "job_title"
		case email = "email"
		case nationality = "nationality"
		case country_id = "country_id"
		case city_id = "city_id"
		case department_id = "department_id"
		case phone = "phone"
		case photo = "photo"
		case emergency_number = "emergency_number"
		case birth_date = "birth_date"
		case address = "address"
		case marital_status = "marital_status"
		case gender = "gender"
		case employee_type = "employee_type"
		case home_phone = "home_phone"
		case salary = "salary"
		case user_id = "user_id"
		case hiring_date = "hiring_date"
		case created_at = "created_at"
		case updated_at = "updated_at"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		arabic_name = try values.decodeIfPresent(String.self, forKey: .arabic_name)
		job_title = try values.decodeIfPresent(String.self, forKey: .job_title)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
		country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
		city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
		department_id = try values.decodeIfPresent(Int.self, forKey: .department_id)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		photo = try values.decodeIfPresent(String.self, forKey: .photo)
		emergency_number = try values.decodeIfPresent(String.self, forKey: .emergency_number)
		birth_date = try values.decodeIfPresent(String.self, forKey: .birth_date)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		marital_status = try values.decodeIfPresent(String.self, forKey: .marital_status)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		employee_type = try values.decodeIfPresent(String.self, forKey: .employee_type)
		home_phone = try values.decodeIfPresent(String.self, forKey: .home_phone)
		salary = try values.decodeIfPresent(Int.self, forKey: .salary)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		hiring_date = try values.decodeIfPresent(String.self, forKey: .hiring_date)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
	}

}
