class AddOptionTypesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :opt1, :string
    add_column :questions, :opt2, :string
    add_column :questions, :opt3, :string
    add_column :questions, :opt4, :string
    add_column :questions, :opt5, :string
    add_column :questions, :opt6, :string
    add_column :questions, :opt7, :string
  end
end
