class Orderlist < ApplicationRecord
	has_many :orderlist_cds, dependent: :destroy
	has_many :cds,through: :orderlist_cds, dependent: :destroy
	belongs_to :user
	validates :address, :address_number, :status, :user_id,  presence: true

end
