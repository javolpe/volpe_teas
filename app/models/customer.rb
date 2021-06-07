class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  validates :email, presence: { require: true }
  validates :first_name, presence: { require: true }
  validates :last_name, presence: { require: true }
  validates :street, presence: { require: true }
  validates :city, presence: { require: true }
  validates :state, presence: { require: true }\
  validates :zip, presence: { require: true }
end
