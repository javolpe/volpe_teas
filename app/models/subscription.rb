class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :users, through: :customer_subscriptions
  has_many :packages
  has_many :teas, through: :packages
  validates :price, presence: { require: true }
  validates :title, presence: { require: true }
  validates :frequency, presence: { require: true }
  enum status: [:active, :cancelled]
end
