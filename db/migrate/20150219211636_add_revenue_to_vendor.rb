class AddRevenueToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :revenue, :integer
  end
end
