class AddHerbToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :herb, :string
  end
end
