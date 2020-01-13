class AddRtSupplierDiversityToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :rt_supplier_diversity, :bool
  end
end
