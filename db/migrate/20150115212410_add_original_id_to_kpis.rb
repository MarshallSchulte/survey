class AddOriginalIdToKpis < ActiveRecord::Migration
  def change
    add_column :kpis, :original_kpi_id, :integer
  end
end
