class Disc < ApplicationRecord
	has_many :songs, dependent: :destroy
	belongs_to :cd
	validates :disc_name, presence: true
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
end
