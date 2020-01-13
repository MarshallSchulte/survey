class AddSeniorSpecialistToUser < ActiveRecord::Migration
  def change
    add_column :users, :senior_specialist, :boolean
  end
end
