class Song < ApplicationRecord
	belongs_to :disc

	validates :song_listen, :song_number, :song_name,  presence: true

end
