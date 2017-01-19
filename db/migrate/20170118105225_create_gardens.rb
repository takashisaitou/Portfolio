class CreateGardens < ActiveRecord::Migration[5.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :herb
      t.text :content
      t.integer :cropyields

      t.timestamps
    end
  end
end
