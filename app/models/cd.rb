class Cd < ApplicationRecord
	has_many :users,through: :cd_favorites
	has_many :users,through: :user_comments
	has_many :discs
	has_many :orderlists,through: :orderlist_cds
	has_many :carts,through: :cart_
	cds
	belongs_to :artist
	has_many :artists,through: :artist_comments
end

