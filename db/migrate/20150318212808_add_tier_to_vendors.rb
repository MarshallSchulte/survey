class AddTierToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :tier, :integer
  end
end
