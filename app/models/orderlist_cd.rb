class OrderlistCd < ApplicationRecord
	belongs_to :cd
	belongs_to :orderlist

	validates :number, :price,  presence: true

end
