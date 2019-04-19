class AddSymbolToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :symbol, :string
  end
end
