class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = 1500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
      )
    redirect_to root_url

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
