class CustSubscription
  attr_reader :id,
              :first_name,
              :user_id,
              :subscription_id,
              :title,
              :price,
              :frequency

  def initialize(customer, cust_sub, subscription)
    @id = cust_sub.id
    @user_id = customer.id
    @subscription_id = subscription.id
    @first_name = customer.first_name
    @title = customer.subscriptions.last.title
    @price = customer.subscriptions.last.price
    @frequency = subscription.frequency
  end
end