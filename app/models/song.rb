class Song < ApplicationRecord
	belongs_to :disc
	validates   :song_name,  presence: true
	belongs_to :cd
end
