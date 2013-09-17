class OrderMailer < ActionMailer::Base
  default from: "luispedraza@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirmation.subject
  #

  def confirmation(order)
    logger.debug ActionMailer::Base.smtp_settings
    @order = order
    mail to: order.email, subject: "El Buen Gusto. Confirmación de pedido."
  end
end
