class AddZipToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :zipcode, :integer
  end
end
