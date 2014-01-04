class CreateShopDetailTypes < ActiveRecord::Migration
  def change
    create_table :shop_detail_types do |t|
      t.integer :shop_category_id
      t.string :detail_tag_name
      t.timestamps
    end
  end
end
