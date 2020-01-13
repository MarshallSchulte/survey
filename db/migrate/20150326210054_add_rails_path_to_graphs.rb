class AddRailsPathToGraphs < ActiveRecord::Migration
  def change
    add_column :graphs, :rails_path, :string
  end
end
