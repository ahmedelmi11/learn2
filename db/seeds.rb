puts "Clearing old data"
UserTechnology.destroy_all
TicketTechnology.destroy_all
Technology.destroy_all

User.destroy_all
Ticket.destroy_all

puts "Creating Users"
# creating users
student = User.create!(email: "student@gmail.com", password: "password", first_name: "Ahmed", last_name: "Elmi")
teacher = User.create!(email: "teacher@gmail.com", password: "password", first_name: "David", last_name: "O'Neill" )

puts "Creating technologies"
# creating technologies
html = Technology.create!(name: "HTML")
rails = Technology.create!(name: "Rails")
ruby = Technology.create!(name: "Ruby")
python = Technology.create!(name: "Python")
javascript = Technology.create!(name: "Javascript")
java = Technology.create!(name: "Java")
php = Technology.create!(name: "PHP")
android = Technology.create!(name: "Android")
ios = Technology.create!(name: "IOS")


puts "Linking users to technologies"
# linking user to technologies
UserTechnology.create!(user: teacher, technology: html)
UserTechnology.create!(user: teacher, technology: rails)
UserTechnology.create!(user: teacher, technology: ruby)
UserTechnology.create!(user: teacher, technology: python)
UserTechnology.create!(user: teacher, technology: javascript)
UserTechnology.create!(user: teacher, technology: java)
UserTechnology.create!(user: teacher, technology: php)
UserTechnology.create!(user: teacher, technology: android)
UserTechnology.create!(user: teacher, technology: ios)



# creating ticket
ticket = Ticket.new(title: "My ruby ticket", description: "Some description")
ticket.student_id = student.id
ticket.teacher_id = teacher.id
ticket.save

puts 'Linking ticket to technologies'
# linking ticket to technologies
TicketTechnology.create!(ticket: ticket, technology: ruby)
puts "Finished"
