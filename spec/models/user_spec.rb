require 'rails_helper'

RSpec.describe User, :type => :model do
  it "isn't valid without username" do
    user = User.new
    user.username = nil
    expect(user).not_to be_valid
  end

  it "isn't valid without email" do
    user = User.new
    user.email = nil
    expect(user).not_to be_valid
  end

  it "isn't valid without password" do
    user = User.new
    user.password = nil
    expect(user).not_to be_valid
  end

  it "isn't valid without password_confirmation" do
    user = User.new
    user.password_confirmation = nil
    expect(user).not_to be_valid
  end
end
