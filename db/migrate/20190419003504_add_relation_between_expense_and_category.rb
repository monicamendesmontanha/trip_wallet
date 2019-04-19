class AddRelationBetweenExpenseAndCategory < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :expenses, :expense_categories
  end
end
