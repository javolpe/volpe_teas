class Tea < ApplicationRecord
  has_many :packages
  has_many :subscriptions, through: :packages
  validates :description, presence: { require: true }
  validates :temperature, presence: { require: true }
  validates :brew_time, presence: { require: true }
  validates :caffeine_mgs, presence: { require: true }
end
