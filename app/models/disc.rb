class Disc < ApplicationRecord
	has_many :songs
	belongs_to :cd
	accepts_nested_attributes_for :cds,allow: true
end
