desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"
  
  if Rails.env.development?
    FollowRequest.destroy_all
    Comment.destroy_all
    Like.destroy_all
    Photo.destroy_all
    User.destroy_all
  do

  12.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
      private: [true, false].sample,
    )
  end

  p "There are now #{User.count} users."
end
