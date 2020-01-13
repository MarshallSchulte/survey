class AddRtStrategicSourcingToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :rt_strategic_sourcing, :bool
  end
end
