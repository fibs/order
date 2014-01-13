class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :masa_no

      t.timestamps
    end
  end
end
