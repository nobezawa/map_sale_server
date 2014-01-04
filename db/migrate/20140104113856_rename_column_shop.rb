class RenameColumnShop < ActiveRecord::Migration
  def change
    rename_column :shops, :district, :district_id
    add_index :shops, :company_id
    add_index :shops, :shop_category_id
    add_index :shops, :shop_detail_type_id
    add_index :shops, :district_id
  end
end
