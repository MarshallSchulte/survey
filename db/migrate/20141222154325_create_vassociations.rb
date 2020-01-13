class CreateVassociations < ActiveRecord::Migration
  def change
    create_table :vassociations do |t|
      t.integer :vendor_id
      t.integer :vtype_id

      t.timestamps
    end
    add_index :vassociations, :vendor_id
    add_index :vassociations, :vtype_id
  end
end
