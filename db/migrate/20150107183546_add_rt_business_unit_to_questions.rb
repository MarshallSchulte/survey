class AddRtBusinessUnitToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :rt_business_unit, :bool
  end
end
