class RemoveTimestampsColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :timestamps
  end
end
