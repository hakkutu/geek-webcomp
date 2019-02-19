
class UserComment < ApplicationRecord
	belongs_to :user
	belongs_to :cd
	validates :body,  presence: true

end
