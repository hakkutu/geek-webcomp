class Cart < ApplicationRecord
	belongs_to :user
	has_many :cds,through: :cart_cds
end
