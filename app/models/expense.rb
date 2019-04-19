class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :expense_category
end
