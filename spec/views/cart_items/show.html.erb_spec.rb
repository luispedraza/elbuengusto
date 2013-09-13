require 'spec_helper'

describe "cart_items/show" do
  before(:each) do
    @cart_item = assign(:cart_item, stub_model(CartItem,
      :product_id => 1,
      :cart_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
