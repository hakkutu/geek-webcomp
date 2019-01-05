class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 belongs_to :user
 has_many :artist_favorites, through: :user
 has_many :user
 has_many :cds,through: :artist_comments
 has_many :artists

end
