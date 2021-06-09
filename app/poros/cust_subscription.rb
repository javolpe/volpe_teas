class CustSubscription
  attr_reader :id,
              :first_name,
              :user_id,
              :subscription_id,
              :title,
              :price,
              :frequency

  def initialize(customer)
    @id = customer.customer_subscriptions.last.id
    @user_id = customer.id
    @subscription_id = customer.subscriptions.last.id
    @first_name = customer.first_name
    @title = customer.subscriptions.last.title
    @price = customer.subscriptions.last.price
    @frequency = customer.subscriptions.last.frequency
  end
end