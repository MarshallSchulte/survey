class CreateUserInvites < ActiveRecord::Migration
  def change
    create_table :user_invites do |t|
      t.string :first
      t.string :last
      t.string :email
      t.boolean :invited

      t.timestamps
    end
  end
end
