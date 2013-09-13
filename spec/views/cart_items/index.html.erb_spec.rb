require 'spec_helper'

describe "cart_items/index" do
  before(:each) do
    assign(:cart_items, [
      stub_model(CartItem,
        :product_id => 1,
        :cart_id => 2
      ),
      stub_model(CartItem,
        :product_id => 1,
        :cart_id => 2
      )
    ])
  end

  it "renders a list of cart_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end