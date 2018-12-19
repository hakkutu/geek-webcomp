class Orderlist < ApplicationRecord
	has_many :cds,thorugh: :cds
	belongs_to :user
end
