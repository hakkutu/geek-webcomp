class CartCd < ApplicationRecord
	belongs_to :cd
	belongs_to :cart
	validates :number,  presence: true,numericality: { only_integer: true,greater_than: 0}

end
