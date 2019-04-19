class RemoveCategoryIdFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :category_id
  end
end
