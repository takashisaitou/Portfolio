class AddHerbnameToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :herbname, :string
  end
end
