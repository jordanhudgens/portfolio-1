# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |x|
	Topic.create!(
		title: "Topic #{x}"
	)
end

puts "3 topics created"

10.times do |x|
	Blog.create!(
		title: "my blog #{x}",
		body: "asd asd asdasdasdas adasdasd",
		topic_id: Topic.last.id
	)
end

puts "10 blog posts created"

5.times do |x|
	Skill.create!(
		title: "rails #{x}",
		percent_utilized: 15
	)	
end

puts "5 skills created"

9.times do |x|
	PortfolioItem.create!(
		title: "Portfolio title #{x}",
		subtitle: "Subtitle for #{x}",
		body: "adsd asd asdasd asdasdasdasdas asd",
		main_image: "http://placehold.it/600x400",
		thumb_image: "http://placehold.it/350x200"
	)
end
puts "9 Portfolio items created"

3.times do |x|
	Technology.create!(
		name: "Technology #{x}",
		portfolio_item_id: PortfolioItem.last.id
	)
end
puts "3 Technologies created"




