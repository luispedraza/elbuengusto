require 'spec_helper'

describe "product_images/index" do
  before(:each) do
    assign(:product_images, [
      stub_model(ProductImage,
        :cation => "Cation",
        :string => "String",
        :product_id => "Product",
        :integer => "Integer"
      ),
      stub_model(ProductImage,
        :cation => "Cation",
        :string => "String",
        :product_id => "Product",
        :integer => "Integer"
      )
    ])
  end

  it "renders a list of product_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cation".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
  end
end
