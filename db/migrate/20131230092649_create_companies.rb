class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :prefecture
      t.string :address1
      t.string :address2
      t.string :tel
      t.string :email
      t.timestamps
    end
  end
end
