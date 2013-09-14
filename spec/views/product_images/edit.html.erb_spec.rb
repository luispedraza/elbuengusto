require 'spec_helper'

describe "product_images/edit" do
  before(:each) do
    @product_image = assign(:product_image, stub_model(ProductImage,
      :cation => "MyString",
      :string => "MyString",
      :product_id => "MyString",
      :integer => "MyString"
    ))
  end

  it "renders the edit product_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_image_path(@product_image), "post" do
      assert_select "input#product_image_cation[name=?]", "product_image[cation]"
      assert_select "input#product_image_string[name=?]", "product_image[string]"
      assert_select "input#product_image_product_id[name=?]", "product_image[product_id]"
      assert_select "input#product_image_integer[name=?]", "product_image[integer]"
    end
  end
end
