class AddRtGovernanceToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :rt_governance, :bool
  end
end
