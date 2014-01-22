class ChangeColumnEvent < ActiveRecord::Migration
  def change
    remove_column :events, :active
    add_column :events, :active, :boolean, :after => 'end_time', :default => true
  end
end
