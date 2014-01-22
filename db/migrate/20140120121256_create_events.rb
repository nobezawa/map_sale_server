class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :shop_id
      t.string :title
      t.text :summary
      t.string :discount_code
      t.datetime :start_date
      t.timestamp :start_time
      t.datetime :end_date
      t.timestamp :end_time
      t.timestamps
    end
    add_index :events, :shop_id
  end
end
