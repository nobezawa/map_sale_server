class AddIndexDistrict < ActiveRecord::Migration
  def change
    add_index :districts, :district_name
  end
end
