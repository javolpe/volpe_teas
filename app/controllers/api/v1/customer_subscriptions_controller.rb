class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create 
    customer = Customer.find(params[:customer_id])
    @new_sub = customer.customer_subscriptions.new(subscription_id: params[:subscription_id])
    if @new_sub.save
      cust_sub = CustSubscription.new(customer, @new_sub, Subscription.find(params[:subscription_id]))
      created_cust_sub = CustomerSubscriptionSerializer.new(cust_sub)
      render json: created_cust_sub
    else
      invalid_params
    end
  end

  def update 
   cust_sub = CustomerSubscription.find(params[:id])
   cust_sub.update!(status: 1)
   
   updated_cust_sub = CustSubscription.new(Customer.find(params[:customer_id]), cust_sub, Subscription.find(cust_sub.subscription_id))
   cancelled_cust_sub = CustomerSubscriptionSerializer.new(updated_cust_sub)
   render json: cancelled_cust_sub
  end
end