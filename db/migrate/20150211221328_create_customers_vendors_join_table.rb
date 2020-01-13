class CreateCustomersVendorsJoinTable < ActiveRecord::Migration
  def change
    create_table :customers_vendors, id: false do |t|
      t.integer :customer_id
      t.integer :vendor_id
    end
    
    add_index :customers_vendors, :customer_id
    add_index :customers_vendors, :vendor_id
  end
end
