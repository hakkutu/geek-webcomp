class Cart < ApplicationRecord
	has_one :user
	has_many :cds,through: :cart_cds
end
