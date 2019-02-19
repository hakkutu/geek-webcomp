class Cart < ApplicationRecord
	has_one :user

	has_many :cds,through: :cart_cds, dependent: :destroy
	has_many :cart_cds, dependent: :destroy
end
