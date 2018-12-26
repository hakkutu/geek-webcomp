class Song < ApplicationRecord
	belongs_to :disc
	accepts_nested_attributes_for :cds,allow: true
end
