class Shop < ActiveRecord::Base
  belongs_to :company
  belongs_to :shop_category
  belongs_to :shop_detail_type
  belongs_to :district
  has_many :shops
end
