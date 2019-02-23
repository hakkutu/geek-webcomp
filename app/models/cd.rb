class Cd < ApplicationRecord
	has_many :users,through: :cd_favorites
	has_many :user_comments, dependent: :destroy
	has_many :artist_comments, dependent: :destroy


	has_many :users,through: :user_comments
	has_many :artists,through: :artist_comments
	has_many :discs, dependent: :destroy
	has_many :orderlist_cds
	has_many :orderlists,through: :orderlist_cds
	has_many :carts,through: :cart_cds
	belongs_to :artist
	attachment :jacket
	has_many :cart_cds, dependent: :destroy
	has_many :songs, dependent: :destroy
	has_many :cd_favorites, dependent: :destroy
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	def favorited_by?(user)
	self.cd_favorites.where(user_id: user.id).exists?
  	end
  def self.search(search)
  	if search
  		Cd.where(['cd_name LiKe?',"%#{search}%"])
  	else
  		Cd.all
  	end
  end
end

