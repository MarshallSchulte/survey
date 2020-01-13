class CreateCassociations < ActiveRecord::Migration
  def change
    create_table :cassociations, id: false do |t|
      t.integer :customer_id
      t.integer :ctype_id

      t.timestamps
    end
    add_index :cassociations, :customer_id
    add_index :cassociations, :ctype_id
  end
end
