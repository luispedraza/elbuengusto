# Load the Rails application.
require File.expand_path('../application', __FILE__)



Elbuengusto::Application.configure do
# Servidor de correo saliente
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
	address:            'smtp.gmail.com',
	port:               587,
	domain:             'elbuengusto.com',
	user_name:          ENV['GMAIL_USERNAME'],
	password:           ENV['GMAIL_PASSWORD'],
	# user_name:          "luispedraza@gmail.com",
	# password:           "caramon1977",
	authentication:     'plain',
	enable_starttls_auto: true 
}
end


# Initialize the Rails application.
Elbuengusto::Application.initialize!