require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'validates user saves' do

      user = User.new({firstname: "Andy", lastname: "Bob", email: "andy123@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      user.save!

      expect(user.id).to be_present

    end

    it 'validates :password and :password_confirmation are the same' do
      user = User.new({firstname: "Andy", lastname: "B", email: "andy123@gmail.com", password: "bluejays", password_confirmation: "redjays"})

      user.save

      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it 'validates :email is unique' do
      user1 = User.new({firstname: "Andy", lastname: "Bob", email: "andy123@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      user1.save!

      user2 = User.new({firstname: "Andy", lastname: "Bob", email: "andy123@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      user2.save!

      expect(user2.id).to be_present

    end

    it 'validates :firstname, presence:true' do
      user = User.new({firstname: nil, lastname: "Andy", email: "andy123@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      user.save

      expect(user.errors.full_messages).to include("Firstname can't be blank")

    end

    it 'validates :lastname, presence: true' do
      user = User.new({firstname: "Andy", lastname: nil, email: "andy123@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      user.save

      expect(user.errors.full_messages).to include("Lastname can't be blank")

    end

    it 'validates :email, presence: true' do
      user = User.new({firstname: "Andy", lastname: "B", email: nil, password: "bluejays", password_confirmation: "bluejays"})

      user.save

      expect(user.errors.full_messages).to include("Email can't be blank")

    end

    it 'validates :password must be a minimum of 8 characters' do
      user = User.new({firstname: "Andy", lastname: "B", email: "andy123@gmail.com", password: "blue", password_confirmation: "blue"})

      user.save

      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'validates correct user is returned' do
      userA = User.new({firstname: "Andy", lastname: "Bob", email: "andy987@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      userA.save!

      userB = userA.authenticate_with_credentials("andy987@gmail.com", "bluejays")

      expect(userA.id).to eq(userB.id)
    end

    it 'validates extra spaces still work' do
      userA = User.new({firstname: "Andy", lastname: "Bob", email: "andy456@gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      userA.save!

      userB = userA.authenticate_with_credentials("  andy456@gmail.com  ", "bluejays")

      expect(userA.id).to eq(userB.id)
    end

    it 'validates not case sensitive' do
      userA = User.new({firstname: "Andy", lastname: "Bob", email: "andy789@Gmail.com", password: "bluejays", password_confirmation: "bluejays"})

      userA.save!

      userB = userA.authenticate_with_credentials("ANDY789@gmail.com", "bluejays")

      expect(userA.id).to eq(userB.id)
    end
  end

end
