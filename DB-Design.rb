# 旅游线路
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
	cover:string

# 行程安排
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

# 地区
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


# 兴趣点，主题
##Interest
	has_tree
	title:string
	cont:text


##Interest_travel
	interest_id:integer
	travel_id:integer


# 酒店
##Hotel
	have gallery
	name:string
	destination_id:integer


# 每一个团的具体信息
##Datesprice
	travel_id:integer
	start_date:datetime
	end_date:datetime
	prices:integer
	single_supplement:integer
	internal_airfare:integer
	availability_status:integer (多种状态: "Available", "Call for Availability", "Limited Availability")
	available_people_count:integer


# 优惠信息
##Specialoffer
	cover:string
	title:string
	desc:text
	note:text
	

##Specialoffer_travel
	specialoffer_id:integer
	travel_id:integer
	datesprice_id:integer


##Extensions


# 管理零碎页面，如关于我们等
##Page
	name:string
	title:string
	cont:text


# 新闻模块
##Presses
	title:string
	cont:text

# 最近动态，活动模块
##Events
	title:string
	cont:text


##Press_Travel
	presses_id:integer
	travel_id:integer


# 管理页头大banner
##Banner 
	name:string 
	cover:string


# 各模块的gallery公用多态上传类
##Photo
	sort:integer
	pic:string
	desc:string
	resource:string
	resource_id:integer

# PDF
##Brochure(PDF)
	name:string
	desc:text
	cover:string
	doc:string
	comment:text

##Brochure_travel
	brochure_id:integer
	travel_id:integer

##Brochure_interest
	brochure_id:integer
	interest_id:integer

##Brochure_destination
	brochure_id:integer
	destination_id:integer


##Booking
	mrs_title:string
	first_name:string
	last_name:string
	preferred_contact_method:integer
	email:string
	phone:string
	country:string
	region:string
	postal_code:string
	is_subscribe:boolean
	user_id:integer
	travel_id:integer
	datesprice_id:integer
	destination_id:integer
	people_count:integer
	agent_name:string
	agent_code:string
	comment:text


##Gbooking
	mrs_title:string
	first_name:string
	last_name:string
	preferred_contact_method:integer
	email:string
	phone:string
	country:string
	region:string
	postal_code:string
	is_subscribe:boolean
	user_id:integer
	agent_name:string
	agent_code:string
	destination_id:integer
	departure_date:datetime
	trip_day_length:integer
	adult_count:integer
	child_count:integer
	event_comment:text
	city_comment:text


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
