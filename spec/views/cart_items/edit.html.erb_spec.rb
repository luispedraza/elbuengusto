require 'spec_helper'

describe "cart_items/edit" do
  before(:each) do
    @cart_item = assign(:cart_item, stub_model(CartItem,
      :product_id => 1,
      :cart_id => 1
    ))
  end

  it "renders the edit cart_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cart_item_path(@cart_item), "post" do
      assert_select "input#cart_item_product_id[name=?]", "cart_item[product_id]"
      assert_select "input#cart_item_cart_id[name=?]", "cart_item[cart_id]"
    end
  end
end
