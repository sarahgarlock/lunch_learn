# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = FactoryBot.create(:user, password: 'password1', password_confirmation: 'password1', api_key: '123456789')

user2 = FactoryBot.create(:user, password: 'password2', password_confirmation: 'password2', api_key: '987654321')

user3 = FactoryBot.create(:user, password: 'password3', password_confirmation: 'password3', api_key: '234567890')