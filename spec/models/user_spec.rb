require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "saves a user when all fields are filled correctly" do
      @user_count = User.all.count

      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.com",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      expect(User.all.count).to eq(@user_count + 1)
    end

    it "should give an error if no name is given" do
      @user = User.new(
        name: nil,
        email: "joe@bloe.com",
        password: "password",
        password_confirmation: "password"
      )
      @user.validate

      expect(@user.errors.full_messages).to include("Name can't be blank")

    end

    it "should give an error if no email is given" do
      @user = User.new(
        name: "Joe Bloe",
        email: nil,
        password: "password", 
        password_confirmation: "password"
      )

      @user.validate

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should give an error if no password is given" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: nil, 
        password_confirmation: "password"
      )

      @user.validate

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should give an error if no password confirmation is given" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "password", 
        password_confirmation: nil
      )

      @user.validate

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should give an error if email is not unique (not case sensitive)" do
      @user = User.new(
        name: "Joe Bloe",
        email: "JOE@BLOE.CA",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      @user2 = User.new(
        name: "Jane Doe",
        email: "joe@bloe.ca",
        password: "password",
        password_confirmation: "password"
      )

      @user2.validate

      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it "should give an error if password and password confirmation do not match (case sensitive)" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "PASSWORD",
        password_confirmation: "password"
      )

      @user.validate

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should give an error if password is less than 8 characters long" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "pass",
        password_confirmation: "pass"
      )
      
      @user.validate

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end

  describe ".authenticate_with_credentials" do

    it "should return a User instance when credentials are authenitcated" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      expect(@user).to eq(User.authenticate_with_credentials("joe@bloe.ca", "password"))
    end

    it "should authenticate email regardless of case or leading/trailing white space" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      expect(@user).to eq(User.authenticate_with_credentials("  JOE@bloe.ca  ", "password"))
    end

    it "should fail authentication when given the wrong email" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      expect(User.authenticate_with_credentials("joseph@bloe.ca", "notpassword")).to eq(nil)
    end

    it "should fail authentication when given the wrong password" do
      @user = User.new(
        name: "Joe Bloe",
        email: "joe@bloe.ca",
        password: "password",
        password_confirmation: "password"
      )

      @user.save!

      expect(User.authenticate_with_credentials("joe@bloe.ca", "notpassword")).to eq(nil)
    end

  end
end
