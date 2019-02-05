require 'rails_helper'

RSpec.describe Potin, type: :model do

  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe")
    @potin = Potin.create(title: "prout", content: "prout", user_id: User.first)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@potin).to be_a(Potin)
      
    end

    describe "#title" do
      it "should not be valid without title" do
        expect(@potin.title).to eq("prout")
      end
    end

    describe "#content" do
      it "should not be valid without content" do
        expect(@potin.content).to eq("prout")
      end
    end
end
end