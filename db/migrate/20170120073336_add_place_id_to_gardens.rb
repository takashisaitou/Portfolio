class AddPlaceIdToGardens < ActiveRecord::Migration[5.0]
  def change
    add_column :gardens, :place_id, :integer
  end
end
