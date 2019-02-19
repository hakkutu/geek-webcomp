class ArtistComment < ApplicationRecord
	belongs_to :artist
	belongs_to :cd
	validates :body, presence: true
end
