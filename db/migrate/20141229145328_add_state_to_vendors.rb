class AddStateToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :state, :string
  end
end
