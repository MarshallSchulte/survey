class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :vtype
      t.integer :size

      t.timestamps
    end
  end
end
