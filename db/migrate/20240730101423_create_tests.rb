class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests, id: false do |t|
      t.string :id
      t.string :text

      t.timestamps null: false
    end
  end
end
