##Travel
	have gallery
	have right top pic
	"name" :string
	"sub_name" :string
	"series_name" :string
	"series_cont"	:text
	"priced_from" :integer
	"days_count"	:integer
	"departures" :integer
	"max_group_size" :integer
	"overview_desc" :text
	"overview_advantage" :text
	"notes" :text
	"extensions_ids" :text
	"itinerary_pic"	:text


##Itinerary
	have gallery
	name:string
	desc:text
	travel_id:integer
	sort:integer
	hotel_id:integer
	meals:string
	start_day_num:integer
	end_day_num:integer


##Destination
	have gallery
	has_tree
	name:string
	desc_title:string
	desc:text
	banner_pic:string
	map_pic:string
	flights:text
	timezone:string
	climate:text
	health_requirements:text
	voltage:text
	currency:text


##Destination_travel
	destination_id:integer
	travel_id:integer


##Interest
	has_tree
	title:string
	cont:text


##Interest_travel
	interest_id:integer
	travel_id:integer


##Hotel
	have gallery
	name:string
	destination_id:integer


##Datesprice
	travel_id:integer
	start_date:datetime
	end_date:datetime
	prices:integer
	single_supplement:integer
	internal_airfare:integer
	availability_status:integer (多种状态: "Available", "Call for Availability", "Limited Availability")
	available_people_count:integer


##Specialoffer
	title:string
	cont:text
	pic:string


##Specialoffer_travel
	specialoffer_id:integer
	travel_id:integer


##Extensions


##News


##News_Travel


##Gallery
	"name" :string
	"photo" :string
	"type" :string
	"type_id" :integer


##Brochure(PDF)
	"name"
	"file"
	"travel_ids"
	"comment"



##Page


##Booking
	"travel_id" :integer
	"datesprice_id" :integer
	"people_count"	:integer



##Question
	"preferred_contact_method" :integer
	"email"	:string
	"mrs_title"	:string
	"first_name" :string
	"last_name"	:string
	"country"	:string
	"phone"	:string
	"question"	:text
	"travel_id" :integer



##User
	has_past:boolean
	title:string
	name:string
	login:string
	address:string
	city:string
	region:string
	postal_code:string
	country:string
	home_phone:string
	cellphone:string
	birth_date:datetime
	travel_agent:string
	travel_agent_code:string


##Saves_trip(Compare)



##Setting
	400电话

::::::::::
金额用什么字段，整数还是货币
