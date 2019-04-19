class Trip < ApplicationRecord
  belongs_to :destination
  has_many :expenses

  validates :name, presence: true
  validates :budget, numericality: true
end
