class Vtype < ActiveRecord::Base
  has_and_belongs_to_many :vendors, join_table: :vassociations
  validates :name, presence: true
end
