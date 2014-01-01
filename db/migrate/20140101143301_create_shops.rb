class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :company_id
      t.integer :shop_category_id
      t.integer :shop_detail_category_id
      t.string :name
      t.integer :prefecture
      t.integer :district
      t.string :address
      t.timestamps
    end
  end
end
