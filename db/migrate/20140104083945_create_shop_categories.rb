class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.string :type_name
      t.timestamps
    end
  end
end
