UserTechnology.destroy_all
TicketTechnology.destroy_all
Technology.destroy_all

User.destroy_all
Ticket.destroy_all

# creating users
student = User.create!(email: "student@gmail.com", password: "password")
teacher = User.create!(email: "teacher@gmail.com", password: "password")

# creating technologies
html = Technology.create!(name: "HTML")
rails = Technology.create!(name: "Rails")
ruby = Technology.create!(name: "Ruby")

# linking user to technologies
UserTechnology.create!(user: teacher, technology: html)
UserTechnology.create!(user: teacher, technology: rails)

# creating ticket
ticket = Ticket.new(title: "My ruby ticket", description: "Some description")
ticket.student_id = student.id
ticket.teacher_id = teacher.id
ticket.save

# linking ticket to technologies
TicketTechnology.create!(ticket: ticket, technology: ruby)
