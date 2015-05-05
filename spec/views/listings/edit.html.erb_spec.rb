require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => "MyString",
      :description => "MyText",
      :price => 1,
      :status => 1,
      :user => nil,
      :category => nil
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input#listing_title[name=?]", "listing[title]"

      assert_select "textarea#listing_description[name=?]", "listing[description]"

      assert_select "input#listing_price[name=?]", "listing[price]"

      assert_select "input#listing_status[name=?]", "listing[status]"

      assert_select "input#listing_user_id[name=?]", "listing[user_id]"

      assert_select "input#listing_category_id[name=?]", "listing[category_id]"
    end
  end
end
