require 'spec_helper'

describe "product_images/show" do
  before(:each) do
    @product_image = assign(:product_image, stub_model(ProductImage,
      :cation => "Cation",
      :string => "String",
      :product_id => "Product",
      :integer => "Integer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cation/)
    rendered.should match(/String/)
    rendered.should match(/Product/)
    rendered.should match(/Integer/)
  end
end
