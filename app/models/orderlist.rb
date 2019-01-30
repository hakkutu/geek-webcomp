class Orderlist < ApplicationRecord
	has_many :orserlist_cds
	has_many :cds,through: :orserlist_cds
	belongs_to :user
end
