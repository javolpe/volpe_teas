class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create 
    customer = Customer.find(params[:customer_id])
    @new_sub = customer.customer_subscriptions.new(subscription_id: params[:subscription_id])
    if @new_sub.save
      cust_sub = CustSubscription.new(customer)
      created_cust_sub = CustomerSubscriptionSerializer.new(cust_sub)
      render json: created_cust_sub
    else
      invalid_params
    end
  end
end