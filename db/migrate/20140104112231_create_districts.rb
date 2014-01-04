class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :prefecture
      t.string :district_name
      t.timestamps
    end
    add_index :districts, :prefecture
  end
end
