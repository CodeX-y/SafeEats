desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  if Rails.env.development?
    User.destroy_all
  end

  # Default user
  User.create(email: "alice@example.com", username: "Alice", password: "password")
end
