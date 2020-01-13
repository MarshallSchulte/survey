class AddCwToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :cw, :integer
  end
end
