require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        expect(@user.first_name).to eq("John")
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        expect(@user.last_name).to eq("Doe")
      end
    end
end
end