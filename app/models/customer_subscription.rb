class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
  validates :customer_id, presence: { require: true }
  validates :subscription_id, presence: { require: true }
  validates :status, presence: { require: true }
  enum status: [:active, :cancelled]
end
