class CustomerSubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :user_id, :subscription_id, :title, :price, :frequency, :status
end
