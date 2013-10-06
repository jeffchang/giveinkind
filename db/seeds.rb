# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'flickraw'
FlickRaw.api_key = ENV["FLICKR_API_KEY"]
FlickRaw.shared_secret = ENV["FLICKR_SHARED_SECRET"]

results = flickr.photos.search(:tags => "poverty", :sort => "interestingness-desc").map {|result| result.id}
urls = results[0..249].map {|result| FlickRaw.url_b(flickr.photos.getInfo(:photo_id => result))}

urls.each do |url|
  Photo.create(image_url: url)
end


category_01 = Category.create(name: "White Goods", icon: "/assets/white_goods.svg")
subcategories = *(01..10)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_01)
end
["fridge", "freezer", "fridge/freezer", "cooker", "washing machine"]

category_02 = Category.create(name: "Household and Furniture", icon: "/assets/household.svg")
subcategories = *(11..20)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_02)
end

category_03 = Category.create(name: "Small Electrical", icon: "/assets/small_electrical.svg")
subcategories = *(21..30)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_03)
end

category_04 = Category.create(name: "Lighting", icon: "/assets/lighting.svg")
subcategories = *(31..40)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_04)
end

category_05 = Category.create(name: "Bedroom", icon: "/assets/bedroom.svg")
subcategories = *(41..50)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_05)
end
["bedframe", "mattress", "other"]

category_06 = Category.create(name: "Carpets and Rugs", icon: "/assets/carpets_and_rugs.svg")
subcategories = *(51..60)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_06)
end

category_07 = Category.create(name: "Paint and Decoration", icon: "/assets/decoration.svg")
subcategories = *(61..70)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_07)
end

category_08 = Category.create(name: "Clothing", icon: "/assets/clothing.svg")
subcategories = *(71..80)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_08)
end
["ladies'", "men's", "children's", "shoes"]

category_09 = Category.create(name: "Bicycles", icon: "/assets/bikes.svg")
subcategories = *(81..90)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_09)
end

category_10 = Category.create(name: "Baby", icon: "/assets/baby.svg")
subcategories = *(91..100)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_10)
end

category_11 = Category.create(name: "Toys", icon: "/assets/toys.svg")
subcategories = *(101..110)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_11)
end

category_12 = Category.create(name: "Computers and Electronics", icon: "/assets/computers.svg")
subcategories = *(111..120)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_12)
end

category_13 = Category.create(name: "Employment", icon: "/assets/employment.svg")
subcategories = *(121..130)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_13)
end

category_14 = Category.create(name: "Hobby Items", icon: "/assets/hobbies.svg")
subcategories = *(131..140)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_14)
end

category_15 = Category.create(name: "Specialist Items", icon: "/assets/specialist.svg")
subcategories = *(141..150)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_15)
end

category_16 = Category.create(name: "Other", icon: "/assets/other.svg")
subcategories = *(151..160)
subcategories.each do |subcategory|
  Subcategory.create(name: subcategory, category: category_16)
end
