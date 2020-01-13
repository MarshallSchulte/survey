class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :poc_first_name
      t.string :poc_last_name
      t.string :poc_email
      t.string :poc_phone
      t.string :ctype
      t.integer :size

      t.timestamps
    end
  end
end
