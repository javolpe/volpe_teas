class Subscription < ApplicationRecord
  validates :price, presence: { require: true }
  validates :title, presence: { require: true }
  validates :status, presence: { require: true }
  validates :frequency, presence: { require: true }
end
