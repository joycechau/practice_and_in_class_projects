class AddTimestampsToUser < ActiveRecord::Migration
  def change
    add_column :users, :timestamps, :datetime
  end
end
