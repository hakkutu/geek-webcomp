class Orderlist < ApplicationRecord
	has_many :orserlist_cds
	has_many :cds,through: :orserlist_cds
	belongs_to :user
	validates :address, :address_number, :status, :user_id,  presence: true

end
