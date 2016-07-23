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

  describe 'same username or email' do
    it "isn't valid if username is not unique" do
      user1 = User.new(username: 'user')
      user2 = User.new(username: 'user')
      expect(user2).not_to be_valid
    end

    it "isn't valid if email is not unique" do
      user1 = User.new(email: 'user@sfu.ca')
      user2 = User.new(email: 'user@sfu.ca')
      expect(user2).not_to be_valid
    end
  end

  describe 'valid user' do
    it "is valid when user has username, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'valid admin' do
    it "is valid when admin has username, email, password, password_confirmation, role" do
      admin = build(:admin)
      expect(admin).to be_valid
    end

    it "has the role admin" do
      admin = build(:admin)
      expect(admin.role).to eq('admin')
    end
  end
end
