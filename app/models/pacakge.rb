class Pacakge < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea
  validates :bags, presence: { require: true }
end
