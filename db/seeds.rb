# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

main_user = User.create(username: "TestUser", email: "test@test.com", password: "password")

3.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

other_users = User.where.not(username: "TestUser")

other_users.each do |other_user|
  main_user.following_users << other_user
end

other_users.each_with_index do |user, index|
  5.times do |i|
    post = Post.new(
      filter_name: Constants::Post::PHOTO_FILTER.sample,
      status: "published",
      user:,
      description: Faker::Lorem.sentences(number: 2).join(" "),
      x_offset: 0,
      y_offset: 0,
      width: 640,
      height: 640
    )
    post.photo.attach(io: File.open(Rails.root.join("db", "sample_images", "Stock_photo_#{((index*5) + i) + 1}.jpg")), filename: "Stock_photo_#{((index*5) + i) + 1}.jpg", content_type: "image/jpg")
    post.save!
  end
end
