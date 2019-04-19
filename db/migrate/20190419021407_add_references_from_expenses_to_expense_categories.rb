class AddReferencesFromExpensesToExpenseCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :expense_category_id, :integer
    add_foreign_key :expenses, :expense_categories
  end
end
