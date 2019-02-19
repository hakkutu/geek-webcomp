class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :cd
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
	validates :disc_name,  presence: true
end
