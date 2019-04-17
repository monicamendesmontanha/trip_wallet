class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :currency
      t.decimal :exchange_rate

      t.timestamps
    end
  end
end
