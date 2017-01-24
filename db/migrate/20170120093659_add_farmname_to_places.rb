class AddFarmnameToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :farmname, :string
  end
end
