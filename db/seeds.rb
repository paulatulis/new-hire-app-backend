# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Lunch.destroy_all
Task.destroy_all
Note.destroy_all

profile_pics = ["https://texashillcountry.com/wp-content/uploads/dolphin-203875_960_720-660x400.jpg", "https://i.pinimg.com/originals/94/f4/88/94f48828c4e3e3eebc70b94d1fa1f17b.jpg", "https://s.abcnews.com/images/Lifestyle/puppy-ht-3-er-170907_4x3_992.jpg", "https://i.redd.it/qwovdoo3a3ay.jpg", "https://data.whicdn.com/images/251959664/large.jpg", "https://www.everypaw.com/uploads/Buying_a_kitten.jpg", "https://www.petmd.com/sites/default/files/small-kitten-walking-towards_127900829_0.jpg", "https://mk0nationaltodayijln.kinstacdn.com/wp-content/uploads/2019/07/national-kitten-day-640x514.jpg"]

paula = User.create(
    email: 'tulis.paula@gmail.com',
    photo: profile_pics.sample,
    team: 'Eng',
    password: '123',
    first_name: 'Paula',
    last_name:  'Tulis',
    username: 'paulatulis',
    title: 'jr. developer',
    bio: "Here is my bio",
    start_date: Date.today,
    location: 'Atlanta',
    manager: false
)

hanaa = User.create(
    email: 'hanaa@flatironschool.com',
    photo: profile_pics.sample,
    team: 'Eng',
    password: '123',
    first_name: 'Hanaa',
    last_name:  'Sadoqi',
    username: 'HanaaSadoqi',
    title: 'SEC',
    bio: "Hi, I'm Hanaa!",
    start_date: Date.today,
    location: 'Atlanta',
    manager: true
)

Task.create(
    user_id: paula.id,
    title: "Orientation",
    description: "Meet your coworkers",
    due_date: Date.today,
    complete: false
)

Task.create(
    user_id: paula.id,
    title: "Read Employee Handbook",
    description: "Find it in Google Drive",
    due_date: Date.today,
    complete: false
)

task1 = Task.create(
    user_id: paula.id,
    title: "All Hands",
    description: "Your first all hands!",
    due_date: Date.today,
    complete: true
)

# Note.create(
#     user_id: paula.id,
#     task_id: task1.id,
#     body: "Note about allHands"
# )

Lunch.create(
    user_id: paula.id,
    colleague_id: hanaa.id,
    location: "Chilis",
    address: "Chilis Address Here",
    name: "Paula and Hanaa get Lunch",
    photo: "photo",
    yelp_info: "placeholder",
    date: Date.today
)