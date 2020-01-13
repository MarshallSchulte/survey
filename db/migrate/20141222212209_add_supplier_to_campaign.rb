class AddSupplierToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :supplier_name, :string
  end
end
