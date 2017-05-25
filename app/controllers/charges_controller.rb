require 'stripe'
class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: @amount
    }
    
  end
  
  def create
    @amount = 1500
    
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    
    charge = Stripe::Subscription.create(
      customer: customer.id,
      plan: 'premium_membership'
    )
    
    current_user.update(customer_id: customer.id)
    # current_user.update(subscription_id: id)
    current_user.update(role: 1)
    
    flash[:notice] = "Thank you for upgrading to a premium account, #{current_user.email}!"
    redirect_to root_path
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  def destroy
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    customer = Stripe::Customer.retrieve(current_user.customer_id)
    sub = customer.subscriptions.first
    sub.delete
    
    current_user.update(role: 0)
    current_user.update(customer_id: 'nil')
    Wiki.where(user_id: current_user, private: true).update(private: false)
    
    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public."
    redirect_to root_path
  end
end