class CustomerSubscriptionFacade
  def self.create_poro (customer, customer_sub, subscription)
    cust_sub = CustSubscription.new(customer, customer_sub, subscription)
  end

  def self.index(customer)
    cust_subscriptions = []
    customer.customer_subscriptions.each do |cust_sub|
      cust_subscriptions << CustomerSubscriptionFacade.create_poro(customer, cust_sub, cust_sub.subscription)
    end
    cust_subscriptions
  end
end