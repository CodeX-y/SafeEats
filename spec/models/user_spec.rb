require "rails_helper"

RSpec.describe User, type: :model do

  it "is valid with a valid email" do
    user = User.new(email: "johndoe@example.com", password: "password", username: "johndoe")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(email: nil, password: "password", username: "johndoe")
    expect(user).not_to be_valid
  end

  it "is invalid with a duplicate email" do
    User.create(email: "johndoe@example.com", password: "password", username: "johndoe")
    duplicate_user = User.new(email: "johndoe@example.com", password: "password", username: "janedoe")
    expect(duplicate_user).not_to be_valid
  end

  it "is invalid without a password" do
    user = User.new(email: "johndoe@example.com", password: nil, username: "johndoe")
    expect(user).not_to be_valid
  end

  it "is valid with a valid username" do
    user = User.new(email: "johndoe@example.com", password: "password", username: "johndoe")
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(email: "johndoe@example.com", password: "password", username: nil)
    expect(user).not_to be_valid
  end
end
