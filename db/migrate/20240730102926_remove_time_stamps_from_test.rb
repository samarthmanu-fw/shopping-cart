class RemoveTimeStampsFromTest < ActiveRecord::Migration
  def change
    remove_column :tests, :created_at, :string
    remove_column :tests, :updated_at, :string
  end
end
