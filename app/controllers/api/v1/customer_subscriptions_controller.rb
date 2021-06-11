class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create 
    customer = Customer.find(params[:customer_id])
    @new_sub = customer.customer_subscriptions.new(subscription_id: params[:subscription_id])
    if @new_sub.save
      cust_sub = CustomerSubscriptionFacade.create_poro(customer, @new_sub, @new_sub.subscription)
      render json: CustomerSubscriptionSerializer.new(cust_sub)
    else
      invalid_params
    end
  end

  def index 
    customer = Customer.find(params[:customer_id])
    if customer.customer_subscriptions.empty?
      render json: { message: "no customer subscriptions" }
    else
      all_subscriptions = CustomerSubscriptionFacade.index(customer)
      render json: CustomerSubscriptionSerializer.new(all_subscriptions)
    end
  end

  def update
   cust_sub = CustomerSubscription.find(params[:id])
   cust_sub.update!(status: params[:status])
   updated_cust_sub = CustomerSubscriptionFacade.create_poro(cust_sub.customer, cust_sub, cust_sub.subscription)
   render json: CustomerSubscriptionSerializer.new(updated_cust_sub)
  end


  private
  def customer_id_param
    params.permit(:customer_id, :subscription_id)
  end
end