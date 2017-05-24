class DowngradeController < ApplicationController
  def new
  end
  
  def create
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    subscription = Stripe::Subscription.retrieve('sub_AiYGQU9T6UWFtT')
    subscription.delete
    
    current_user.update(role: 0)
    Wiki.where(user_id: current_user, private: true).update(private: false)
    
    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public."
    redirect_to root_path
  end
end