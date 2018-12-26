class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :users,through: :artist_favorites
 has_many :cds,through: :artist_comments
 has_many :artists
 has_many :artist_favorites
 has_many :artist_comments
end
