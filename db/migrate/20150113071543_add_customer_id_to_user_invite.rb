class AddCustomerIdToUserInvite < ActiveRecord::Migration
  def change
    add_column :user_invites, :customer_id, :integer
  end
end
