require 'rails_helper'

RSpec.describe Listing, type: :model do
  it "fails at creating a listing without required fields" do

    expect{ Listing.create!(title: "Example Listing") }.to raise_error(ActiveRecord::RecordInvalid)
    # expect(Listing.find_by_title("Example Listing")).to eq(listing)
  end

   it "successfully creates listing" do
   	user = User.create!(
   				name: "Alex Rock",
   				zipcode: "12345",
   				email: "me@alexjrock.com",
   				password: "12345678")

   	category = Category.create!(name: "Cars")

   	listing = Listing.create!(
   				title: "Example Listing", 
   				description: "Example Description", 
   				price: "100", 
   				user: user,
   				category: category)

    expect( Listing.find_by_title("Example Listing") ).to eq(listing)
    expect( listing.user.name ).to eq("Alex Rock")
  end

  it "attaches User to listing" do
   	user = User.create!(
   				name: "Alex Rock",
   				zipcode: "12345",
   				email: "me@alexjrock.com",
   				password: "12345678")

   	category = Category.create!(name: "Cars")

   	listing = Listing.create!(
   				title: "Example Listing", 
   				description: "Example Description", 
   				price: "100", 
   				user: user,
   				category: category)
   	
    expect( listing.user.name ).to eq("Alex Rock")
  end
end