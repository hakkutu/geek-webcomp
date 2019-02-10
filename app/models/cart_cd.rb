class CartCd < ApplicationRecord
	belongs_to :cd
	belongs_to :cart
end
