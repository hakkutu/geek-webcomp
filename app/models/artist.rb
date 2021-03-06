class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :artist_favorites, dependent: :destroy
 has_many :users,through: :artist_favorites
 has_many :artist_comments, dependent: :destroy
 has_many :cds,through: :artist_comments
 has_many :cds,dependent: :destroy
 attachment :image

validates :name, :email,:postcode,:address,:phone_number,presence: true

  def favorited_by?(user)
	# 	binding.pry
 #    if self.artist_favorites.where(artist_id: self.id).exists?
 #    	artids=artist_favorites.where(artist_id:self.id)
 #  		artids.where(user_id: user.id).exists?
	# end
	self.artist_favorites.where(user_id: user.id).exists?
  end
end
