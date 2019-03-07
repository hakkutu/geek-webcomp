class OrderlistCd < ApplicationRecord
	belongs_to :cd
	belongs_to :orderlist

	validates :number, :price,  presence: true,numericality: { only_integer: true,greater_than: 0}

end
