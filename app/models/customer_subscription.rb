class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
  validates :start_date, presence: { require: true }
  enum status: [:active, :cancelled]
end
