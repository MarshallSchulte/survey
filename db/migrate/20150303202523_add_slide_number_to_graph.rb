class AddSlideNumberToGraph < ActiveRecord::Migration
  def change
    add_column :graphs, :slide_number, :string
  end
end
