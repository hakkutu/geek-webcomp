class Cart < ApplicationRecord
	has_one :user
	has_many :cds,through: :cart_cds
	has_many :cart_cds
end
