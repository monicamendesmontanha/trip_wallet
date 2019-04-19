class Trip < ApplicationRecord
  belongs_to :destination
  has_many :expenses
end
