# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user1 = FactoryBot.create(:user, email: 'sarah@gmail.com', password: 'password1', password_confirmation: 'password1', api_key: 'jgn983hy48thw9begh98h4539h4')

user2 = FactoryBot.create(:user, password: 'password2', password_confirmation: 'password2', api_key: '987654321')

user3 = FactoryBot.create(:user, password: 'password3', password_confirmation: 'password3', api_key: '234567890')

favorite1 = {
  user_id: @user1.id,
  api_key: "jgn983hy48thw9begh98h4539h4",
  country: "thailand",
  recipe_link: "https://www.tastingtable.com/.....",
  recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
}

favorite2 = {
  api_key: "jgn983hy48thw9begh98h4539h4",
  country: "nederland",
  recipe_link: "https://www.tastingtable.com/.....",
  recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
}