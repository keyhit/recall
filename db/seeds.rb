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
  name: 'Name project1_name',
  description: 'Project_1 description',
  user_id: user1.id
)

project2 = Project.create(
  name: 'Name poject2',
  description: 'Project_2 description',
  user_id: user1.id
)

project3 = Project.create(
  name: 'Name project3_name',
  description: 'Project_3 description',
  user_id: user2.id
)

user1.projects << project1
user1.projects << project2
user2.projects << project3
user3.projects << project1
user3.projects << project2
user3.projects << project3

project1_part1 = Part.create(
  name: 'Part 1 project1 name',
  description: 'Description part1 project1',
  user_id: user1.id,
  project_id: project1.id
)
project1_part1_task1 = Task.create(
  name: 'Name project1_part1_task1',
  description: 'Description project1_part1_task1',
  user_id: user1.id,
  project_id: project1.id,
  part_id: project1_part1.id
)

project1_part1_task2 = Task.create(
  name: 'Name project1_part1_task2',
  description: 'Description project1_part1_task2',
  user_id: user1.id,
  project_id: project1.id,
  part_id: project1_part1.id
)

project1_part1_task1_commet1 = Comment.create(
  name: 'Name project1_part1_task1_comment1',
  description: 'Description project1_part1_task1_comment1',
  user_id: user1.id,
  project_id: project1.id,
  part_id: project1_part1.id,
  task_id: project1_part1_task1.id
)

project1_part1_task1_commet2 = Comment.create(
  name: 'Name project1_part1_task1_comment2',
  description: 'Description project1_part1_task1_comment2',
  user_id: user1.id,
  project_id: project1.id,
  part_id: project1_part1.id,
  task_id: project1_part1_task1.id
)

project1_part1_task1_commet3 = Comment.create(
  name: 'Name project1_part1_task1_comment3',
  description: 'Description project1_part1_task1_comment3',
  user_id: user1.id,
  project_id: project1.id,
  part_id: project1_part1.id,
  task_id: project1_part1_task1.id
)