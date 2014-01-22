class AddColumnEvents < ActiveRecord::Migration
  def change
    add_column :events, :active, :boolean, :after => 'end_time'
  end
end
