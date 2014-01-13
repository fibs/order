class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :masa_no
      t.text :order
      t.integer :price

      t.timestamps
    end
  end
end
