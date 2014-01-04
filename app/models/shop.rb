class Shop < ActiveRecord::Base
  belongs_to :company
  belongs_to :shop_category
end
