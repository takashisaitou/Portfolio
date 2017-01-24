class RemoveFarmnameFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :farmname, :string
  end
end
