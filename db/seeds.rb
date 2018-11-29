# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Slava1', email: '1@1', password: '1')
user2 = User.create(name: 'Slava2', email: '2@2', password: '2')
user3 = User.create(name: 'Slava3', email: '3@3', password: '3')

project1 = Project.create(
  name: 'Project1_name',
  description: 'Project_1 description')
  
project2 = Project.create(name: 'Project2_name', description: 'Project_2 description')
project3 = Project.create(name: 'Project3_name', description: 'Project_3 description')
user1.projects << project1
user1.projects << project2
user2.projects << project3
user3.projects << project1
user3.projects << project2
user3.projects << project3