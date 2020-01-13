class Vassociation < ActiveRecord::Base
  belongs_to :vendor, foreign_key: :vendor_id
  belongs_to :vtype, foreign_key: :vtype_id
end
