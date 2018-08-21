require 'rails_helper'


RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: "test1", email:"teSt1@email.com", password: "password123", password_confirmation: "password123")
  end

  describe 'Validations' do

    it "is not valid if full name is blank" do
      @user.name = ''
      expect(@user.valid?).to be false
      end

    it "is not valid if email is blank" do
      @user.email = ''
      expect(@user.valid?).to be false
    end

    it "is not valid if password is not present" do
      @user.password = nil
      expect(@user.valid?).to be false
    end

    it "is not valid if password_confirmation is blank" do
      @user.password_confirmation = ''
      expect(@user.valid?).to be false
    end

    it "is not valid if email has required input" do
      @user.email = nil
      expect(@user.valid?).to be false
    end

    it "is not valid if password and password_confirmation field do not match" do
      # @user.password = "password"
      # @user.password_confirmation = "password"
      expect(@user.password_confirmation).to eq(@user.password)
    end

    it "is not valid if password is longer or equal to 6 characters" do
      # @user.password = "123"
      expect(@user.password.length).to be >= 6
    end
  end

  describe '.authenticate_with_credentials' do 
    context 'login submit' do 
      it 'if the email and password exist and match, login' do 
        @user1 = User.new email: 'test@email.com', password: 'password', password_confirmation: 'password', name: 'name'
        @user1.save!   
        expect(User.authenticate_with_credentials('test@email.com', 'password')).to eq(@user1)
        expect(User.authenticate_with_credentials('  test@email.com', 'password ')).to eq(@user1)

      end
    end
  end

end