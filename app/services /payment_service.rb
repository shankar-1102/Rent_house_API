class PaymentService
  def initialize(user)
    @user = user
  end

  def create_payment_link
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    payment_link = Stripe::PaymentLink.create({
      line_items: [{
        price: 'price_1O3OmlSAGfg5TPND5ekkNvLy',
        quantity: 1,
      }],
      # success_url: root_path
    })

    payment_link.url
  end
end