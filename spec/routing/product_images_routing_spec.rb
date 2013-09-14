require "spec_helper"

describe ProductImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_images").should route_to("product_images#index")
    end

    it "routes to #new" do
      get("/product_images/new").should route_to("product_images#new")
    end

    it "routes to #show" do
      get("/product_images/1").should route_to("product_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_images/1/edit").should route_to("product_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_images").should route_to("product_images#create")
    end

    it "routes to #update" do
      put("/product_images/1").should route_to("product_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_images/1").should route_to("product_images#destroy", :id => "1")
    end

  end
end
