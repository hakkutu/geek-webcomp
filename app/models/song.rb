class Song < ApplicationRecord
	belongs_to :disc

	validates   :song_name,  presence: true

end
