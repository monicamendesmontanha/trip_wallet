class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.text :notes
      t.date :expense_date
      t.integer :category_id
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
