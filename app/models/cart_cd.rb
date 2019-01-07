class CartCd < ApplicationRecord
	belongs_to :cds
	belongs_to :carts
end
