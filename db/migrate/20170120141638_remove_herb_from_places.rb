class RemoveHerbFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :herb, :string
  end
end
