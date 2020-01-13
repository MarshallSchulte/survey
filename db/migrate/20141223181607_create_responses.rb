class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :reviewer_id
      t.integer :answer_option
      t.text :comment

      t.timestamps
    end
  end
end
