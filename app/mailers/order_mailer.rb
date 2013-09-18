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
    attachments.inline['mi-pedido.png'] = create_qr_code("http:www.elmundo.es")
    mail to: order.email, subject: "El Buen Gusto. Confirmación de pedido."
  end


  private

  def create_qr_code(url)
    # http://stackoverflow.com/questions/11992758/paperclip-and-local-image
    size   = RQRCode.minimum_qr_size_from_string(url)
    level  = :h
    qr = RQRCode::QRCode.new(url, :size => size, :level => level)
    svg    = RQRCode::Renderers::SVG::render(qr)
    image = MiniMagick::Image.read(svg) { |i| i.format "svg" }
    image.format "png"
    File.read(image.path)
  end
end
