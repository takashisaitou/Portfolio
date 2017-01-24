class AddContentToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :content, :text
  end
end
