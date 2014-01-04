class ChangeColumNameShop < ActiveRecord::Migration
  def change
    rename_column :shops, :shop_detail_category_id, :shop_detail_type_id
  end
end
