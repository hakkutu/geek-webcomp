class Disc < ApplicationRecord
	has_many :songs
	belongs_to :cd
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end
