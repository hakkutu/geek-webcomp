class Orderlist < ApplicationRecord
	has_many :orderlist_cds
	has_many :cds,through: :orderlist_cds
	belongs_to :user
end
