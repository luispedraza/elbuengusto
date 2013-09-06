require 'spec_helper'

describe "Statics" do
  describe "Home page" do
	it "should have the content 'El Buen Gusto te da la bienvenida'" do
		visit '/static/home'
		expect(page).to have_content('El Buen Gusto te da la bienvenida') 
	end
  end
  describe "Help page" do
	it "should have the content 'Cómo utilizar este servicio'" do
		visit '/static/help'
		expect(page).to have_content('Cómo utilizar este servicio') 
	end
  end
  describe "About page" do
	it "should have the content 'Acerca de nuestra pastelería'" do
		visit '/static/about'
		expect(page).to have_content('Acerca de nuestra pastelería') 
	end
  end
end
